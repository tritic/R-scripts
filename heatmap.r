##The R script to make heatmap for paper PLoS One. 2013, 8(9):e75325
#Author: Yong Xu
library(ggplot2) 
library(scales)
library(reshape)
library(grid)
library(gdata)
x<-c("id","A5", "A6", "A7", "A8", "A12", "A13", "A3", "A4", "A11", "A14", "A19", "A20", "A2", "A9", "A10", "A16", "A21", "A22","taxonomy")
d<-read.table("tableNorm10.from_biom_w_taxonomy.txt",header=T, sep="\t")
d<-d[,x]
row.order <- hclust(dist(d[,c(2:7)]))$order
d<-d[row.order,]
h<-d[,1:19]
h.m<-melt(h,1)
h.m <- ddply(h.m, .(id), transform, rescale = rescale(value,range(0,1)))
h.m$id <- factor(h.m$id, levels=h$id)
h.m<-h.m[order(h.m$id),]
x<-c("A5", "A6", "A7", "A8", "A12", "A13", "A3", "A4", "A11", "A14", "A19", "A20", "A2", "A9", "A10", "A16", "A21", "A22")
levels(h.m$variable)<-x
#h.m$variable =reorder(h.m$variable , new.order=x)

p <- ggplot(h.m, aes(variable, id)) + geom_tile(aes(fill = rescale,heigth = 183),colour = "white") + scale_fill_gradient(low = "white",high = "black")+scale_x_discrete(expand = c(0, 0)) + scale_y_discrete(expand = c(0, 0))+ theme_bw() +
 #eliminates baground, gridlines, and chart border 
theme(
    plot.background = element_blank()
   ,panel.grid.major = element_blank()
   ,panel.grid.minor = element_blank()
   #,panel.border = element_blank()
   ,panel.background = element_blank()
   ,axis.title.y = element_text( size=16)
   ,axis.title.x = element_text( size=16)
   ,axis.text.y  = element_text(size=5)  # theme_blank()) 
 ,axis.text.y  = theme_blank()
  ,axis.text.x  = element_text(angle =270, hjust = 0,vjust=1.1,size=9, colour=c(rep("green",6),rep("blue",6),rep("red",6)))  
#   ,legend.position=c(0.15,0.9)
   ,legend.title=element_blank()
   ,legend.text=theme_text(size=8)
  ,legend.key.size = unit(1, "lines")
  ) 
pdf("heatMap.pdf")
dev.off()
yy<-as.vector(levels(h.m$id))
z<-rev(yy)
x = c(rep(c(-1.0,-0.6,-0.1),61));
 y =c(1:183);
dx<-as.data.frame (cbind(x,y,z=c(1:183)))
p+geom_text(data = dx, aes(x=x,y=y,label =z ),size=3)
pdf("heatMap.pdf")
p+geom_text(data = dx, aes(x=x,y=y,label =z ),size=2)
dev.off()
