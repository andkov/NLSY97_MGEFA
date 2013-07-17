# library(ggplot2)
# library(colorspace)
# library(gcookbook)

# palette <- choose_palette()
# colors<-palette(2)


dsLong <- reshape2::melt(pattern, id.vars=c("row.names"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsLong <- plyr::rename(dsLong, replace=c(Var1="measure",Var2="pc"))
dsFORp<-dsLong
dsFORp$positive <- dsFORp$value >= 0 # positive value?
dsFORp$value<-abs(dsFORp$value)
head(dsFORp,30)
dsFORp$measure<-ordered(dsFORp$measure,levels=otraits)
str(dsFORp)

p<-ggplot(dsFORp, aes(x=measure, y=value, fill=positive))+
  ggtitle(title1)+ 
  geom_bar(stat="identity")+
  scale_fill_manual(values=colors)+
  scale_y_continuous(limits=c(0,1),
                     breaks=c(0,.25,.5,.75,1))+
  theme(axis.text.x =element_text(angle=0,hjust=1,size=12),
        axis.text.y =element_text(angle=0,hjust=1,size=20))+
  facet_grid(.~pc)+
  coord_flip()
p
pathFileOut<-file.path(pathImageOut,paste0(nfactors,"factor",rotation,".png"))
png(filename = pathFileOut,
    width =width, height =height , units = "in",res=resolution)
plot(p)
dev.off()

# pT<-ggplot(dsFORp, aes(x=pc, y=value, fill=positive))+
#   ggtitle(title)+ 
#   geom_bar()+
#   scale_fill_manual(values=colors)+
#   scale_y_continuous(limits=c(0,1))+
#   theme(axis.text.x =element_text(angle=60,hjust=1))+
#   facet_grid(measure~.)
# pT
# pathFileOut<-file.path(pathImageOut,paste0(drawing,"_",nfactors,"_",whatsolution,"_2",".png"))
# png(filename = pathFileOut,
#     width =width, height =height ,units = "in",res=resolution)
# plot(pT)
# dev.off()




