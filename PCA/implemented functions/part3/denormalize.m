function [Xinversed] = denormalize(X, param1, param2, normalization)
%DENORMALIZE Denormalize the data wrt to the normalization technique passed in
%parameter and param1 and param2 calculated during the normalization step
%normalization step
%
%   input -----------------------------------------------------------------
%   
%       o X : (N x M), normalized data of M sample points of N features
%       o normalization : String indicating which normalization technique
%                         to use among minmax, zscore and none
%       o param1 : first parameter of the normalization 
%       o param2 : second parameter of the normalization
%
%   output ----------------------------------------------------------------
%
%       o Xinversed : (N x M), the denormalized data

 switch normalization 
            case 'none'
                Xinversed = X;
            case 'minmax'
                for i = 1:size(X,1)
                    for j = 1:size(X,2)
                        Xinversed(i,j)=X(i,j)*(param2(i)- param1(i)) + param1(i);
                    end
                end
            case 'zscore'
                 for i=1:size(X,1)
                     for j = 1:size(X,2)
                        Xinversed(i,j) = X(i, j)*param2(i) + param1(i); 
                     end
                 end

end

