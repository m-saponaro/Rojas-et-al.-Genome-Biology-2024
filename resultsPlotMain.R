################################################################################
#Project: genetics breakdown
#File: resultsPlot_Main.r
#Author: Giovanni Guglielmi
#Description: read the data
#             merge the data
#             correction p-values
#             plot volcano
################################################################################

################################################################################
############################### LIBRARIES ######################################
################################################################################

setwd("C:/Users/gguglielmi/OneDrive - The University of Melbourne/uniPhD/projects/computational_genomics")

source("my_functionR/volcano.r")
################################################################################
############################### READ ###########################################
################################################################################

es3_left <- read.csv(file = "dataResults/es3_left.csv", header = T)

es3_leftFlip <- read.csv(file = "dataResults/es3_leftFlip.csv", header = T)

es3_right <- read.csv(file = "dataResults/es3_right.csv", header = T)

es3_rightFlip <- read.csv(file = "dataResults/es3_rightFlip.csv", header = T)

es4_left <- read.csv(file = "dataResults/es4_left.csv", header = T)

es4_leftFlip <- read.csv(file = "dataResults/es4_leftFlip.csv", header = T)

es4_right <- read.csv(file = "dataResults/es4_right.csv", header = T)

es4_rightFlip <- read.csv(file = "dataResults/es4_rightFlip.csv", header = T)

es5_left <- read.csv(file = "dataResults/es5_left.csv", header = T)

es5_leftFlip <- read.csv(file = "dataResults/es5_leftFlip.csv", header = T)

es5_right <- read.csv(file = "dataResults/es5_right.csv", header = T)

es5_rightFlip <- read.csv(file = "dataResults/es5_rightFlip.csv", header = T)

ls_left <- read.csv(file = "dataResults/ls_left.csv", header = T)

ls_leftFlip <- read.csv(file = "dataResults/ls_leftFlip.csv", header = T)

ls_right <- read.csv(file = "dataResults/ls_right.csv", header = T)

ls_rightFlip <- read.csv(file = "dataResults/ls_rightFlip.csv", header = T)

ms_left <- read.csv(file = "dataResults/ms_left.csv", header = T)

ms_leftFlip <- read.csv(file = "dataResults/ms_leftFlip.csv", header = T)

ms_right <- read.csv(file = "dataResults/ms_right.csv", header = T)

ms_rightFlip <- read.csv(file = "dataResults/ms_rightFlip.csv", header = T)

ntnt_left <- read.csv(file = "dataResults/ntnt_left.csv", header = T)

ntnt_leftFlip <- read.csv(file = "dataResults/ntnt_leftFlip.csv", header = T)

ntnt_right <- read.csv(file = "dataResults/ntnt_right.csv", header = T)

ntnt_rightFlip <- read.csv(file = "dataResults/ntnt_rightFlip.csv", header = T)

tcodtcod_left <- read.csv(file = "dataResults/tcodtcod_left.csv", header = T)

tcodtcod_leftFlip <- read.csv(file = "dataResults/tcodtcod_leftFlip.csv", header = T)

tcodtcod_right <- read.csv(file = "dataResults/tcodtcod_right.csv", header = T)

tcodtcod_rightFlip <- read.csv(file = "dataResults/tcodtcod_rightFlip.csv", header = T)

th2hth2h_left <- read.csv(file = "dataResults/th2hth2h_left.csv", header = T)

th2hth2h_leftFlip <- read.csv(file = "dataResults/th2hth2h_leftFlip.csv", header = T)

th2hth2h_right <- read.csv(file = "dataResults/th2hth2h_right.csv", header = T)

th2hth2h_rightFlip <- read.csv(file = "dataResults/th2hth2h_rightFlip.csv", header = T)

ttranttran_left <- read.csv(file = "dataResults/ttranttran_left.csv", header = T)

ttranttran_leftFlip <- read.csv(file = "dataResults/ttranttran_leftFlip.csv", header = T)

ttranttran_right <- read.csv(file = "dataResults/ttranttran_right.csv", header = T)

ttranttran_rightFlip <- read.csv(file = "dataResults/ttranttran_rightFlip.csv", header = T)

################################################################################
############################### DATA MERGING AND REFINIMENTS####################
################################################################################

#merging all the datasets
allExperiment <- rbind(es3_left, es3_leftFlip, es3_right, es3_rightFlip, 
                       es4_left, es4_leftFlip, es4_right, es4_rightFlip,
                       es5_left, es5_leftFlip, es5_right, es5_rightFlip,
                       ls_left, ls_leftFlip, ls_right, ls_rightFlip, 
                       ms_left, ms_leftFlip, ms_right, ms_rightFlip, 
                       ntnt_left, ntnt_leftFlip, ntnt_right, ntnt_rightFlip,
                       tcodtcod_left, tcodtcod_leftFlip, tcodtcod_right, tcodtcod_rightFlip,
                       th2hth2h_left, th2hth2h_leftFlip, th2hth2h_right, th2hth2h_rightFlip,
                       ttranttran_left, ttranttran_leftFlip, ttranttran_right, ttranttran_rightFlip)


#tag inf = 10
allExperiment$logFC[allExperiment$logFC == -Inf] <- -10
allExperiment$logFC[allExperiment$logFC == Inf] <- 10

################################################################################
############################### P-VALUE CORRECTION #############################
################################################################################

allExperiment$pAdj <-p.adjust(p = allExperiment$pvalue, method = "BY")

volcano(dataset = allExperiment, 
        logical_significant = allExperiment$pAdj < 0.05, 
        logical_text =allExperiment$pAdj < 0.01 & abs(allExperiment$logFC) > 2)







