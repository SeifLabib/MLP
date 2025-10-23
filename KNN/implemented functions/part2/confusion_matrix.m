function [C] =  confusion_matrix(y_test, y_est)
%CONFUSION_MATRIX Implementation of confusion matrix 
%   for classification results.
%   input -----------------------------------------------------------------
%
%       o y_test    : (1 x M), a vector with true labels y \in {1,2} 
%                        corresponding to X_test.
%       o y_est     : (1 x M), a vector with estimated labels y \in {1,2} 
%                        corresponding to X_test.
%
%   output ----------------------------------------------------------------
%       o C          : (2 x 2), 2x2 matrix of |TP & FN|
%                                             |FP & TN|.
%
%   where positive is encoded by the label 1 and negative is encoded by the label 2.        
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   C = zeros(2, 2);

    for i = 1:length(y_test)
        if y_test(i) == 1
            % Positive class
            if y_est(i) == 1
                C(1, 1) = C(1, 1) + 1; % True Positive
            else
                C(1, 2) = C(1, 2) + 1; % False Negative
            end
        else
            % Negative class
            if y_est(i) == 1
                C(2, 1) = C(2, 1) + 1; % False Positive
            else
                C(2, 2) = C(2, 2) + 1; % True Negative
            end
        end
    end




end

