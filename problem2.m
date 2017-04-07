%% problem 2
% prob 2
clear all;close all;clc;
fprintf('\nProb 2: \n\n');
p = zeros(20, 1); % generate the pmf of n = 1...20
for i = 2:20
p(i) = 1 / (i*factorial(i-2));
end
for count = 3:6 % test 1000, 10000, 100000,1000000 times
num = 10^count; % number of tests
ns = zeros(num, 1);
fprintf('Estimating %d times for n:\n', num);
for i = 1:num
last = -1; % last random number from (0,1)
curr = rand(); % generate a new random number
n = 1;
while curr >= last % generate random number from (0,1) till curr < last
    last = curr;
    n = n + 1;
    curr = rand();
end
ns(i) = n;
end
fprintf('Mean: %f. Variance: %f.\n\n', mean(ns), var(ns));
d = zeros(20, 1); % generate the test distribution of n = 1...20
for i = 2:20
d(i) = sum(ns == i) / num;
end
figure;
bar(1:20, d); hold on;
plot(1:20, p, 'r','LineWidth',2); hold off;
title([num2str(num), ...
' tests distribution and pmf of n as min of uniform RV from (0,1)']);
legend('test distribution', 'true pmf');
end
