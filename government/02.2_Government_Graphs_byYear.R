# rm(list=ls(all=TRUE)) #Disable when working in "NLSY-97_Religiosity.Rproj"

require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

pathDir<-file.path(getwd())


# Select the variables for analysis
keepvar <- c("id", "byear", responsibilityvars)
dsW_Gov <- dsGovresp[keepvar]

#Transform the wide dataset into a long dataset
dsLong <- reshape2::melt(dsW_Gov, id.vars=c("id", "byear"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsLong <- plyr::rename(dsLong, replace=c(variable="item", value="agree"))
#Sort for the sake of visual inspection.
dsLong<-dsLong[order(dsLong$id,dsLong$byear),]
dsL_Gov<-dsLong
rm(dsLong)
head(dsL_Gov, 20)
dsL_Gov<-ddply(dsL_Gov,.(item),transform,mean=mean(agree)) # create column with agregated mean
dsL_Gov<-dsL_Gov[order(dsL_Gov$mean),] # sort by descenting mean of item
oitems<-unique(dsL_Gov$item)

dsL_Gov$item<-ordered(dsL_Gov$item,levels=oitems)
str(dsL_Gov$item)

dsL_Gov80<-subset(dsL_Gov, byear==1980)
dsL_Gov81<-subset(dsL_Gov, byear==1981)
dsL_Gov82<-subset(dsL_Gov, byear==1982)
dsL_Gov83<-subset(dsL_Gov, byear==1983)
dsL_Gov84<-subset(dsL_Gov, byear==1984)

pathImageOut<-file.path(getwd(),"government","years") # save files in...

#Distribution for 1980
p<-ggplot(dsL_Gov80,aes(x=factor(agree),group=item))+
  ggtitle("1980")+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))
pathFileOut<-file.path(pathImageOut,paste0("items","_","1980",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

#Distribution for 1981
p<-ggplot(dsL_Gov81,aes(x=factor(agree),group=item))+
  ggtitle("1981")+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))
pathFileOut<-file.path(pathImageOut,paste0("items","_","1981",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

#Distribution for 1982
p<-ggplot(dsL_Gov82,aes(x=factor(agree),group=item))+
  ggtitle("1982")+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))
pathFileOut<-file.path(pathImageOut,paste0("items","_","1982",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

#Distribution for 1983
p<-ggplot(dsL_Gov83,aes(x=factor(agree),group=item))+
  ggtitle("1983")+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))
pathFileOut<-file.path(pathImageOut,paste0("items","_","1983",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()

#Distribution for 1984
p<-ggplot(dsL_Gov84,aes(x=factor(agree),group=item))+
  ggtitle("1984")+
  geom_bar(aes(y = ..density..,group=item)) + 
  facet_grid(item~.)+
  scale_y_continuous(limits=c(0,1))
pathFileOut<-file.path(pathImageOut,paste0("items","_","1984",".png"))
png(filename = pathFileOut,
    width =5, height =9 , units = "in",res=90)
plot(p)
dev.off()
