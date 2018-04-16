%% Problem 1
function[nd]=days(mo,da,leap)
%days calculates the number of elapsed days in  a year
%
%Inputs:
%mo-is the current month
%da-is the current day
%leap-(Optional)Is if the present year is a leap year. Adds 1 day. Input
%1.(Default 0)
%
%Output:
%nd-the number of elapsed days in that year
feb=28;
jan=31;
tic
if nargin<=1 || nargin>3
    error('Bruh....just read the help')
elseif nargin==2
    leap=0;
end
if mo>12||da>31
    error('invalid input')
elseif mo<0||da<0
    error('You obviously exist in an alternate dimension if your time can be negative')
elseif mod(mo,2)==0
    if mo>=4
        nd=30*(mo-2)+feb+leap+(mo/2)+da;
    else
        nd=jan+da;
    end
elseif mod(mo,2)==1
    if mo>=3
        nd=31*(mo-2)+feb+da-((mo/2)-1.5)+leap;
    else
        nd=da;
    end
end
toc
