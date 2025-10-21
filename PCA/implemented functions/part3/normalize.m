function [X, param1, param2] = normalize(data, normalization, param1, param2)
%NORMALIZE Normalize the data wrt to the normalization technique passed in
%parameter. If param1 and param2 are given, use them during the
%normalization step
%
%   input -----------------------------------------------------------------
%   
%       o data : (N x M), a dataset of M sample points of N features
%       o normalization : String indicating which normalization technique
%                         to use among minmax, zscore and none
%       o param1 : (optional) first parameter of the normalization to be
%                  used instead of being recalculated if provided
%       o param2 : (optional) second parameter of the normalization to be
%                  used instead of being recalculated if provided
%
%   output ----------------------------------------------------------------
%
%       o X : (N x M), normalized data
%       o param1 : first parameter of the normalization
%       o param2 : second parameter of the normalization

X = [];

switch nargin 
    case 4
        switch normalization 
            case 'none'
                param1 = 0;
                param2 = 0;
                X = data;
            case 'minmax'
                for i = 1:size(data,1)
                    for j = 1:size(data,2)
                        X(i,j) = (data(i, j)-param1(i))./(param2(i)-param1(i));
                    end
                end
            case 'zscore'
                 for i=1:size(data,1)
                     for j = 1:size(data,2)
                        X(i, j) = (data(i, j) - param1(i))./(param2(i));
                     end
                 end
        end
    case 2
        switch normalization
            case 'none'
                param1 = 0;
                param2 = 0;
                X = data;
            case 'minmax'
                param1 = min(data,[],2);
                param2 = max(data,[],2);
                for i = 1:size(data,1)
                    for j = 1:size(data,2)
                        X(i,j) = (data(i, j)-param1(i))./(param2(i)-param1(i));
                    end
                end
            case 'zscore'
                param1 = mean(data,2);
                param2 = std(data,0,2);
                 for i=1:size(data,1)
                     for j = 1:size(data, 2)
                        X(i, j) = (data(i, j) - param1(i))./(param2(i));
                     end
                 end
        end
end

end

