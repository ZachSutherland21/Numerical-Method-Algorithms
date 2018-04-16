function[I]=Simpson(x,y)
% The purpose of this function is to determine integral of experimental
% data using the Simpson's 1/3 rule. Should there be an odd number of
% intervals then the last interval of the function will be evaluated using
% the trapazoidal method.
%
%Inputs:
%   x - The array of independent values
%   y - The array of dependent values
%
%Outputs:
%   I - The approximate integral of the provided data

% checks number of inputs
if nargin ~= 2
    error('Please provide only 2 inputs for the function');
end

% checks the arrays equal eachother
n=numel(x);
m=numel(y);
if n~=m
    if n>m
        gap=n-m;
        errorText=['Your x array is larger than your y array by ' num2str(gap) ' elements'];
        error(errorText);
    else
        gap=m-n;
        errorText=['Your y array is larger than your y array by ' num2str(gap) ' elements'];
        error(errorText);
    end
end

% Evaluates the x vales are qually spaced
xspace=diff(x);
xmin=min(xspace);
xmax=max(xspace);
if (abs(xmax-xmin))>=.0001
    error('Your x vector is not equally spaced');
end

% Evaluates the linear length of the x vector by to in order to decide
% which variation of the solution to use
[~,z]=size(x);
[~,a]=size(y);
if rem(z,2)==1
    % Simpson's on n-1,trap on n
    warning('Your data requires that the last iteration of the calculation be made using the trapaziodal rule. Results may be less accuarate');
    oddsum=0;
    for i_odd=3:2:(a-3)
        oddsum=oddsum+y(1,i_odd);
    end
    evensum=0;
    for i_even=2:2:(a-1)
        evensum-evensum+y(1,i_even);
    end
    n=z-2;
    I=(x(1,z)-x(1,1))*((y(1,1)+(4*oddsum)+(2*evensum)+y(1,a))/(3*n))+(x(1,z)-x(1,(z-1)))*((y(1,a)+y(1,(a-1)))/2);
elseif rem(z,2)==0
    if z>2
        % Composite Simpson's 1/3
        oddsum=0;
        for i_odd=3:2:(z-1)
            oddsum=oddsum+y(1,i_odd);
        end
        evensum=0;
        for i_even=2:2:(z-2)
            evensum=evensum+y(1,i_even);
        end
        n=a-1;
        I=(x(1,z)-x(1,1))*((y(1,1)+(4*oddsum)+(2*evensum)+y(1,a))/(3*n));
    elseif z<=2
        % Strictly the trapaziod method
        warning('The data provided only permits the use of the trapaziod method. Results may be less accurate');
        I=(x(1,z)-x(1,1))*(y(1,a)-y(1,1))/2; 
    end
end
    

