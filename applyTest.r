x = replicate(10, rnorm(20)) 

myFunction <- function(a)
{
  id = which(a>0)
  sumAll = sum( a[id] )
  return( sumAll )
}
for(i in 1:10)
{
  test = myFunction(x[,i])
  print(test)
}

result = apply(x,2,myFunction)
print(result)

