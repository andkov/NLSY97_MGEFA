# rm(list=ls(all=TRUE)) #Disable when working in "NLSY-97_Religiosity.Rproj"

require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

pathDir<-file.path(getwd())


# Select the variables for analysis
keepvar <- c("id", "sex", responsibilityvars)
dsW_Gov <- dsGovresp[keepvar]

#Transform the wide dataset into a long dataset
dsLong <- reshape2::melt(dsW_Gov, id.vars=c("id", "sex"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsLong <- plyr::rename(dsLong, replace=c(variable="item", value="agree"))
#Sort for the sake of visual inspection.
dsLong<-dsLong[order(dsLong$id,dsLong$sex),]
dsL_Gov<-dsLong
rm(dsLong)
head(dsL_Gov, 20)
dsL_Gov<-ddply(dsL_Gov,.(item),transform,mean=mean(agree)) # create column with agregated mean
dsL_Gov<-dsL_Gov[order(dsL_Gov$mean),] # sort by descenting mean of item
oitems<-unique(dsL_Gov$item)

dsL_Gov$item<-ordered(dsL_Gov$item,levels=oitems)
str(dsL_Gov$item)

dsL_GovMale<-subset(dsL_Gov, sex==1)
dsL_GovFemale<-subset(dsL_Gov, sex==2)

pathImageOut<-file.path(getwd(),"government") # save files in...
#Distribution for all
p<-ggplot(dsL_Gov,aes(x=factor(agree),group=item))+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))+
  ggtitle("All")
pathFileOut<-file.path(pathImageOut,paste0("items","_","all",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

pathImageOut<-file.path(getwd(),"government","male") # save files in...
#Distribution for Males
p<-ggplot(dsL_GovMale,aes(x=factor(agree),group=item))+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))+
  ggtitle("Males")
pathFileOut<-file.path(pathImageOut,paste0("items","_","Male",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

pathImageOut<-file.path(getwd(),"government","female") # save files in...
#Distribution for Females
p<-ggplot(dsL_GovFemale,aes(x=factor(agree),group=item))+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))+
  ggtitle("Females")
pathFileOut<-file.path(pathImageOut,paste0("items","_","Female",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()



