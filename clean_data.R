################################################################################
#Project: genetics breakdown
#File: clean_last.r
#Author: Giovanni Guglielmi
#Description: clean_data() extract the last column and remove the NA
################################################################################

clean_data <- function(data)
{
  #Description:
  ############
  #Extract the last column and remove the NA
  
  #input:
  #######
  #data <- array NxK, dataset with NA
  
  #output:
  #######
  #dataset <- array N*xK, dataset without NA
  
  #browser()
  return(data[!is.na(data)])
}