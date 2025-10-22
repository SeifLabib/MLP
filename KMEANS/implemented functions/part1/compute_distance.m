function [d] =  compute_distance(x_1, x_2, type)
%COMPUTE_DISTANCE Computes the distance between two datapoints (as column vectors)
%   depending on the choosen distance type={'L1','L2','LInf'}
%
%   input -----------------------------------------------------------------
%   
%       o x_1   : (N x 1),  N-dimensional datapoint
%       o x_2   : (N x 1),  N-dimensional datapoint
%       o type  : (string), type of distance {'L1','L2','LInf'}
%
%   output ----------------------------------------------------------------
%
%       o d      : distance between x_1 and x_2 depending on distance
%                  type {'L1','L2','LInf'}
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialization
sum = 0;

%switch case depending on the type of the distance to compute
switch type
    case 'L1'
        for i=1:size(x_1)
            sum = sum + abs(x_1(i)-x_2(i));
        end
        d = sum;
    case 'L2'
        for i=1:size(x_1)
            sum = sum + abs(x_1(i)-x_2(i))^2;
        end
        d = sqrt(sum);
    case 'LInf'
        sum = abs(x_1 - x_2);
        d = max(sum);

end