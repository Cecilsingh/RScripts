###Load Packages###

#Load parallel package
#Allows for parallel processing
library(parallel)

###Functions###

#Create function that loops through 100 times
createLoop <- function(i){
i <- 1
while (i < 100) {
  print(i)
  i = i+1
 }
}


###Capture Results###

#Non-parallel code execution
#lapply iterates over the while loop
#Runs the createLoop function above 1000 times
system.time(nonParallelFunc <- lapply(1:1000, createLoop))

#Parallel code execution
#mclapply is provided by the parallel package, and splits the iteration of multiple cores
#Runs the createLoop function above 1000 times
system.time(parallelFunc <- mclapply(1:1000, createLoop))

###Display Function Results###
#createLoop()
