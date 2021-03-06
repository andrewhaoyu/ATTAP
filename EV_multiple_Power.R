
BrelMean <- apply(PowerRelBandP,1,mean)
BinMean <- apply(PowerBindP,1,mean)
EinMean <- apply(PowerEindP,1,mean)

EV.Length <- length(EV)


EV.Length <- length(EV)

data <- data.frame(EV*100,EinMean,BinMean,BrelMean)
colnames(data) <- c("EV","EindP","BindP","ErelP")
#y.up <- min(1,(max(Power)+0.1))
p1 <- ggplot(data)+geom_line(aes(x=EV,y=EindP), colour="#c0392b")+
  theme_bw()+
  theme_new()+
  labs(title="The Mean Power Distribution of Senarario 1",y="Mean Power",x="Variance Explained (Percent)",y="Proportion")
p2 <- ggplot(data)+geom_line(aes(x=EV,y=BindP), colour="dodgerblue4")+
  theme_bw()+
  theme_new()+
  labs(title="The Mean Power Distribution of Senarario 2",y="Mean Power",x="Variance Explained (Percent)")
p3 <- ggplot(data)+geom_line(aes(x=EV,y=ErelP), colour="chartreuse4")+
  theme_bw()+
  theme_new()+
  labs(title="The Mean Power Distribution of Senarario 3",y="Mean Power",x="Variance Explained (Percent)")
data <- data.frame(JJ=JJ.vec)
p4 <- ggplot(data,aes(data$JJ))+
  geom_histogram(aes(x=data$JJ,y=(..count..)/sum(..count..)),
                 fill="gray15",
                 alpha=0.75
  )+
  theme_bw()+
  theme_new()+
  labs(title="The Histogram of total number of variants (J)",x="total number of variants (J)",y="Proportion")




MeanPower.combine <- data.frame(EV=EV*100,GeneI =EinMean,GeneII = BinMean,GeneIII=BrelMean)
colnames(MeanPower.combine) <- c("EV(Percent)",
                                 "Senarario 1 Mean Power",
                                 "Senarario 2 Mean Power",
                                 "Senarario 3 Mean Power"
)
MeanPower.combine[,2:4] <- round(MeanPower.combine[,2:4],3)
MeanPower.combine <- MeanPower.combine[c(1,3,5,7,9),]
return(list(MeanPower.combine,p1=p1,p2=p2,p3=p3,p4=p4))