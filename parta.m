% problem a
clear all;close all;clc;
fprintf('\nProblem A: \n\n');
m = 1; % 1 / lamda or mean for the exponential distribution
for count = 3:4 % test 1000, 10000 Sn samples
 num = 10^count; % number of samples
 sn = zeros(num, 1); % sample storage
 mb = 0; % max number of bins for histogram
 figure;
 for i = 1:5 % let n = 1,...,5
 fprintf('Generating %d samples for s%d:\n', num, i);
 for j = 1:num
 c = 0; % number of exp rv
 s = 0; % sn
 while c < i % till i exp rv are generated
 s = s + exprnd(m);
 c = c + 1;
 end
 sn(j) = s / i;
 end
 fprintf('Mean: %f. Variance: %f.\n\n', mean(sn), var(sn));
 b = max(sn); % find the max value of sn
 if b > mb % update the max number of bins for histogram
 mb = b;
 end
 ss = 0:0.1:b; % divide the bins into 0,0.1,0.2...b
 n = hist(sn, ss); % generate the histogram
 plot(ss, n./num); hold all;
 end
 norm = normpdf(1:0.1:mb, m, sqrt(m^2/5)); % the normal distribution
 plot(1:0.1:mb, norm); hold off;
 title([num2str(num), ' samples distribution of Sn and normal distribution of S5']);
 legend('S1', 'S2', 'S3', 'S4', 'S5', 'normal distribution');
end