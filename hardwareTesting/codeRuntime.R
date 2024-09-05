#Load the tictoc library.
library(tictoc)

#Begin tictoc timer.
tictoc::tic()

#A FOR loop that iterates 100,000 times. 

for (i in 1:100000){
#The number is printed to the screen and stored in the result variable.
  result=i+1
  print(result)
}

#Stop the tictoc counter.
tictoc::toc()
