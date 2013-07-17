# rm(list=ls(all=TRUE)) #Disable when working in "NLSY-97_Religiosity.Rproj"

require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

#Transform the wide dataset into a long dataset
dsLong <- reshape2::melt(dsW_PersonR, id.vars=c("id", "sex","byear","attcat_2002"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
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

dsL_PersonGoer<-subset(dsL_Person, attcat_2002==3)
dsL_PersonIrreg<-subset(dsL_Person, attcat_2002==2)
dsL_PersonNongoer<-subset(dsL_Person, attcat_2002==1)


pathImageOut<-file.path(getwd(),"personality","goer") # save files in...
#Distribution for Goers
p<-ggplot(dsL_PersonGoer,aes(x=factor(slider12345),group=trait))+
  geom_bar(aes(y = ..density..,group=trait)) + 
  facet_grid(trait~.)+
  scale_y_continuous(limits=c(0,.8))+
  ggtitle("Goers")
pathFileOut<-file.path(pathImageOut,paste0("Traits","_","Goer",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

pathImageOut<-file.path(getwd(),"personality","irregular") # save files in...
#Distribution for Irregulars
p<-ggplot(dsL_PersonIrreg,aes(x=factor(slider12345),group=trait))+
  geom_bar(aes(y = ..density..,group=trait)) + 
  facet_grid(trait~.)+
  scale_y_continuous(limits=c(0,.8))+
  ggtitle("Irregulars")
pathFileOut<-file.path(pathImageOut,paste0("Traits","_","Irregular",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()


pathImageOut<-file.path(getwd(),"personality","nongoer") # save files in...
#Distribution for Nongoers
p<-ggplot(dsL_PersonNongoer,aes(x=factor(slider12345),group=trait))+
  geom_bar(aes(y = ..density..,group=trait)) + 
  facet_grid(trait~.)+
  scale_y_continuous(limits=c(0,.8))+
  ggtitle("Nongoers")
pathFileOut<-file.path(pathImageOut,paste0("Traits","_","Nongoer",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

