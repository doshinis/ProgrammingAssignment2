Assignment: Caching the Inverse of a Matrix
========================================================
### Description
Matrix inversion is usually a costly computation and their may be some benefit 
to caching the inverse of a matrix rather than compute it repeatedly.
cachematrix.R contains a pair of functions that cache the inverse of a matrix.

Following are the simple tests with results from Console.

### TEST 1
####

# > m1 <- matrix(1:4, 2, 2)
# > m1
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > x <- makeCacheMatrix(m1)
# > cacheSolve(x)
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > cacheSolve(x)
# getting cached data
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
# > source('D:/Work/DataScience/DSProject1/ProgrammingAssignment2/cachematrix.R')
# > cacheSolve(x)
# getting cached data
#       [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

### TEST 2
####
# > m1 <- matrix( c(-1, -1, 2, 1), nrow = 2, ncol = 2)
# > m1
#       [,1] [,2]
# [1,]   -1    2
# [2,]   -1    1
# > x <- makeCacheMatrix(m1)
# > cacheSolve(x)
#       [,1] [,2]
# [1,]    1   -2
# [2,]    1   -1
# > cacheSolve(x)
# getting cached data
#       [,1] [,2]
# [1,]    1   -2
# [2,]    1   -1
# > 