%ee511 project6
clear all;close all;clc;
n = 5;
x = zeros(n,10000);
for i =1:n
    x(i,:) = exprnd(1,1,10000);
end;
en = sum(x,1);
sn = en./n;
mean_sn = mean(sn)
var_sn = var(sn)
hist(sn,10);