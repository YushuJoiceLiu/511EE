%case II (imbalanced system)
clear all;close all;clc;
buffer = zeros(1,4);
count_packet_slot = zeros();
%set load for the system
p = 0.6
% set 1000 loop
for time = 1:1000
    if time>1
    buffer(time,1) = buffer((time-1),1);
    buffer(time,2) = buffer((time-1),2);
    %k1 k2 used to decide whether packet come to the input
    k1 = rand();
        if k1 > p 
            i1 = 0;
            buffer(time,1) = buffer((time-1),1)+ i1;
        else
            i1 = 1;
            buffer(time,1) = buffer((time-1),1) + i1;%put the input in the buffer
            buffer(time,3) = randi(2);%decide this packet which output to go
        end;
    k2 = rand();
        if k2 > p 
            i2 = 0;
            buffer(time,2) = buffer((time-1),2)+ i2;
        else
            i2 = 1;
            buffer(time,2) = buffer((time-1),2) + i2;
            buffer(time,4) = randi(2);
        end;
    else
        k1 = rand();
        if k1 > p 
            i1 = 0;
            buffer(time,1) = i1;
            buffer(time,3) = 0;
        else
            i1 = 1;
            buffer(time,1) = i1;
            buffer(time,3) = randi(2);%decide this packet which output to go
        end;
        k2 = rand();
        if k2 > p 
            i2 = 0;
            buffer(time,2) = i2;
            buffer(time,4) = 0;
        else
            i2 = 1;
            buffer(time,2) = i2;
            buffer(time,4) = randi(2);
        end;
    end;
        
    %decide the action of the switch
    %deal with empty input
    m = find(buffer(:,3)~=0);
    n = find(buffer(:,4)~=0);
    if (isempty(m)==1) && (isempty(n)==1)
        continue;
    end;
    % if one input is empty, the other must be dealt with
    % isempty == 0 means packets waiting for delievering
    if (isempty(m)==1) && (isempty(n)==0)
        buffer(time,2) = buffer(time,2) -1;
        buffer(n(1),4) = 0;
    end;
    if (isempty(m)==0) && (isempty(n)==1)
        buffer(time,1) = buffer(time,1)-1;
        buffer(m(1),3) = 0;
    end;
    %if both input have packets, need to decide whether they can both
    %delieverd or one delievered the other one stay in the buffer
    if (isempty(m)==0)&&(isempty(n)==0)
       if (buffer(m(1),3)~=buffer(n(1),4)) %both input's packet are delievered
           buffer(time,1) = buffer(time,1) -1;
           buffer(time,2) = buffer(time,2) -1;
           buffer(m(1),3) = 0;
           buffer(n(1),4) = 0;
       else % only one input's packet are delievered
           switchs = rand();
           if switchs >0.75
                buffer(time,1) = buffer(time,1)-1;
                buffer(m(1),3) = 0;
           else
                buffer(time,2) = buffer(time,2)-1;
                buffer(n(1),4) = 0;
           end;
      end;
   end;
   if time > 1
   count_packet_slot(time) = abs(buffer(time,1)-buffer((time-1),1))+ abs(buffer(time,2)-buffer((time-1),2));
   end;
end;
mean_input1 = mean(buffer(:,1))
mean_input2 = mean(buffer(:,2))
mean_number_packets=mean(mean_input1+mean_input2)
figure(1)
hist(buffer(:,1));
title('distribution of the number of packets of 1st buffer');
figure(2)
hist(buffer(:,2));
title('distribution of the number of packets of 2nd buffer');
figure(3)
hist((buffer(:,1)+buffer(:,2)));
title('distribution of the number of packets of total buffer');
mean_packet_per_slot = mean(count_packet_slot)
hist(count_packet_slot);
title('distribution of the number of packets processed per slot');
