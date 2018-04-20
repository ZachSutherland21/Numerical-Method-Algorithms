function [false_position]=falsePosition(func,xl,xu,es,maxiter)
% falsePosition test a seiries of values with the given inputs to return an
% estimate for the root of the function
%
%Inputs:
%func- the function being tested by the user (please format function as a
%handle ex: @(x)x^2-2)
%xl-the lower guess of the root's value
%xu-the upper guess of the root's value
%es- desired relative error (defaults to .0001%)
%maxiter- numer of desired iterations (defaults to 200)
%
%Outputs:
%root- the estimated root location
%fx- the function evaluated at the root location
%ea- the approximate relative error
%iter- how many iterations were performed
if nargin<3||nargin>5 %returns error if user does not input minimum 3 values or inputs more than 5
    error('Please input between 3 and 5 inputs. Reffer to the help if you seriously dont get it...SMH');
elseif nargin==4
    maxiter=200;    %defaults max iterations to 200 if only 4 values are specified
elseif nargin==3
    es=.0001;       %defaults relative error to .0001 and max iterations to 200 if only 3 inputs are provided
    maxiter=200;
end
if func(xl) * func(xu) > 0      %test for sign value to be sure guesses bracket root
    error('You should really get better at guessing. Maybe a guess that actually brackets the root.')
end
prev=xu;    %sets an initial previous root value to buld from
for iter=1:maxiter      %for loop running iterations from 1 to max value
    false_position=xu-((func(xu)*(xu-xl))/(func(xu)-func(xl)));     %false position of root equation
    ea=abs((false_position-prev)/false_position)*100;               %absolute percent error
    prev=false_position;        %sets new previous root 
    if ea<=es                   %test if percent relative error has been satified and breaks loop if so
        break
    end
    if func(xl)*func(false_position)<0  %test to see if root is before false position root guess
        xu=prev;                        %sets upper guess to false position root if so
        continue
    else
        xl=prev;                        %if not sets lower guess to false position root
        continue
    end
end
root=false_position;                   
fx=func(false_position);
disp('The approximate root of your function is X= ' ); %displays output variables
disp(root);
disp('The function exaluated at the root was y= ');
disp(fx);
disp('The total iterations performed were ');
disp(iter);
disp('The approximate % error was: ');
disp(ea);
