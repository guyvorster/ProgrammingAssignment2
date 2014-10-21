#these two functions form part of assignment 2 in the R course and are used as a means
#to teach lexical scoping.  

#makeCacheMatrix takes a matrix as input and returns a function as output.
#This function allows the calling environment to execute "methods" on the function
#to perform tasks such as returning the matrix that was passed in, returning the inverted matrix
#and setting data.
makeCacheMatrix <- function(x = matrix()) 
{    
        m <- NULL
       
        #this method allows the calling environment to pass in a new matrix
        #into the function instead of having to call it all over again
        set <- function(y) 
        {
                #when set is called, we need to reset the main variables that
                #hold the matrix and the inverted matrix
                x <<- y
                m <<- NULL
        }
        
        #return whatever was passed into the function
        get <- function() x
        
        
        #uses the solve function on the original matrix to return the invesrse matrix
        getinverse <- function () 
        { 
                if(!is.null(m)) 
                {
                        message("getting cached matrix, no need to create it")
                        return (m)
                }
                else 
                {
                        message ("creating the inverted matrix for the first time")
                        m <<- solve(x)
                        return(m)
                }
        #end of getinverse        
        }
        
        #the list of methods to call on the function
        list(set = set, get = get,
             getinverse = getinverse)
       
#end of makeCacheMatrix        
}



#cacheSolve returns an inverted matrix
cacheSolve <- function(x, ...) 
{
        #get the inverted matrix
        m <- x$getinverse()
             
        #the data returns the original matrix that was passed in
        data <- x$get()
       
        
        #returns the inverted matrix
      return(m)
        
#end of cacheSolve
}

