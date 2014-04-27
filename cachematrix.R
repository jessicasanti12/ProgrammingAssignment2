## These 2 functions create a special object that stores  
## a matrix and caches its inverse.

## makeCacheMatrix creates a special "matrix" object
## that can cache its inverse. 

makeCacheMatrix <- function(MyMatrix = matrix()) {
## sets argument MyMatrix
        m <- NULL
        set <- function(y) {
                MyMatrix <<- ys
                m <<- NULL
        }
        get <- function() MyMatrix
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## cacheSolve computes the inverse of the special "matrix"
## returned by the makeCacheMatrix function. It should 
## retrieve the inverse from the cache if the inverse
## has already been calculated and the matrix has not
## changed. 

cacheSolve <- function(MyMatrix, ...) {
        ## Return a matrix that is the inverse of 'MyMatrix'
        m <- MyMatrix$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- MyMatrix$get()
        m <- solve(data, ...)
        MyMatrix$setsolve(m)
        m
}
