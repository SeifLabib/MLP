function [Mu] =  kmeans_init(X, k, init)
%KMEANS_INIT This function computes the initial values of the centroids
%   for k-means algorithm, depending on the chosen method.
%
%   input -----------------------------------------------------------------
%   
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o k     : (double), chosen k clusters
%       o init  : (string), type of initialization {'sample','range'}
%
%   output ----------------------------------------------------------------
%
%       o Mu    : (D x k), an Nxk matrix where the k-th column corresponds
%                          to the k-th centroid mu_k \in R^N                   
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%randomization & min/max definition
rand_ind = randi([1 size(X,2)], k);
min_ = min(X');
max_ = max(X');

%case switch 'sample', 'range'
switch init
    case 'sample'
        for i=1:k 
            Mu(:, i) = X(:, rand_ind(i));
        end
    case 'range'
        for i=1:size(X,1)
            lin = linspace(min_(i), max_(i));
            Mu(i, :) = randsample(lin, k);
        end
end
end