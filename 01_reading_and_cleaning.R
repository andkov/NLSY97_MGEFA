# install.packages("Hmisc")
# install.packages("sem")
# install.packages("psych")
# install.packages("corrgram")
# install.packages("plotrix")
# install.packages("lme4")

rm(list=ls(all=TRUE)) #Clear out variables from previous runs.
options("scipen"=10, "digits"=5) # adjust how scientific notation is displayed

require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

years<-1980:1984

pathDir<-file.path(getwd())
pathGitHub <- file.path("C:/Users/ludmila/Documents/GitHub") # locate the "GitHub" folder on your computer
# Choose datasource if working with more than one
#       "Database_ResponseOfInterest_DateOfDownload"
dataSource<-c("NLSY97_Responsibility_Personality")  
pathDataSource<-file.path(pathDir,dataSource,paste0(dataSource,".dct"))
# pathVarNames<-file.path(pathDir,dataSource, paste0(dataSource,"-value-labels.do"))

# input the file with the question id and labels
varnames<-read.csv(pathDataSource,header=FALSE, skip=1,nrows=31,sep=" ")
dsSource<-read.csv(pathDataSource,header=FALSE, skip=33,sep=" ")

# select 4th and 5th collumns
varnames<-varnames[c("V3","V4")]
varnames<-rename(varnames, c("V3"="QID","V4"="Qname"))
varnames <- varnames[order(varnames$QID,varnames$Qname), ] 

names(dsSource)<-varnames$QID
dsSource<-rename(dsSource, c(
  "R0000100"="id",
  "R0536300"="sex",
  "R0536401"="bmonth",
  "R0536402"="byear",
  "R1235800"="sample",
  "R1482600"="race",
  "S0920000"="organized", 
  "S0920100"="conscientious",
  "S0920200"="dependable",
  "S0920300"="thorough",
  "S0920400"="agreeable",
  "S0920500"="cooperative",
  "S0920600"="flexible",
  "S0920700"="trustful",
  "S8646900"="providejobs",
  "S8647000"="controlprices",
  "S8647100"="healthcare",
  "S8647200"="livingstandard",
  "S8647300"="helpneedy",
  "S8647400"="helpunempl",
  "S8647500"="helpindustry",
  "S8647600"="fundcollege",
  "S8647700"="housing",
  "S8647800"="environment",
  "T1068600"="T1068600",
  "T1068700"="T1068700",
  "T1068800"="T1068800",
  "T1069100"="helplessfort",
  "T1069101"="carethemsel",
  "T1069102"="helpeapimp",
  "T1069103"="lookformysel" 
  
  ))

# Include only records with a valid birth year
dsSource <- dsSource[dsSource$byear %in% years, ]

#Include only records with a valid ID
dsSource <- dsSource[dsSource$id != "V", ]
dsSource$id <- as.integer(dsSource$id)

personalityvars<-c("organized", "conscientious","dependable","thorough",
                  "agreeable","cooperative","flexible","trustful")
personalityvalues<-c(1,2,3,4,5)

# keep only observations that has valid values on PERSONALITY scale
dsPersonality<-dsSource
dsPersonality <- dsPersonality[dsPersonality$organized %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$conscientious %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$dependable %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$thorough %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$agreeable %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$cooperative %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$flexible %in% personalityvalues, ]
dsPersonality <- dsPersonality[dsPersonality$trustful %in% personalityvalues, ]

responsibilityvars<-c("providejobs","controlprices","healthcare","livingstandard","helpneedy",
                      "helpunempl","helpindustry","fundcollege","housing","environment")
responsibilityvalues<-c(1,2,3,4)

# keep only observations that has valid values on RESPONSIBILITY scale
dsGovresp<-dsSource
dsGovresp <- dsGovresp[dsGovresp$organized %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$conscientious %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$dependable %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$thorough %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$agreeable %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$cooperative %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$flexible %in% responsibilityvalues, ]
dsGovresp <- dsGovresp[dsGovresp$trustful %in% responsibilityvalues, ]

table(dsPersonality$sex)



                      
# remove all but one dataset
#  rm(list=setdiff(ls(), "dsSource"))

