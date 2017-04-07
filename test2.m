%problem B
clear all;close all;clc;
x = 0:0.01:10;
fx = exp(-5*x).*(5*x).^4/factorial(4);
gx = exp(-x);
u = fx./gx;
c = max(u);
y = zeros();
result=zeros();
count = 1;
for i=1:30000
    y(i) = exprnd(1);
    fxx = exp(-5*y(i))*(5*y(i))^4/factorial(4);
    gyy = c*exp(-y(i));
    val = fxx/gyy;
    if rand()<=val
        result(count) = y(i);
        count = count+1;
    end;
    if count>10000
        break;
    end;
end;
meansn = mean(result)
variance = var(result)
hist(result,30);