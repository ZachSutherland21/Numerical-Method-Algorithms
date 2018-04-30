# Numerical-Method-Algorithms
Mechanical Engineering Class 105 Projects Using MATLAB

The aglorithms are desinged to replicate the way a computer numerically analysis data to further our understanding of the computaional process.

**falsePosition**
    The falsePosition test a seiries of values with the given inputs to return an estimate for the root of the function. The falsePosition function uses a bracketing method that is designed to always work. The function may be slower than other methods, but it will produce reliable results.
  
**luFactor**
    The function luFactor is designed to take a square matrix of coefficient values and return the lower triangular matrix, upper triangular matrix, and the pivot matrix. The function uses a combination of the Gauss elimination and partial pivoting to produce a series of matricies that together create the identity matrix of the original data values. This function is particurly useful when working with a closed system and several of the coefficients must be adjusted but the final product remains the same or vice versa.
    
**Simpson**
    The function Simpson is designed to determine the integral of a series of data points using the Simpson's 1/3 rule. Should there be an odd number of data points, then the funtion will use the trapazoidal method for the final interval of the given data points. The function relies on 2 series of data points of equal length to be provided. The algorithm will then evaluate whether or not the data can be used and will return the integral.

**Heun**
    The Heun function is designed to replicate the modified Euler's Method. It opperates with the given parameters of the dy/dx function, 
an initial condition, the bounds, step size, and an optional input of both the estimated error and max number of iterations. The function 
is designed to have a corrective step size if the step size does not fit the provided bounds properly. When finished the algorithm will plot the stored data points to display the estimated polynomial.
