%% project 5 part a
clear all;close all;clc;
a_number = zeros(1,1000);
for i =1:1000
    p = 0.5;
    for m = 1:100
        if rand()< p
          a_number(i) = a_number(i)+1;
        end;
    end;
end;
avgpck = mean(a_number)
hist(a_number,15);
title('the exact distribution of A');


%% part b 