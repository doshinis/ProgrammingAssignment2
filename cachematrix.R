
# Matrix inversion is usually a costly computation and their may be some benefit 
# to caching the inverse of a matrix rather than compute it repeatedly.
# cachematrix.R contains a pair of functions that cache the inverse of a matrix.


##The "makeCacheMatrix" function, creates a special "matrix", containing
## the mtrix for which inverse will be calculated. It contains functions for:
##1.  set the value of the vector
##2.  get the value of the vector
##3.  set the value of the mean
##4.  get the value of the mean

## makeCacheMatrix should be called first as x <- makeCacheMatrix([matrix object]), 
## so that x object can be used by cacheSolve(x,...) to make calls using $operator

makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    set <- function(y) {
        x <<- as.matrix(y)
        m <<- NULL
    }

    get <- function() as.matrix(x)
    setImatrix <- function(Imatrix) m <<- as.matrix(Imatrix)
    getImatrix <- function() m
    list(set = set, get = get,
         setImatrix = setImatrix,
         getImatrix = getImatrix)
  
}


## cacheSolve(x) will use the argument x to retrieve the existing inverse matrix 
## using x$getImatrix(), if the inverse matrix is NULL, 
## it would mean it is called for the first time and
## hence will "$get" the matrix for which inverse needs to be calculated.
## After "solve" of the matrix, the inverse value will be set in cache,
## using x$setImatrix(m) for future reference. 
## Any subsequent call for the same vector will get inverse matrix from cache. 

cacheSolve <- function(x, ...) {
   
    m = matrix()
    m <- x$getImatrix()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    
    mdata <- x$get()
    m <- solve(mdata, ...)
    x$setImatrix(m)
    m
  
  ## Return a matrix that is the inverse of 'x'
}
