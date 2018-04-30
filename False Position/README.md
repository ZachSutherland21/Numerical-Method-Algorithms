# falsePosition
   The falsePosition test a seiries of values with the given inputs to return an estimate for the root of the function. 
The falsePosition function uses a bracketing method that is designed to always work. The function may be slower than other 
methods, but it will produce reliable results.

The funtion relies on several inputs by the user. A minimum of 3 inputs and a max of 5. The required inputs are the function 
being evaluated, the left bound and the right bound. Optional inputs include the number of iterations the function is to perform
and the desired approximate error. If those two are not provided then the function will default to 200 iterations and an Ea of
.0001%. The function will evaluate whether or not the function crosses the x axis in the given interval through an evaluation 
of sign change,then will procede to estimate the root by a secant line connecting the 2 points. The function will repeat this process
until the specified number of iterations are met or the approximate error is reached. The function will then return the root value, 
the number of iterations used and the approximate error.
