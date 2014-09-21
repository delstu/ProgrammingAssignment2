## Put comments here that give an overall description of what your
## functions do

## create a matrix object as a list of functions, because R does not support it natively

makeCacheMatrix <- function(x = matrix()) {
   # store the matrix and init the inverse
   set <- function (newmatrix) {
      # the matrix to keep
      the_matrix <<- newmatrix
      # the inverse
      the_inverse <<- NULL
    }
    get <- function () the_matrix
    set_inverse <- function (inverse_arg) the_inverse <<- inverse_arg

   # unfortunately this does not transparently cache, not sure why, but that is what the specs seem to imply
    get_inverse <- function () the_inverse
    # pass this psuedo-object out
    list (set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)

}


## a memoized version of inverting a matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x', where x is not the matrix but the psuedo object
  matrix_inverse <- x$get_inverse()
  if (!is.null(matrix_inverse)) {
    message("getting cached data, yeah")
    return matrix_inverse
  }
  # solve the matrix inversion, store it and then return it
  matrix <- x$get()
  matrix_inverse <- solve(matrix)
  x$set_inverse(matrix_inverse)
  return matrix_inverse
}
