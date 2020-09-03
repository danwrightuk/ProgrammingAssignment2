## The first function creates a special matrix object.
## The second function computes the special matrix's inverse
## and can retrieve the inverse from the cache if already calculated.

## Creates a special matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
}

get <- function() x

setInverse <- function(inverse) i <<- inverse
getInverse <- function() i
list(set = set, get = get, 
     setInverse = setInverse,
     getInverse = getInverse)

}

## Retrieves the inverse from the cache if it's already been calculated.
## Calculates the inverse of the special matrix from "makeCacheMatrix".

cacheSolve <- function(x, ...) {
  i <- x$getInverse()
  if(!is.null(i)) {
      message("getting cached data")
    return(i)
    
  }

  data <- x$get()
  ## Uses the solve function to calculate the inverse
  i <- solve(data, ...)
  x$setInverse(i)
  
  ## Return a matrix that is the inverse of 'x'
 
   i
        
}

