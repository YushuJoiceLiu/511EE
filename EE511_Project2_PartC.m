% EE511_Project_#2_Part_C
% Find the 3 most likely numbers of points in a bridge hand
close all;
clear all;
clc;

num_simu = input('Number of simulations: '); 
% input the number of simulations

N = 52; % number of cards
new_deck = linspace(1, N, N); % generate a deck of new cards
% map Card 1 to the Ace of Clubs, Card 2 to the 2 of Clubs,...
% Card 14 to the Ace of Diamonds, Card 27 to the Ace of Hearts
% Card 40 to the Ace of Spades, Card 52 to the King of Spades 

X_num_points = zeros(1, num_simu); % record the points of each simulation

for k = 1:1:num_simu
    
    uni_dist = rand(1, N);
    shuffled_cards = zeros(1, N);
    process_deck = new_deck;

    for c = 1:1:N % randomly shuffle the new deck of cards
        shuffled_cards(c) = process_deck(ceil((N-c+1)*uni_dist(c)));
        process_deck(ceil((N-c+1)*uni_dist(c)):1:end-1) = ...
            process_deck(ceil((N-c+1)*uni_dist(c)+1):1:end);
        process_deck(N-c+1:1:end) = 0;
    end

    a_bridge_hand = zeros(1, N/4);
    a_bridge_hand(1:1:N/4) = shuffled_cards(1:4:end);
    % get a bridge hand (13 cards selected from shuffled 52 cards?

    num_points = 0; % create the number of points

    for c1 = 1:1:N/4 % get the number of points in the bridge hand
        switch a_bridge_hand(c1)
            case {1, 14, 27, 40}
                num_points = num_points+4;
            case{13, 26, 39, 52}
                num_points = num_points+3;
            case{12, 25, 38, 51}
                num_points = num_points+2;
            case{11, 24, 37, 50}
                num_points = num_points+1;
            otherwise
        end  
    end
    
    X_num_points(k) = num_points;
end

figure(1)
edges = [-0.5:1:37+0.5];
histogram(X_num_points, edges, 'Normalization', 'probability');
% plot the histogram of the number of points
xlim([-0.5, 37+0.5])
grid on
title('The Histogram of the Number of Points');
xlabel('Number of points');
ylabel('Probability');


