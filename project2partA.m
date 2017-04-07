clc; clear all; close all;
%% Estimate pi by the area method
n=input('Number of points: ');
x=rand(n,1);
y=rand(n,1);
figure('color','white');
hold all

axis square;
x1=x-0.5;
y1=y-0.5; %cirle has centre at (0.5,0.5)
r=x1.^2+y1.^2;
m=0;   %Number of points inside circle
for i=1:n
    if r(i)<=0.25
        m=m+1;
        plot(x(i),y(i),'b.');
    else

        plot(x(i),y(i),'r.');
    end
end
pi=m/(0.25*n)
%% Draw a graph of the successive values of the estimator as the number increase
n=10000;
x=rand(n,1);
y=rand(n,1);

figure(2)
x_axis = linspace(1,10000,10000)
pi = zeros(1,n);

x1=x-0.5;
y1=y-0.5; %cirle has centre at (0.5,0.5)
r=x1.^2+y1.^2;
m=0;   %Number of points inside circle
for i=1:n
    if r(i)<=0.25
        m=m+1;         
    else m=m;        
    end
    pi(i)=m/(0.25*i);
end

plot(x_axis,pi)