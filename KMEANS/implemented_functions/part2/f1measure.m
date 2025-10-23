function [F1_overall, P, R, F1] =  f1measure(cluster_labels, class_labels)
%MY_F1MEASURE Computes the f1-measure for semi-supervised clustering
%
%   input -----------------------------------------------------------------
%   
%       o class_labels     : (1 x M),  M-dimensional vector with true class
%                                       labels for each data point
%       o cluster_labels   : (1 x M),  M-dimensional vector with predicted 
%                                       cluster labels for each data point
%   output ----------------------------------------------------------------
%
%       o F1_overall      : (1 x 1)     f1-measure for the clustered labels
%       o P               : (nClusters x nClasses)  Precision values
%       o R               : (nClusters x nClasses)  Recall values
%       o F1              : (nClusters x nClasses)  F1 values
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Unique class and cluster labels
    unique_classes = unique(class_labels);
    unique_clusters = unique(cluster_labels);
    
    % Number of classes and clusters
    nClasses = numel(unique_classes);
    nClusters = numel(unique_clusters);
    
    % Initialize matrices for Precision, Recall, and F1
    P = zeros(nClusters, nClasses);
    R = zeros(nClusters, nClasses);
    F1 = zeros(nClusters, nClasses);
    
    % Calculate Precision, Recall, and F1 for each cluster and class
    for i = 1:nClusters
        for j = 1:nClasses
            true_positive = sum(class_labels == unique_classes(j) & cluster_labels == unique_clusters(i));
            false_positive = sum(class_labels ~= unique_classes(j) & cluster_labels == unique_clusters(i));
            false_negative = sum(class_labels == unique_classes(j) & cluster_labels ~= unique_clusters(i));
            
            % Precision, Recall, and F1 formulas
            P(i, j) = true_positive / (true_positive + false_positive);
            R(i, j) = true_positive / (true_positive + false_negative);
            F1(i, j) = 2 * P(i, j) * R(i, j) / (P(i, j) + R(i, j));
        end
    end
    
    %F1 computation
    F1_overall = 0;
    for j = 1:nClasses
        nb_elements_in_class = sum(class_labels == unique_classes(j));
        F1_overall = F1_overall + (nb_elements_in_class / size(class_labels,2)) * max(F1(:, j));
    end
end
