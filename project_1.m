%close all;clear all;clc;
%generate large sequence of random numbers
%random_sequence=5*rand(1000);%produce a 1000 sequence of random between 0 and 5
%random_value_mean=mean(mean(random_sequence))%get the mean of this 1000 sequence
%var=(std2(random_sequence))^2
%%
%i)
%part 1
% part 1
close all;clear all;clc;
fprintf('This is Part 1: \n');
u = ones(100, 1) / 100; % produce uniform distribution curve 
for count = 2:4 % test 100, 1000, 10000 random numbers sequence     
    fprintf('Sequence of %d random numbers from (0, 1).\n', 10^count);     
    rands = rand(10^count, 1); % generate random numbers sequence     
    fprintf('Mean: %f. Variance: %f.\n', mean(rands), std2(rands)^2);%calculate mean and variance     
    figure;  %will plot 3 figures and don't need to set figure one-by-one 
    [nelements, centers] = hist(rands,100); % generate histogram     
    bar(centers, nelements / 10^count); %this is to generate kind of expression
    hold on % plot histogram     
    plot(centers, u, 'r','LineWidth',3); 
    hold off % plot uniform distribution curve     
    title(['Histogram of ', num2str(10^count), ' random numbers from (0, 1)']);     
    legend('Histogram', 'Uniform Distribution'); 
end
%%
%ii)part 2.1
%test 1000 random numbers sequence's COV
clear all;close all;clc;
M=1000
u = ones(100, 1) / 100; % produce uniform distribution curve 
count = 3; % test 1000 random numbers sequence     
fprintf('Sequence of %d random numbers from (0, 1).\n', 10^count);     
    rands = rand(10^count,1); % generate random numbers sequence  
    CovMatrix=cov(rands);
    fprintf('COV: %f. \n',CovMatrix);%calculate COV 
    MeanArray = mean(rands);  
    MeanMatrix = ones(M, 1)*MeanArray;  
%for one column is equal to the minus
OriginSubMean = rands-MeanMatrix;  
% calculate the specific matrix  
if M == 1000
    CovMatrixComputed = OriginSubMean' * OriginSubMean / M;  
else  
    CovMatrixComputed = OriginSubMean' * OriginSubMean / ( M-1 );  
end 
%%
%part 2.2
%test 10000 random numbers sequence's COV
clear all;close all;clc;
M=10000
u = ones(100, 1) / 100; % produce uniform distribution curve 
count = 4; % test 1000 random numbers sequence     
fprintf('Sequence of %d random numbers from (0, 1).\n', 10^count);     
    rands = rand(10^count,1); % generate random numbers sequence  
    CovMatrix=cov(rands);
    fprintf('COV: %f. \n',CovMatrix);%calculate COV 
    MeanArray = mean(rands);  
    MeanMatrix = ones(M, 1)*MeanArray;  
%for one column is equal to the minus
OriginSubMean = rands-MeanMatrix;  
% calculate the specific matrix  
if M == 10000
    CovMatrixComputed = OriginSubMean' * OriginSubMean / M;  
else  
    CovMatrixComputed = OriginSubMean' * OriginSubMean / ( M-1 );  
end
%%
%iii)part 3 uniform distribution
clear all;close all;clc;
fprintf('\nPart 3: \n');
u = ones(100, 1) / 100; % produce uniform distribution curve 
for count = 2:4 % test 100, 1000, 10000 random numbers sequence      
fprintf('Random number (0, 99) from sequence of %d random numbers.\n',10^count);
rands = rand(10^count, 1); % generate random numbers sequence     
zero_new = zeros(10^count, 1); % mapping from rands     
for i = 1:99
        zero_new = zero_new + (rands >= (i/100));     
end
fprintf('Mean: %f. Variance: %f.\n', mean(zero_new), var(zero_new));
figure; % plot the histogram and uniform distribution curve     
[nelements, centers] = hist(zero_new, 100); % generate histogram     
bar(centers, nelements / 10^count); 
hold on % plot histogram     
plot(centers, u, 'r','LineWidth',4); 
hold off % plot uniform distribution curve     
title(['Histogram of ', num2str(10^count),' discrete random numbers from (0, 99)']);     
legend('Histogram', 'Uniform Distribution'); 
end






