%ee511 proj9 problem 2
lamda = 0.1;
mu = 2;% here we set mu=2 from ee503
p=lamda/mu;
departure = 100000;
time_arrival = zeros(1,departure);%time_ means shike
time_leave = zeros(1,departure);

time_arrival(1)=exprnd(1/lamda);
time_leave(1)=time_arrival(1)+exprnd(1/mu);

for i=2:departure
    time_arrival(i)=time_arrival(i-1)+exprnd(1/lamda);
    if time_leave(i-1)<time_arrival(i)
        time_leave(i)=time_arrival(i)+exprnd(1/mu);
    else
        time_leave(i)=time_leave(i-1)+exprnd(1/mu);
    end;
end;

t_wait = time_leave - time_arrival;
t_wait_avg = mean(t_wait)-1/mu;

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

busyPoint = find(queue_number == 0);%find no one in queue, 0dian position
id = zeros(size(busyPoint));
duration = zeros(size(busyPoint));
noDepartInBp = zeros(size(busyPoint));
sumOfwait = zeros(size(busyPoint));
id(1)=1;
duration(1)=time(busyPoint(1))-time(1);
noDepartInBp(1)=length(find(time_leave<=time(busyPoint(1))));
for i=2:length(busyPoint)
    id(i)=i;
%     period_bp = time(busyPoint(i-1)+1:busyPoint(i));
    duration(i)=time(busyPoint(i))-time(busyPoint(i-1)+1);
%     maxval=max(period_bp);%this busy period's start time and end time
%     minval=min(period_bp);
    noDepartInBp(i)=length(find((time_leave>=(time(busyPoint(i-1)+1))) & (time_leave<=(time(busyPoint(i))))));    
end;

sumOfwait(1)=sum(t_wait(1:noDepartInBp(1)));
for i=2:length(busyPoint)
    start = sum(noDepartInBp(1:noDepartInBp(i-1)+1));
    last = sum(noDepartInBp(1:noDepartInBp(i)+1));
    sumOfwait(i)= sum(t_wait(start:last));
end;

% a= tabulate(noDepartInBp);
% figure(1)
% plot(a(:,1),a(:,2));
prob = zeros();
for m=1:max(noDepartInBp)
    prob(m)=0.5*(1/(2*m-1))*(p^(m-1)/(1+p)^(2*m-1))*factorial(2*m)/((factorial(m))^2);
end;
% figure(2)
% plot(prob);

newarr = [noDepartInBp;sumOfwait];
newarray=sortrows(newarr'); 
result=newarray';
newwait = result(2,:);
kk = result(1,:);
avgwait=zeros();
for n = 1:max(noDepartInBp)
    position = find(kk==n);
    len = length(position);
    if len>1
    avgwait(n)=sum(newwait(position(1):position(len)))/len;
    else
        avgwait(n)=newwait(position);
    end;
end;

overall_mean=sum(avgwait.*prob);