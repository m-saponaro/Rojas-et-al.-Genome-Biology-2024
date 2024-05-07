################################################################################
#Project: genetics breakdown
#File: perm2samples.r
#Author: Giovanni Guglielmi
#Description: permutation test on two different sample
################################################################################


#definition of the function
perm2samples<- function(FUN, sample_x, sample_y, N_b = 10^4)
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
  #results <- list 3
   #distribution_H0 <- vector N_bx1, null distribution of test
   #statistics <- scalar value, observed statistics
   #p_value <- scalar value, p-value of test
  perm_stats = rep(NA, times = N_b)
  all_data = c(sample_x, sample_y)
  half_sample = as.integer(N_b/2)
  results <- list()
  for(i in 1:half_sample)
  {
    #browser()
    all_sample = sample(all_data, replace = F, size = length(all_data))
    p_boot_x <- all_sample[1:length(sample_x)]
    p_boot_y <- all_sample[(length(sample_x) +1):length(all_data)]
    
    stat_x <- FUN(p_boot_x)
    stat_y <- FUN(p_boot_y)
    
    perm_stats[i] <- stat_x - stat_y
    
    #second half
    p_boot_x <- all_sample[(length(sample_y)+1):length(all_data)]
    p_boot_y <- all_sample[1:length(sample_y)]
    
    stat_x <- FUN(p_boot_x)
    stat_y <- FUN(p_boot_y)
    
    perm_stats[i + half_sample] <- stat_x - stat_y
  }
  #browser()
  results$distibution_H0 <- perm_stats
  results$statistics <- FUN(sample_x) - FUN(sample_y)
  results$p_value <- 2*(min(sum(perm_stats>results$statistics), 
                           sum(perm_stats<results$statistics))+1)/(length(perm_stats) + 1)
  return(results)
}