## General Usage:
##    
##  > x <- matrix(sample(16), 4,4)
##
##  > matrixObject <- makeCacheMatrix(x)
##
##  > matrixObject.getInverse()
##    [1] NULL
##
##  > cacheSolve(matrixObject)
##    [1] ... Inverse Matrix Data
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
	
	#gets the inverse matrix value
	getInverse	<- function()		{inverse}
  
  # the return value is a group of named functions
  # with access to the constructing function's data.
  list(getMatrix = getMatrix,
       setMatrix = setMatrix, 
       getInverse = getInverse, 
       setInverse = setInverse)
}


## This function returns the inverse of the input matrix
## It gets the inverse stored in the object, if available,
## otherwise, it calculates and stores the inverse on the object
## before returning the calculated value.
cacheSolve <- function(x, ...) {
	inv <- x$getInverse();
	
	if (is.null(inv)) {
		inv <- solve(x$getMatrix())
		x$setInverse(inv)
	} 
	
	inv;
}
