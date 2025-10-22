function [dist] = deck_distance(deck, Mu, type)
%DECK_DISTANCE Calculate the distance between a partially filled deck and
%the centroides
%
%   input -----------------------------------------------------------------
%   
%       o deck : (N x 1) a partially filled deck
%       o Mu : (N x K) Value of the centroids
%       o type : type of distance to use {'L1', 'L2', 'Linf'}
%
%   output ----------------------------------------------------------------
%
%       o dist : K X 1 the distance to the k centroids
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get the IDs for the non_zero cards
non_zero = find(deck ~= 0);

% Form the subset of both the deck and Mu
deck_subset = deck(non_zero);
Mu_subset = Mu(non_zero, :);

%Apply the distance_to_centroids function to the subsets of Mu and deck
dist = distance_to_centroids(deck_subset, Mu_subset, type);

end

