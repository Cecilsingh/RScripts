###Load Packages###

#Load parallel package
#Allows for parallel processing
library(parallel)

#Load LME package
#Allows for the use of liner models
library(lme4)

###Functions###

#Use the lme4 package to create a linear mixed-effects model
##This is a type of model that is used to analyze data with fixed and random effects, accounting for variability.

#Function adapted from the University of Michigan
#Petal.Width is the outcome variable
#Iris plant data
#"Petal.Width ~ . - Species + (1 | Species)" is the model formula
# - petal.width is the response variable (what you're trying to predict)
## - .(dot) is all other variables in the dataset
## - "- species" means that we are excluding species
## - "(1 | species)" specifies a random intercept for the species variable. Accounting for the fact that measurements from different species may be correlated
createMatrix <- function(i) {
  lmer(Petal.Width ~ . - Species + (1 | Species), data = iris)
}

###Capture Results###

#Non-parallel code execution
#lapply iterates over a list
#Runs the createMatrix function above 1000 times
system.time(nonParallelFunc <- lapply(1:1000, createMatrix))

#Parallel code execution
#mclapply is provided by the parallel package, and splits the iteration of multiple cores
#Runs the createMatrix function above 1000 times
system.time(parallelFunc <- mclapply(1:1000, createMatrix))

###Display Function Results###
#createMatrix()
