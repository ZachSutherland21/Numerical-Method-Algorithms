function[L,U,P]=luFactor(A)
% The function luFactor is designed to take a square matrix of coefficient
% values and return the lower triangular matrix, upper triangular matrix,
% and the pivot matrix
%
%Inputs:
%   A= coefficient matrix

%Outputs:
%   L= lower triangular matrix
%   U= upper triangular marix
%   P= pivot matrix

if nargin>1         %returns error message if more than one argument is input
    error('I think you are mistaken, you put too many arguments in. Try just one ;)');
end

[m,n]=size(A);
if m~=n             % Returns an error is the matrix is not square
    error('Your matrix input seems to fail to be a square. Be sure that your number of rows matches your columns');
elseif m==1||n==1   % Returns an error if the input is a vector
    error('Well I can not very well do this if you are going to give me vectors and not matricies');
end

L=eye(m);           % Creates a matrix with 1s on the diagnol
U=A;                % Assigns the variable u to the matrix A
P=eye(m);           % Creates a matrix with 1s on the diagnol

for c=1:m
    col = U((c:m),:);                               % Sets the coulumn if U to be used 
    [~,l] = max(abs(col),[],1);                     % Finds the largest absolute number and sets it equal to l in a vector
    U([l(c)+c-1 c],:) = U([c l(c)+c-1],:);          % Pivots the U matrix by setting two vectors equal to eachother
    P([l(c)+c-1 c],:) = P([c l(c)+c-1],:);          % Pivots the P matrix by setting two vectors equal to eachother
    if c > 1
        for x = 1:(c-1)
            L([l(c)+c-1 c],x) = L([c l(c)+c-1],x);  % Will pivots the L matrix only after the first iteration and only if neccesary
        end
    end
    for o = 1:(m-c)
        L(c+o,c) = U(c+o,c)/U(c,c);                     % Evaluates  the ratio at which to multiply by and creates lower triangle matrix      
        U(c+o,:) = U(c+o,:) - U(c,:).*U(c+o,c)/U(c,c);  % Elimates values entire rows at a time to produce the upper triangle matrix
    end
end