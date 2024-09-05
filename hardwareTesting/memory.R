#Install the tictoc package to time R scripts.
install.packages("tictoc")
#Install the lobstr package which allows us to understand R data structures.
install.packages("lobstr")

#Load libraries.
library(tictoc)
library(lobstr)

#Use the lobstr package to calculate the memory used so far.
lobstr::mem_used()
#Begin tictoc timer.
tic()
#Samples 1 billion random integers from the range of 1 to 10,000.
#Store these values into sampleFunc.
sampleFunc <- sample(1:10000, 10^9, replace = TRUE)
#Stop the tictoc timer.
toc()

#Display the memory used.
lobstr::mem_used()
