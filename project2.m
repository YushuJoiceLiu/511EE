%problem 1
%% test 1
clear all;close all;clc;
i=1;
m=0;
n1=1000;
for i=1:n1
    a=rand(1,2);
    if a(1)^2+a(2)^2<=1
        m=m+1;
    end
end
pi1=vpa(4*m/n1,30)

%% test 2
i=1;
m=0;
n2=10000;
for i=1:n2
    a=rand(1,2);
    if a(1)^2+a(2)^2<=1
        m=m+1;
    end
end
pi2=vpa(4*m/n2,30)

%% test 3
i=1;
m=0;
n3=100000;
for i=1:n3
    a=rand(1,2);
    if a(1)^2+a(2)^2<=1
        m=m+1;
    end
end
pi3=vpa(4*m/n3,30)
%% test 4
i=1;
m=0;
n4=500000;
for i=1:n4
    a=rand(1,2);
    if a(1)^2+a(2)^2<=1
        m=m+1;
    end
end
pi4=vpa(4*m/n4,30)
