function[t,y]=Heun(dydt,tspan,y0,h,es,maxit)
% The Heun function will approximate the numerical integral solution to a
% differential equation over some span given an intial condition and a
% stepping size. A graph of the approvimated curve will also be returned.
%
%       *Inputs:*
% dydt  = diferential equation
% tspan = integration bounds
% y0    = initial condition
% h     = the step size from lower bound to upper bound
% es    = estimated error (if not defined will default to .001)
% maxit = number of iterations function is to perfom per data point (if not
%         specified will default to 50)
%
%       *Outputs:*
% t = a list of the independant data points from the lower bound to upper
% y = a list of the dependant data points determined using Heun's method

% Determines if number of inputs satifies requirements
if nargin<4 || nargin>6
    error('The number of provided arguments does not satify the function');
end

% Adresses default argument settings
if nargin==4
    es=.001;
    maxit=50;
end
if nargin==5
    maxit=50;
end

% checks if the step size has an irregular fit with the tspan
t=tspan(1):h:tspan(2);
[~,n]=size(t);
if t(n)~=tspan(2)
    t(n+1)=tspan(2);
    warning('The step size provided has an irregular fit with the provided end values, and requires a resizing on the final step size');
end

% Creates the y value vector
span_space=diff(t);
y=zeros(1,n);
y(1)=y0;

% Runs through the Heun process per step size evaluating if the error
% estimate is met or the itteration
for i=1:n    
    slope_left=dydt(t(i),y(i)); 
    pred=y(i)+span_space(i)*dydt(t(i),y(i));
    slope_right=dydt((t(i)+span_space(i)),pred);
    y(i+1)=y(i)+(span_space(i)/2)*(slope_left+slope_right);
    iter=1;
    er=1;
    while (er>es)&&(iter<=maxit)
        y_old=y(i+1);
        slope_right=dydt(pred,y(i+1)); 
        y(i+1)=y(i)+(tdiff(i)/2)*(slope_left+slope_right);
        er=abs((y(i+1)-y_old)/y(i+1));
        iter=iter+1;
    end
end

% Plots the numerical solution using the t and y vectors
plot(t,y);
xlabel('t'); ylabel('y'); title('Numerical Solution');