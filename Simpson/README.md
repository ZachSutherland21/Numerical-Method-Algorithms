 # Simpson
   The function Simpson is designed to determine the integral of a series of data points using the Simpson's 1/3 rule. 
Should there be an odd number of data points, then the funtion will use the trapazoidal method for the final interval 
of the given data points. The function relies on 2 series of data points of equal length to be provided. The algorithm 
will then evaluate whether or not the data can be used and will return the integral.
    After calling thee function the 2 given series will be compared for matching number of data points, number of inputs,
and even intervals over the "x" series. If either of these do not match then the function will end and return an error. 
If all do match then it will determine the number of intervals and warn the user if the trapazoidal method must be used. 
Otherwise the function will use the composite simpson's rule for all points. There are two events when the trapaziodal 
method will be used. The first if only three data points are provided, or if there ar an odd number of values, in which 
case the traps method will be used on the final interval. Both of with will return a less accurate estimate of the integral.
