makeTestMatrix <- function() {
  x <- matrix(sample(16), 4,4)
  matrixObject <- makeCacheMatrix(x)
}

test1 <- function() {
  print("<TEST-1> ")
  
  matrixObject <- makeTestMatrix()
  print("------ lazy = FALSE ------")
  print(matrixObject$getInverse(lazy = FALSE))
  print("------ cacheSolve   ------")
  print(cacheSolve(matrixObject));
  print("------ lazy = FALSE ------")
  print(matrixObject$getInverse(lazy = FALSE))
  
}

test2<- function() {
  print("<TEST2>")
  matrixObject <- makeTestMatrix()
  print(matrixObject$getInverse())
}

test1()
print("--------------------------")
test2()
