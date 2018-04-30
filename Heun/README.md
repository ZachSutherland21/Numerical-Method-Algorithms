# Heun
    The heun function relies on the the input of the dy/dx function, the initial condition, the bounds, step size, and the optional
estimated error as well as the max number of iterations. Given this information, the algorithm will resize the final step size if it 
does not properly fit the bounds and then create a vector containing the data points based of the step size from the lower bound to 
the upper bound. Using the initial condition the algorithm will then determine the left side slope. Given the left slope, the function 
then predicts values to determine the right slope. Using both the left and right side slopes a corrector is then used to determine 
the y value at that point. This process is then repeated until either the value of the estimated error is met or the max number of
iterations. the y value is then stored in a vector. The algorithm then moves to the next step size and repeats the proccess until all
values in the step size 't' vector have been evaluated. The then stored t and y values are plotted on a graph for the user to view the 
approximated polynomial function.
