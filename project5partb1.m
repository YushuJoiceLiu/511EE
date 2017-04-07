 % 511 project 5 part b 
 %for k=10, M=10
 clear all;close all;clc;
 counter = zeros(1,1000);
 M = 10;
 P = 0.5;
 k_buffer = zeros(1,5); % here is to set up the K=5 value for the buffer
 fraction_discard = zeros(1,1000);
 fraction_replacement = zeros(1,1000);
 discard = zeros(1,1000);
 fraction_buffer = zeros(1,1000);
 replacement = zeros(1,1000);
 position = zeros;
 docu = zeros(1000,10);
 label = zeros(1,1000);
 for i=1:1000
     discard(i) = 0;
     label(i) = length(nonzeros(k_buffer));
     for m=1:10
         if rand()< P
             docu(i,m)=1;
            counter(i) = counter(i)+1;%used to count how many packets come to the cp every slot
             if ismember(m,k_buffer)==1  %decide whether some new packets can replace old ones
                 replacement(i)=replacement(i)+1;
             else
                 position = find(k_buffer == 0);
                 if isempty(position)==1
                     discard(i)=discard(i)+1;
                 else
                     k_buffer(position(1))=m;
                 end;
             end;
         end;
     end;
     if counter(i)~=0
         fraction_discard(i)= discard(i)/counter(i);
     else
         fraction_discard(i)=0;
     end;
     if label(i)~=0
         fraction_replacement(i) = replacement(i)/label(i);
     else
         fraction_replacement(i)=0;
     end;
 end;
 avg_replacement = mean(fraction_replacement)
 avg_fracofdiscard = mean(fraction_discard)
 figure(1)
 plot(fraction_replacement)
 title('the average buffer occupancy')
 figure(2)
 plot(fraction_discard)
 title('the fraction of samples discarded');