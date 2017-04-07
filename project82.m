%ee511projcet8 case B
clear all;close all;clc;
time = zeros();%each time spending on trasferring to next state
m = 120;
num = zeros(1,20000);%num of broken pc //state
lamda = 1/(24*60);
mu = 1/16;
idletech = zeros();%in each state, number of idle tech
k = 1;% for k=1
t21(2,10)=zeros();
t1=zeros();
for i = 1:20000
    if i == 1 || num(i)==0
        t1(i) = exprnd(1/(m*lamda));
        time(i) = t1(i);
        m = m - 1;
        idletech(i+1)= k-1;
        if i<20000
        num(i+1)=num(i)+1;
        t21(2,i+1)=1;
        t21(1,i+1)=16;
        end;
    else
        t1(i) = exprnd(1/(m*lamda));
        if t1(i) < t21(1,i) || t21(2,i)==0
            m = m-1;
            time(i)=t1(i);
            if i<20000
                if num(i)<k
                    idletech(i+1) = idletech(i)-1;
                else
                    idletech(i+1) = idletech(i);
                end;
            num(i+1)=num(i)+1;
            if t21(2,i)==1
                t21(1,i+1)=t21(1,i)-time(i);
            else
                t21(1,i+1)=t21(1,i);
            end;
            t21(2,i+1)=1;
            end;
        elseif num(i)>0
            m = m+1;
            time(i)=t21(1,i);

            if i<20000
                if num(i)<= k
                idletech(i+1) = idletech(i)+1;
                else
                idletech(i+1) = idletech(i);
                end;
            num(i+1)=num(i)-1;
            if num(i+1)==0
                t21(2,i+1)=0;
            else
                t21(2,i+1)=1;
            end;
            t21(1,i+1)=16;
            end;
        else
            if i<20000
            time(i)=t1(i);
            idletech(i+1) = idletech(i);
            num(i+1)=num(i);
            t21(1,i+1)=t21(1,i);
            t21(2,i+1)=t21(2,i);
            end;
        end;
    end;
end;

mean_number_of_computer_down =  sum(time.*num)/sum(time)

newnum = num;
for i=1 :20000
    if newnum(i)<5
       newnum(i) = 0;
    else
       newnum(i) = 1;
    end;
end;

prob_5moreMach_down = sum(newnum.*time)/sum(time)
exp_num_of_idle_Tech = sum(time.*idletech)/sum(time)