function [RSS_curve, AIC_curve, BIC_curve] =  kmeans_eval(X, K_range,  repeats, init, type, MaxIter)
%KMEANS_EVAL Implementation of the k-means evaluation with clustering
%metrics.
%
%   input -----------------------------------------------------------------
%   
%       o X           : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o repeats     : (1 X 1), # times to repeat k-means
%       o K_range     : (1 X K_range), Range of k-values to evaluate
%       o init        : (string), type of initialization {'sample','range'}
%       o type        : (string), type of distance {'L1','L2','LInf'}
%       o MaxIter     : (int), maximum number of iterations
%
%   output ----------------------------------------------------------------
%       o RSS_curve  : (1 X K_range), RSS values for each value of K in K_range
%       o AIC_curve  : (1 X K_range), AIC values for each value of K in K_range
%       o BIC_curve  : (1 X K_range), BIC values for each value of K in K_range
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialization
RSS_curve = zeros(1, size(K_range, 2));
BIC_curve = zeros(1, size(K_range, 2));
AIC_curve = zeros(1, size(K_range, 2));

RSS_interm = [];
AIC_interm = [];
BIC_interm = [];

%Main loop for each k (repeats times)
for i=1:size(K_range, 2)
    for j=1:repeats
        [labels, Mu, ~, ~] = kmeans(X, K_range(i), init, type, MaxIter, []);
        [RSS_interm(j), AIC_interm(j), BIC_interm(j)] = compute_metrics(X, labels, Mu);
    end
    RSS_curve(1, i) = mean(RSS_interm, 2);
    AIC_curve(1, i) = mean(AIC_interm, 2);
    BIC_curve(1, i) = mean(BIC_interm, 2);
end




end