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
# head(dsFORp,30)
# str(dsFORp)

p<-ggplot(dsFORp, aes(x=ordered(measure,levels=rev(otraits)), y=value, fill=positive))+
  geom_bar(stat="identity")+
  scale_fill_manual(values=colors)+
  scale_y_continuous(limits=c(0,1),
                     breaks=c(.2,.4,.6,.8))+
  xlab("Self-rated personality traits")+
  ylab("Factor weights")+
  theme(axis.text.x =element_blank(),
        axis.text.y =element_blank(),
        axis.title.y=element_blank(),
        axis.title.x=element_blank(),
        strip.text=element_blank(),
        plot.title=element_blank(),
        legend.title=element_blank())+
  guides(fill=FALSE)+
  facet_grid(.~pc)+
  coord_flip()
p
pathFileOut<-file.path(pathImageOut,paste0("thumbs_",nfactors,"_",rotation,".png"))
png(filename = pathFileOut,
    width =width, height =height , units = "in",res=resolution)
plot(p)
dev.off()






