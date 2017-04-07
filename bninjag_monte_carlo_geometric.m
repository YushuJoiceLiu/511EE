% written by StudentDave
%for licensing and usage questions
%email scienceguy5000 at gmail. com

%bayesian ninja, cool application of monte carlo to solve
%geometric problems: approximate pi using square and circle and MC

%we will simulate a square with a cirlce inscribing it. (it's centered at
%(0,0) and x = 1.
%The square area = x^2, and the circle area = pi*(x/2)^2 =
%(pi*x^2)/4, thus the ratio of circle to square is equal to pi/4. thus if
%we can get the ratio, and multiply it  by 4, we will have the value of pi.
%to get this ratio, this code will randomly place a point inside the
%geometric object and see where each point lands.  as the number of random
%placments increases, we'll get closer and closer to the ratio.


%% Monte Carlo iterative method for visualization: even sampling
Rn = 100 %the number of times you place a random number inside the object
Ncircle = []; %initialize the counting of the number of times the point lands inside the circle
dist_n = []

%plot the circle inscribed in a square ---------------------

figure(1)
clf % clear the  current figure
syms C % make a symbolic variable that we'll put into ezplot
x=cos(C); % store it into it's function of interest
y=sin(C);
R = [ 0 2*pi]; % define the range
subplot(211)
h=ezplot(x,y,[R]); % ezplot gives you easy way to plot functions..such as cos and sin :)
hold on

for t = 1:Rn
    
%generate Rn random trials with x and y coordinates that are with the
%square (it's 2 by 2 square centered at the origin)

%this is general formula for randomization over a range [a,b]
a = -1;
b = 1;
Xn = a + (b-a).*rand(1);
Yn = a + (b-a).*rand(1);

%find if the points are inside the circle, by calculating distance from
%center
dist_n(t) = Xn.^2 + Yn.^2; % Find its distance from origin
subplot(211);
plot(Xn,Yn,'.r','markersize',20);

%if dist is greater than 1, then it's clearly outside the circle, count
%these values
Ncircle(t) = sum(dist_n(1:t) <=1);

%calculate the estimate of pi
est_pi= 4*Ncircle(1:t)./(1:t);

subplot(212);
plot(est_pi,'.-k','linewidth',5,'markersize',20);
title(['N = ',num2str(t),'    ESTIMATE OF PI = ', num2str(est_pi(end))]);
ylabel('estimate of pi')
xlabel('iteration')
pause
end
hold off




%% Monte Carlo iterative method for visualization: gaussian sampling
Rn = 100 %the number of times you place a random number inside the object
Ncircle = []; %initialize the counting of the number of times the point lands inside the circle
dist_n = []

%plot the circle inscribed in a square ---------------------

figure(1)
clf % clear the  current figure
syms C % make a symbolic variable that we'll put into ezplot
x=cos(C); % store it into it's function of interest
y=sin(C);
R = [ 0 2*pi]; % define the range
subplot(211)
h=ezplot(x,y,[R]); % ezplot gives you easy way to plot functions..such as cos and sin :)
hold on

for t = 1:Rn
    
%generate Rn random trials with x and y coordinates that are with the
%square (it's 2 by 2 square centered at the origin)

%sampling from a gaussian distribution------
% n iterations of sampling from a normal gaussian distribution 
% N(mu,sigma^2) here, we sample around zero, from about -1 to 1
mu = 0
sigma = .25
Xn = mu+sigma.*randn(1); 
Yn = mu+sigma.*randn(1); 

%find if the points are inside the circle, by calculating distance from
%center
dist_n(t) = Xn.^2 + Yn.^2; % Find its distance from origin
subplot(211);
plot(Xn,Yn,'.r','markersize',20);

%if dist is greater than 1, then it's clearly outside the circle, count
%these values
Ncircle(t) = sum(dist_n(1:t) <=1);

%calculate the estimate of pi
est_pi= 4*Ncircle(1:t)./(1:t);

subplot(212);
plot(est_pi,'.-k','linewidth',5,'markersize',20);
title(['N = ',num2str(t),'   ESTIMATE OF PI = ', num2str(est_pi(end))]);
ylabel('estimate of pi')
xlabel('iteration')
pause
end
hold off



%% effects of different Rn values simulated many times
%if we change the number of randomized samples, we'll not only get a
%different, more exact approximation of pi, but the distribution of values
%will get smaller. lets illustrate this:

%generate histogram and get peak value

clf
t = 1000; %number of times to run the simulation
Rn = 100;  % change this value to see differences (e.g. 1000, 10000 ..etc)
Ncircle = []; 
est_pi= zeros(1,t);
for i = 1:t
    Ncircle = [];
    Xn = rand(Rn,1);
    Yn = rand(Rn,1);
    dist = Xn.^2 + Yn.^2;
    Ncircle = sum(dist <=1);   
    est_pi(i)= 4*Ncircle/Rn;
end
hist(est_pi,50)
axis([2 4 0 100])


%% Monte Carlo  non-iterative method for rapid testing
Rn = 10 %the number of times you place a random number inside the object
Ncircle = []; %initialize the counting of the number of times the point lands inside the circle

%generate Rn random trials with x and y coordinates that are with the
%square (it's 1 by 1 square at origin)
Xn = rand(Rn,1)
Yn = rand(Rn,1)

%find if the points are inside the circle, by calculating distance from
%center
dist = Xn.^2 + Yn.^2 % Find its distance from origin

%if dist is greater than 1, then it's clearly outside the circle, count
%these values
Ncircle = sum(dist <=1)

%calculate the estimate of pi
est_pi= 4*Ncircle/Rn

