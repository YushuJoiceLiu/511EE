%EE511 project 9
lamda = 0.1;
mean = 0.2;
departure = 100000;
time_arrival = zeros(1,departure);%time inside
time_leave = zeros(1,departure);%time outside

time_arrival(1)=exprnd(1/lamda);%mean service time
time_leave(1)=time_arrival(1)+exprnd(1/mean);

for i=2:departure
    time_arrival(i)=time_arrival(i-1)+exprnd(1/lamda);
    if time_leave(i-1)<time_arrival(i)
        time_leave(i)=time_arrival(i)+exprnd(1/mean);
    else
        time_leave(i)=time_leave(i-1)+exprnd(1/mean);
    end;
end;

t_wait = time_leave - time_arrival;
t_wait_avg = mean(t_wait)

time = [time_arrival,time_leave];
time = sort(time);
queue_number = zeros(size(time));
queue_number(1)=1;

for i =2:length(time)
    if( ismember(time(i),time_arrival)==1)
        queue_number(i)=queue_number(i-1)+1;
    else
        queue_number(i)=queue_number(i-1)-1;
    end;
end;
% figure(1)
% plot(time,numInQueue);
% figure(2)
% hist(numInQueue,15);