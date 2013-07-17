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
ds<-subset(dsW_PersonR,attcat_2002==3)
relcat<-"Goers"
ds <-ds[personalityvars]
summary(ds)


R<-cor(ds) # correlation matrix R of personality variables
S<-cov(ds) # covariance matrix S of personality variables

empty<-matrix(numeric(0),ncol(R),ncol(R))
rownames(empty)<-rownames(R)
colnames(empty)<-paste0("xC",1:ncol(R))

# table(ds$organized)


######### Initial data visualization #########
pathImageOut<-file.path(getwd(),"personality","goer") # save files in...

# Correlation matrix of 8 personality variables
title<-paste0("Correlation among 8 personality descriptors")
pathFileOut<-file.path(pathImageOut,paste0("personalitycor.png"))
png(filename = pathFileOut, width =7, height =7 , units = "in", res=100)
corrgram(R,upper.panel=panel.conf,lower.panel=panel.pie,type="cor",order=TRUE,
         main=title)
dev.off()

######################################################################
# Diagnosing number of factors
Scree.Plot(R)
FA.Stats(R,n.factors=1:4,n.obs=nrow(ds), RMSEA.cutoff=.05)
# Decomposion solutions, (1)
fit.3.MLFA<-MLFA(Correlation.Matrix=R,n.factors=3, n.obs=nrow(ds))
#########################
fit<-fit.3.MLFA # (2)

Loadings(fit,num.digits=2,cutoff=.3)
print(fit)
##########################
#str(fit.3.MLFA)
#fit.3.MLFA$Varimax$F
#rownames(fit.3.MLFA$Varimax$F)

#############################################################
########### options for the pattern graphs
pathPatternPerson<-file.path(getwd(),"functions","factor pattern person.R")
pathScree<-file.path(getwd(),"functions","scree.R")

nfactors<-3 #ncol(pattern)  #ncol(R)
colors<- c("darksalmon" ,"lightskyblue")
ylims<-c(0,3)           # (min,max) for eigenvalue plot 
width<-12              # width of pattern in inches
height<-16             # height of pattern in inches
resolution<-40         # resolution of pattern 
#################################################################################
# Image production

str(fit)

pattern<-fit.3.MLFA$Unrotated$F
rotation<- "Unrotated"  
title1<- paste0("Pattern values: ",rotation,"  |  Group: ", relcat)
source(pathPatternPerson) #produces the graph of pattern loadings

pattern<-fit.3.MLFA$Varimax$F
rotation<- "Varimax"  
title1<- paste0("Pattern values:  ",rotation,"  |  Group: ", relcat)
source(pathPatternPerson) #produces the graph of pattern loadings

pattern<-fit.3.MLFA$Promax$F
rotation<- "Promax"  
title1<- paste0("Pattern values:  ",rotation,"  |  Group: ", relcat)
source(pathPatternPerson) #produces the graph of pattern loadings

pattern<-fit.3.MLFA$Quartimin$F
rotation<- "Quartimin"  
title1<- paste0("Pattern values:  ",rotation,"  |  Group: ", relcat)
source(pathPatternPerson) #produces the graph of pattern loadings

pattern<-fit.3.MLFA$Bifactor$F
rotation<- "Bifactor"  
title1<- paste0("Pattern values:  ",rotation,"  |  Group: ", relcat)
source(pathPatternPerson) #produces the graph of pattern loadings

pattern<-fit.3.MLFA$BifactorOblique$F
rotation<- "BifactorOblique"  
title1<- paste0("Pattern values:  ",rotation,"  |  Group: ", relcat)
source(pathPatternPerson) #produces the graph of pattern loadings

################
# Chose labels for graph production






































