# rm(list=ls(all=TRUE)) #Disable when working in "NLSY-97_Religiosity.Rproj"

require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

pathDir<-file.path(getwd())


# Select the variables for analysis
keepvar <- c("id", "sex", personalityvars)
dsW_Person <- dsPersonality[keepvar]

#Transform the wide dataset into a long dataset
dsLong <- reshape2::melt(dsW_Person, id.vars=c("id", "sex"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsLong <- plyr::rename(dsLong, replace=c(variable="trait", value="slider12345"))
#Sort for the sake of visual inspection.
dsLong<-dsLong[order(dsLong$id,dsLong$sex),]
dsL_Person<-dsLong
rm(dsLong)
head(dsL_Person, 20)
dsL_Person<-ddply(dsL_Person,.(trait),transform,mean=mean(slider12345)) # create column with agregated mean
dsL_Person<-dsL_Person[order(-dsL_Person$mean),] # sort by descenting mean of trait
otraits<-unique(dsL_Person$trait)

dsL_Person$trait<-ordered(dsL_Person$trait,levels=otraits)
str(dsL_Person$trait)

dsL_PersonMale<-subset(dsL_Person, sex==1)
dsL_PersonFemale<-subset(dsL_Person, sex==2)

pathImageOut<-file.path(getwd(),"personality") # save files in...
#Distribution for all
p<-ggplot(dsL_Person,aes(x=factor(slider12345),group=trait))+
  geom_bar(aes(y = ..density..,group=trait)) + 
  facet_grid(trait~.)+
  scale_y_continuous(limits=c(0,.8))+
  ggtitle("All")
pathFileOut<-file.path(pathImageOut,paste0("Traits","_","all",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

pathImageOut<-file.path(getwd(),"personality","male") # save files in...
#Distribution for Males
p<-ggplot(dsL_PersonMale,aes(x=factor(slider12345),group=trait))+
  geom_bar(aes(y = ..density..,group=trait)) + 
  facet_grid(trait~.)+
  scale_y_continuous(limits=c(0,.8))+
  ggtitle("Males")
pathFileOut<-file.path(pathImageOut,paste0("Traits","_","Male",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

pathImageOut<-file.path(getwd(),"personality","female") # save files in...
#Distribution for Females
p<-ggplot(dsL_PersonFemale,aes(x=factor(slider12345),group=trait))+
  geom_bar(aes(y = ..density..,group=trait)) + 
  facet_grid(trait~.)+
  scale_y_continuous(limits=c(0,.8))+
  ggtitle("Females")
pathFileOut<-file.path(pathImageOut,paste0("Traits","_","Female",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()



