################################################################################
#Project: genetics breakdown
#File: histPermutation.r
#Author: Giovanni Guglielmi
#Description: plot the histogram of permutation test
################################################################################

histPermutation <- function(list_perm, nameSample1, nameSample2, side)
{
  #browser()
  #create labels for plot
  x_label <- bquote(Delta*F[H[0]]==~ 
                      "Permutation Breakdown Frequencies"~.(nameSample1)
                    ~ " vs " ~.(nameSample2))
  y_label <- bquote(P(Delta*F[H[0]] == delta*f))
  title_label <- paste("Permutation Distribution", nameSample1, "vs", 
                       nameSample2, side, "(p =", round(list_perm$p_value, 5), ")")
  
  #create x-axis limits for plot
  eps <- 0.00001
  x_min <- min(list_perm$statistics - eps, min(list_perm$distibution_H0))
  x_max <- max(list_perm$statistics + eps, max(list_perm$distibution_H0))
  
  
  hist(x = list_perm$distibution_H0, xlab = x_label, 
       ylab = y_label, main = title_label, freq = F, col = "seagreen3", 
       xlim = c(x_min, x_max))
  
  abline(v = quantile(list_perm$distibution_H0, 
                      c(0.025, 0.975)), 
         col = "red", lwd = 3)
  abline(v = list_perm$statistics, col = 'orchid', lwd = 3)
  
}