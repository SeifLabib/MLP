function [ y_est ] =  knn(X_train,  y_train, X_test, params)
%MY_KNN Implementation of the k-nearest neighbor algorithm
%   for classification.
%
%   input -----------------------------------------------------------------
%   
%       o X_train  : (N x M_train), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_train  : (1 x M_train), a vector with labels y \in {1,2} corresponding to X_train.
%       o X_test   : (N x M_test), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o params : struct array containing the parameters of the KNN (k, d_type)
%
%   output ----------------------------------------------------------------
%
%       o y_est   : (1 x M_test), a vector with estimated labels y \in {1,2} 
%                   corresponding to X_test.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Initialization of variables
Dist = zeros(size(X_train, 2));
%Intermediate variables used with different dimensions
y_int = zeros(size(X_train, 2));
y_knn = zeros(params.k);
y_est = zeros(1, size(X_test, 2));

%Bigger loop to perform for each test point, in which we have a smaller
%loop for each of the training points
for i=1:size(X_test, 2)
    for j=1:size(X_train, 2)
        Dist(j) = compute_distance(X_test(:,i), X_train(:,j), params);
    end
    %sorting the distances in ascending order, while keeping the indices,
    %which will be used to sort the y_train in the same order, then take
    %the first k elements
    [~, idx] = sort(Dist, 'ascend');
    y_int = y_train(idx);
    y_knn = y_int(1:params.k);
    y_est(1, i) = mode(y_knn);

end

end