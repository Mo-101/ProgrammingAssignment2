## This is a function that creates a cache matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  c <- NULL
  set <- function(y) {
    x <<- matrix(y)
    c <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) c <<- solve
  getinverse <- function() c
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

 ## The catchesolve function resolves the cache and gets the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  c <- x$getinverse()
  if(!is.null(c)) {
    message("getting cached data")
    return(c)
  }
  data <- x$get()
  c <- solve(data, ...)
  x$setinverse(c)
  c
}

