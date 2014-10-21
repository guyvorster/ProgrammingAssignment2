## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) 
{
        
       # browser()
        m <- NULL
       
        #pass in a new matrix into the function instead of having to call it all over again
        set <- function(y) 
        {
                x <<- y
                m <<- NULL
        }
        
        #return whatever was passed into the function
        get <- function() x
        
        
        #uses the solve function on the original matrix to return the invesrse matrix
        getinverse <- function () 
        {
                print ("in getinverse function")
                            
                
                if(!is.null(m)) 
                {
                        message("getting cached matrix")
                        #return(m)
                }
                else 
                {
                        print ("creatig the inverted matrix for the first time")
                        m <<- solve(x)
                }
                
               # print (m)
                print ("done in getinverse")
                
                
                #returns the inverse of the matrix x which was passed in
                #m <<- solve(x)
             return (m)
        }
        
        #the list of methods to call on the function
        list(set = set, get = get,
             getinverse = getinverse)
       
#end of makeCacheMatrix        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) 
{

     #  browser()
        print ("in cachesolve, about to call getinv")
       
        
        m <- x$getinverse()
       print ("in cachesolve, done in getinv")
        
        
    #   if(!is.null(m)) 
    #    {
    #       message("getting cached matrix")
          # return(m)
    #    }
    #   else {m <- x$getinverse()}
       
        #the data returns the original matrix that was passed in
        data <- x$get()
       
        
        #returns the inverted matrix
      return(m)
        
#end of cacheSolve
}

