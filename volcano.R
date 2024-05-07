################################################################################
#Project: group_5
#File: volcano.r
#Author: GROUP 5
#Description:
# -volcano plot
################################################################################
require("ggrepel")
require("gplots")

volcano <- function(dataset, logical_significant, logical_text, x_label = "logFC", 
                    y_label = "-log10(BY pvalue)", title = "All Experiment")
{
  ggplot(dataset, aes(x = logFC, y = -log10(pAdj))) + 
    geom_point(aes(color = logical_significant), size = 5) +
    scale_color_manual(values = c("palegreen1", "red1")) +
    ggtitle(title) +
    xlab(x_label) +
    ylab(y_label) +
    theme(
     axis.title.x = element_text(color="dodgerblue4", size=20, face="bold.italic"),
     axis.text.x = element_text(face="bold", size=18),
     axis.title.y = element_text(color="dodgerblue4", size=20, face="bold.italic"),
     axis.text.y = element_text(face="bold", size=18),
     plot.title = element_text(color="dodgerblue4", size=25, face="bold.italic", hjust = 0.5),
      legend.position='none'
   ) + 
   geom_text_repel(data=dataset[logical_text, ], 
                    aes(label= dataset[logical_text,1]), 
                    color = 'black', size = 7, box.padding = 1, segment.alpha = 1)
}