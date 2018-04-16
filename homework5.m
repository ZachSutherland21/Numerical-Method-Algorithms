function [superMatrix]=homework5(x,y)
%homework5 creates a matrix x (row) by y (coloumn)
%
%Inputs:
%   x-number of rows
%   y-number of coloumns
%Output:
%   superMatrix- a matrix that has the number of rows as its coloumn value
%   and the number of coloumns as its row value. Each value in adds the
%   values to the left and above.
if nargin~=2
    error('Ninkimpoop!!!! You need 2 values!!!'); %error return if user does not input 2 values
end
superMatrix=zeros(x,y); %Initial value of entire matix is zero
for k=1:x
    for h=1:y
        if k==1
            superMatrix(k,h)=h; %initializes value of k as h
        elseif h==1
            superMatrix(k,h)=k; %initializes value of h as k
        else
            superMatrix(k,h)=superMatrix(k,h-1)+superMatrix(k-1,h); %Once cycled through the first value assigns value to that position by the value of the one to the left added to the one above.
        end
            
    end
end
        
