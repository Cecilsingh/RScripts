#The rep() function is used to repeate
#The value to be repeated is the number 1 
#1e9 is the scientific notation for one billion

firstHalfMem <- rep(1, 1e9)

secondHalfMem <- rep(1, 1e9)

#additionalMem <- rep(1, 1e8)

#Measures the time taken for a specific block of code to execute, in this case, a for loop
#The tictoc package provides functions to measure time
#tictoc::tic() starts the timer and records the current time which is used to measure the duration of code execution
#The for loop iterates 100 times
#tictoc::toc() stops the timer
#tic() shows how long the code inside tic() and toc() calls took to execute
library(tictoc)

tictoc::tic()

for (i in 1:100){
  j=i+1
  #gc()
}

tictoc::toc()


#rm(firstHalfMem)

#gc()
