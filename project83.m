%ee511proj8
clear all;close all;clc;
time = zeros();%each time spending on trasferring to next state
m = 120;
num = zeros(1,20000);%num of broken pc //state
lamda = 1/(24*60);
mu = 1/16;
idletech = zeros();%in each state, number of idle tech
k = 3;
t21(2,20000)=zeros();
t22(2,20000)=zeros();
t23(2,20000)=zeros();
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
        if rand()>0.2
            t21(1,i+1)=5;
        else
            t21(1,i+1)=60;
        end;
        t22(2,i+1)=0;
        if rand()>0.2
            t22(1,i+1)=5;
        else
            t22(1,i+1)=60;
        end;
        t23(2,i+1)=0;
        if rand()>0.2
            t23(1,i+1)=5;
        else
            t23(1,i+1)=60;
        end;
        end;
    else
        t1(i) = exprnd(1/(m*lamda));
        if t1(i) < min([t21(1,i),t22(1,i),t23(1,i)]) || (t21(2,i)==0 && t22(2,i)==0 && t23(2,i)==0)
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
            if t22(2,i)==1
                t22(1,i+1)=t22(1,i)-time(i);
            else
                t22(1,i+1)=t22(1,i);
            end;
            if t23(2,i)==1
                t23(1,i+1)=t23(1,i)-time(i);
            else
                t23(1,i+1)=t23(1,i);
            end;
            t21(2,i+1)=1;
            t22(2,i+1)=1;
            t23(2,i+1)=1;
            end;
        elseif num(i)>0
            m = m+1;
            time(i)=min([t21(1,i),t22(1,i),t23(1,i)]);

            if i<20000
                if num(i)<= k
                idletech(i+1) = idletech(i)+1;
                else
                idletech(i+1) = idletech(i);
                end;
                num(i+1)=num(i)-1;
                if time(i)==t21(1,i)
                    if num(i+1)==0
                        t21(2,i+1)=0;
                    elseif (num(i+1)==1 && t22(2,i)==1) || (num(i+1)==1 && t23(2,i)==1) || (num(i+1)==2 && t23(2,i)==1 && t22(2,i)==1)
                        t21(2,i+1)=0;
                    else
                        t21(2,i+1)=1;
                    end;
                    if rand()>0.2
                        t21(1,i+1)=5;
                    else
                        t21(1,i+1)=60;
                    end;
                    t22(1,i+1)=t22(1,i)-time(i);
                    t22(2,i+1)=t22(1,i);
                    t23(1,i+1)=t23(1,i)-time(i);
                    t23(2,i+1)=t23(1,i);
                end;
                
                if time(i)==t22(1,i)
                    if num(i+1)==0
                        t22(2,i+1)=0;
                    elseif (num(i+1)==1 && t21(2,i)==1) || (num(i+1)==1 && t23(2,i)==1) || (num(i+1)==2 && t23(2,i)==1 && t21(2,i)==1)
                        t22(2,i+1)=0;
                    else
                        t22(2,i+1)=1;
                    end;
                    if rand()>0.2
                        t22(1,i+1)=5;
                    else
                        t22(1,i+1)=60;
                    end;
                    t21(1,i+1)=t22(1,i)-time(i);
                    t21(2,i+1)=t22(1,i);
                    t23(1,i+1)=t23(1,i)-time(i);
                    t23(2,i+1)=t23(1,i);
                end;
                
                if time(i)==t23(1,i)
                    if num(i+1)==0
                        t23(2,i+1)=0;
                    elseif (num(i+1)==1 && t22(2,i)==1) || (num(i+1)==1 && t21(2,i)==1) || (num(i+1)==2 && t21(2,i)==1 && t22(2,i)==1)
                        t23(2,i+1)=0;
                    else
                        t23(2,i+1)=1;
                    end;
                    if rand()>0.2
                        t23(1,i+1)=5;
                    else
                        t23(1,i+1)=60;
                    end;
                    t22(1,i+1)=t22(1,i)-time(i);
                    t22(2,i+1)=t22(1,i);
                    t21(1,i+1)=t21(1,i)-time(i);
                    t21(2,i+1)=t21(1,i);
                end; 
            end;
        else
            if i<20000
            time(i)=t1(i);
            idletech(i+1) = idletech(i);
            num(i+1)=num(i);
            t21(1,i+1)=t21(1,i);
            t21(2,i+1)=t21(2,i);
            t22(1,i+1)=t22(1,i);
            t22(2,i+1)=t22(2,i);
            t23(1,i+1)=t23(1,i);
            t23(2,i+1)=t23(2,i);
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
plot(num);
prob5moreMach = sum(newnum.*time)/sum(time)
expNumOfIdleTech = sum(time.*idletech)/sum(time)