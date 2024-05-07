################################################################################
#Project: genetics breakdown
#File: zeroToTrue.r
#Author: Giovanni Guglielmi
#Description: zeroToTrue() convert the 0s in TRUE and non-0 in FALSE
################################################################################

 zeroToTrue <- function(vector)
 {
   #Description:
   ############
   #convert the true statistics in 
   
   #input:
   #######
   #vector <- array Nx1 of integer values, it contains several discrete numbers
   
   #output:
   #######
   #my_logical <- array Nx1 of logical values, it contains the results 
   
   #browser()
   my_logical <- vector == 0
   return(my_logical)
 }