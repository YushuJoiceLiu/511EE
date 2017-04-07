%ee511 project8 case A
clear all;close all;clc;
time = zeros();%each time spending on trasferring to next state
m = 120;
num = zeros();%num of broken pc //state
lamda = 1/(24*60);
mu = 1/16;
idletech = zeros();%in each state, number of idle tech
k = 1;
for i = 1:20000
    if i == 1 || num(i)==0
        t1 = exprnd(1/(m*lamda));
        time(i) = t1;
        num(i) = 0;
        m = m - 1;
        idletech(i)= k-1;
        if i<20000
        num(i+1)=1;
        end;
    else
        t1 = exprnd(1/(m*lamda));
        t2 = exprnd(1/(mu*(k-idletech(i-1))));
        if t1 < t2
            m = m-1;
            time(i)=t1;
            if num(i)<k
                idletech(i) = idletech(i-1)-1;
            else
                idletech(i) = idletech(i-1);
            end;
            if i<20000
            num(i+1)=num(i)+1;
            end;
        else
            m = m+1;
            time(i)=t2;
            if num(i)<= k
                idletech(i) = idletech(i-1)+1;
            else
                idletech(i) = idletech(i-1);
            end;
            if i<20000
            num(i+1)=num(i)-1;
            end;
        end;
    end;
end;

meanNumOfDownPC =  sum(time.*num)/sum(time)

newnum = num;
for i=1 :20000
    if newnum(i)<5
       newnum(i) = 0;
    else
       newnum(i) = 1;
    end;
end;

prob5moreMach = sum(newnum.*time)/sum(time)
expNumOfIdleTech = sum(time.*idletech)/sum(time)