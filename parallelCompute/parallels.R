###Load Packages###

#Load parallel package
#Allows for parallel processing
library(parallel)

###Functions###

#Create function that loops through 1000 times
createForLoop <- function(i){
  for (i in 1:1000){
    j=i+1
  }  
}

###Capture Results###

#Non-parallel code execution
#lapply iterates over the while loop
#Runs the createLoop function above 1000 times
system.time(nonParallelFunc <- lapply(1:10000, createForLoop))

#Parallel code execution
#mclapply is provided by the parallel package, and splits the iteration of multiple cores
#Runs the createLoop function above 1000 times
system.time(parallelFunc <- mclapply(1:10000, createForLoop))

###Display Function Results###
#createForLoop()
