function [ExpVar, CumVar, p_opt] = explained_variance(EigenValues, var_threshold)
%EXPLAINED_VARIANCE Function that returns the optimal p given a desired
%   explained variance.
%
%   input -----------------------------------------------------------------
%   
%       o EigenValues     : (N x 1), Diagonal Matrix composed of lambda_i 
%       o var_threshold   : Desired Variance to be explained
%  
%   output ----------------------------------------------------------------
%
%       o ExpVar  : (N x 1) vector of explained variance
%       o CumVar  : (N x 1) vector of cumulative explained variance
%       o p_opt   : optimal principal components given desired Var

EigenValues_sum = cumsum(EigenValues);
EigenValues_temp = EigenValues_sum(4);
EigenValues_sum = EigenValues_sum/EigenValues_temp;

for i=1:length(EigenValues)
    if (EigenValues_sum(i) >= var_threshold)
        p_opt = i;
        break 
    end 
end

ExpVar = EigenValues/EigenValues_temp;
CumVar = EigenValues_sum;



end

