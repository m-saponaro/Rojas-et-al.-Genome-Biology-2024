################################################################################
#Project: genetics breakdown
#File: histBootstrap.r
#Author: Giovanni Guglielmi
#Description: plot the histogram of bootstrap sampling distribution
################################################################################

histBootstrap <- function(list_boot, nameSample1, nameSample2, side)
{
  x_label <- bquote(Delta*F==~ 
                   "Difference of  Breakdown Frequencies"~.(nameSample1)
                   ~ " vs " ~.(nameSample2))
  y_label <- bquote(P(Delta*F == delta*f))
  title_label <- paste("Bootstrap", nameSample1, "vs", nameSample2, side)
  hist(list_boot$distribution_b, xlab = x_label, ylab = y_label, main = title_label, 
       breaks = 50, freq = F, col = "skyblue3")
  abline(v = list_boot$ci95, col = "red", lwd = 3)
  
}