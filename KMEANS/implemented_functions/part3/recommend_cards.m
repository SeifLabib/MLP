function [cards] = recommend_cards(deck, Mu, type)
%RECOMMAND_CARDS Recommands a card for the deck in input based on the
%centroid of the clusters
%
%   input -----------------------------------------------------------------
%   
%       o deck : (N, 1) a deck of card
%       o Mu : (M x k) the centroids of the k clusters
%       o type : type of distance to use {'L1', 'L2', 'Linf'}
%
%   output ----------------------------------------------------------------
%
%       o cards : a set of cards recommanded to add to this deck
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dist = deck_distance(deck, Mu, type);

% Find the index of the closest cluster
[~, closest_cluster] = min(abs(dist-1));    

% Extract ids of cards where Mu_k is not zero
non_zero_ids = find(Mu(:, closest_cluster) ~= 0);

% Sort cards in descending order based on Mu_k values
[~, sorted_indices] = sort(Mu(non_zero_ids, closest_cluster), 'descend');

% Get the recommended cards
cards = non_zero_ids(sorted_indices);

end