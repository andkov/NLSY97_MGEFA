#############################################################
# prepare : options, packages, data
#rm(list=ls(all=TRUE)) #Clear out variables from previous runs.
options("scipen"=10, "digits"=5) # adjust how scientific notation is displayed

library(Hmisc)
library(sem)
library(psych)
library(corrgram)
library(ggplot2)
library(sem)

# Load custom functions
pathGitHub <- file.path("C:/Users/ludmila/Documents/GitHub")

source(file.path(pathGitHub,"Steiger_Multivariate/functions","Steiger R library functions.txt"))
source(file.path(pathGitHub,"Steiger_Multivariate/functions","AdvancedFactorFunctions.txt"))
source(file.path(pathGitHub,"Steiger_Multivariate/functions","fa.promax.R"))

# create new dataset without missing data 
dsMale<-subset(dsPersonality,sex==1)
sexGroup<-"male"
ds <-dsMale[personalityvars]
summary(ds)
R<-cor(ds) # correlation matrix R of personality variables
S<-cov(ds) # covariance matrix S of personality variables

empty<-matrix(numeric(0),ncol(R),ncol(R))
rownames(empty)<-rownames(R)
colnames(empty)<-paste0("xC",1:ncol(R))

table(ds$organized)


######### Initial data visualization #########
pathImageOut<-file.path(getwd(),"graphs","male") # save files in...
# Correlation matrix of 8 personality variables
title<-paste0("Correlation among 8 personality descriptors")
pathFileOut<-file.path(pathImageOut,paste0("personalitycor.png"))
png(filename = pathFileOut, width =7, height =7 , units = "in", res=400)
corrgram(R,upper.panel=panel.conf,lower.panel=panel.pie,type="cor",order=TRUE,
         main=title)
dev.off()

######################################################################
# Diagnosing number of factors
Scree.Plot(R)
FA.Stats(R,n.factors=1:4,n.obs=2500, RMSEA.cutoff=.05)
# Decomposion solutions, (1)
fit.3.Enzmann<-fa.promax(covmat=R,factors=3,n.obs=2500, digits=2, sort=2500)
fit.3.MLFA<-MLFA(Correlation.Matrix=R,n.factors=3, n.obs=2500)
#########################

fit.3.MLFA$Varimax$F
rownames(fit.3.MLFA$Varimax$F)
#################################################################################
pathScree<-file.path(getwd(),"functions","scree.R")
pathPattern<-file.path(getwd(),"functions","factor pattern.R")
nfactors<-3 #ncol(pattern)  #ncol(R)
colors<- c("darksalmon" ,"lightskyblue")
########### produce factor pattern graph
pathImageOut<-file.path(getwd(),"graphs") # save files in...
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
# solutions   [1]       [2]        [3]          [4]       [5]      [6]      [7]
solution<-c("eigen()", "svd()","principal()","factanal()","sem()","MLFA", "Enzmann")

str(fit.3.Enzmann)
str(fit.3.MLFA)

#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[7] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.Enzmann$unrotated.loadings
drawing<- "Unrotated"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings


#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[7] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.Enzmann$varimax.loadings
drawing<- "Varimax"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings

#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[7] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.Enzmann$promax.loadings
drawing<- "Promax"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings

#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[6] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.MLFA$Unrotated$F
drawing<- "Unrotated"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings

#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[6] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.MLFA$Varimax$F
drawing<- "Varimax"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings

#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[6] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.MLFA$Promax$F
drawing<- "Promax"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings


#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[6] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.MLFA$Quartimin$F
drawing<- "Quartimin"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings

#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[6] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.MLFA$Bifactor$F
drawing<- "Bifactor"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings


#############################################################
# Image production
# Chose labels for graph production
whatsolution<- solution[6] #!!! Choose !!!#
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
pattern<-fit.3.MLFA$BifactorOblique$F
drawing<- "BifactorOblique"  
pathImageOut<-file.path(getwd(),"graphs",sexGroup) # save files in...
title1<- paste0("Pattern values from ",whatsolution," solution:",drawing)
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-16              # width of pattern in inches
height<-9             # height of pattern in inches
resolution<-200         # resolution of pattern 
source(pathPattern) #produces the graph of pattern loadings



























