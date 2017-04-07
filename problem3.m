% problem 3
clear all;close all;clc;
fprintf('\nProb 3: \n\n');
p = zeros(20, 1); % generate the pmf of n = 1...20
for i = 2:20
p(i) = 1 / (i*factorial(i-2));
end
for count = 3 % test 1000, 10000,100000 times
num = 10^count; % number of tests
x = zeros(num, 5);
fprintf('Estimating %d times for x(1-5):\n', num);
for j = 1:num
max = -1; % curr max random number from (0,1)
mi = 0; % index of curr max random number
r = 1; % curr record number
i = 0; % curr index
while r < 6 % generate 5 records
    i = i + 1;
    curr = rand();
if curr > max
x(j, r) = i - mi;
mi = i;
max = curr;
r = r + 1;
end
end
end
%fprintf('Maximum probability of X1 is : %f.\n',max);
%fprintf('Maximum probability of X2 is : %f.\n',max);
%fprintf('Maximum probability of X3 is : %f.\n',max);
%fprintf('Maximum probability of X4 is : %f.\n',max);
%fprintf('Maximum probability of X5 is : %f.\n',max);
%fprintf('Maximum probability is : %f.\n',max);
fprintf('Mean of x1: %f. Variance of x1: %f.\n', mean(x(:,1)), var(x(:,1)));
fprintf('Mean of x2: %f. Variance of x2: %f.\n', mean(x(:,2)), var(x(:,2)));
fprintf('Mean of x3: %f. Variance of x3: %f.\n', mean(x(:,3)), var(x(:,3)));
fprintf('Mean of x4: %f. Variance of x4: %f.\n', mean(x(:,4)), var(x(:,4)));
fprintf('Mean of x5: %f. Variance of x5: %f.\n', mean(x(:,5)), var(x(:,5)));
end
