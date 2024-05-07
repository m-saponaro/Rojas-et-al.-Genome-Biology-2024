################################################################################
#Project: genetics breakdown
#File: boot2samples.r
#Author: Giovanni Guglielmi
#Description: boot2samples
################################################################################


#definition of the function
boot2samples<- function(FUN, sample_x, sample_y, N_b = 10^4)
{
  #Description:
  ############
  #Compute difference of statistics
  
  #input:
  #######
  #f_stat <- statistics
  #sample_x <- vector Nx1, sample 1
  #sample_y <- vector Mx1, sample 2
  #N_b <- bootstraps resampling
  
  #output:
  #######
  #resutlts <- list 4 elements
   #distribution_b <- vector (N_b)x1, bootstrap sampling distibution
   #statistics <- scalar value, sample statistics
   #ci95 <- vector 2x1, bootstrap confidence interval 95% two tails
   #bias_se <- scalar value, bias/se

  boot_stats = rep(0, times = N_b)
  results <- list()
  
  for(i in 1:N_b)
  {
    #browser()
    p_boot_x <- sample(sample_x, replace = T, size = length(sample_x))
    p_boot_y <- sample(sample_y, replace = T, size = length(sample_y))
    
    boot_stats[i] <- FUN(p_boot_x) - FUN(p_boot_y)
  }
  #bias-SE tradeoff
  results$distribution_b <- boot_stats
  results$statistics <-  FUN(sample_x) - FUN(sample_y)
  results$ci95 <- quantile(boot_stats, c(0.025, 0.975))
  results$bias_se <- abs(mean(boot_stats) - results$statistics)/ sd(boot_stats)
  return(results)
}