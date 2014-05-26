## General Usage:
##    
##  > x <- matrix(sample(16), 4,4)
##
##  > matrixObject <- makeCacheMatrix(x)
##
## ... and then:
##
##  > matrixObject.getInverse(lazy = FALSE)
##    [1] NULL
##
##  > cacheSolve(matrixObject)
##    [1] ... Inverse Matrix Data
##
##  > matrixObject.getInverse(lazy = FALSE)
##    [1] ... Inverse Matrix Data
##
## ... or:
##
##  > matrixObject.getInverse()
##    [1] ... Inverse Matrix Data
##


## This function creates an object
## which stores a value (the matrix) and its inverse
makeCacheMatrix <- function(x = matrix()) {
	
	#Stores the inverse if its been calculated
	inverse <- NULL
	
	#sets the matrix value (resets inverse)
	setMatrix <- function(y) {
		x <<- y
		setInverse(NULL)
	}
	
	#gets the matrix value
	getMatrix	<- function() 		{x}
	
	#sets the inverse matrix value
	setInverse	<- function(inv)	{inverse <<- inv}
	
	# Gets the inverse matrix value.
  #
  # If called without explicit parameter lazy = FALSE, 
  # cacheSolve will be used.
	getInverse	<- function(..., lazy = TRUE)		{
		if (lazy) cacheSolve(this)
		else inverse
	}
  
  # The return value is a group of named functions
  # With access to the constructing function's environment data.
  #
  # It's stored as 'this' so it can pass itself to cacheSolve.
  this <- list(getMatrix = getMatrix,
       setMatrix = setMatrix, 
       getInverse = getInverse, 
       setInverse = setInverse)
  
  this
}


## This function returns the inverse of the input matrix
## It uses the inverse stored in the object, if available.
## Otherwise, it calculates the inverse and stores it in 
## the object before returning.
cacheSolve <- function(x, ...) {
  
  # the lazy property is used to prevent infinite loop
  # if called from x$getInverse()
	inv <- x$getInverse(lazy=FALSE);
	
	if (is.null(inv)) {
		inv <- solve(x$getMatrix())
		x$setInverse(inv)
	} 
	
	inv;
}
