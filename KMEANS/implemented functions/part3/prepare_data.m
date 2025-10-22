function [X, unique_cards] = prepare_data(data)
%PREPARE_DATA Convert the list of cards and deck to a matrix representation
%             where each row is a unique card and each column a deck. The
%             value in each cell is the number of time the card appears in
%             the deck
%
%   input -----------------------------------------------------------------
%   
%       o data   : (60, M) a dataset of M decks. A deck contains 60 non
%       necesserally unique cards
%
%   output ----------------------------------------------------------------
%
%       o X  : (N x M) matrix representation of the frequency of appearance
%       of unique cards in the decks whit N the number of unique cards in
%       the dataset and M the number of decks
%       o unique_cards : {N x 1} the set of unique card names as a cell
%       array
%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Getting the names/number of unique cards, as well as their
[unique_cards, ~, index] = unique(data(:));
X = zeros(numel(unique_cards), size(data, 2));

%Main loop
for i = 1:size(data, 2)
    for deck_idx = 1:size(data, 2)
        % Get indices for the current deck
        deck_indices = index((deck_idx - 1) * size(data, 1) + 1 : deck_idx * size(data, 1));
        
        % Count the frequency of each unique card in the current deck
        counts = histcounts(deck_indices + 0.5, 1:numel(unique_cards)+1);
        
        % Update the matrix representation
        X(:, deck_idx) = counts;
    end
end

end

