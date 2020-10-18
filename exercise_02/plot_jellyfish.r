library(ggplot2)

getwd()

colnames(table_j)<-c("Species","Kmers","Unique","Distinct","Total", "Max_count")

kr<-reshape2::melt(
  table_j,
  id.vars=c("Species","Kmers"),
  variable.name = "Count",
  value.name="Score"
)

kr

a<-ggplot(kr2, aes(x = Species, y=Score))

a+geom_boxplot(aes(fill=Species))+
  facet_grid(cols=vars(Kmers))

kr2 <-kr[!grepl("Max_count", kr$Count),]
kr2
b<-ggplot(kr2, aes(x = Species, y=log10(Score)))+geom_point(aes(colour=Count))+
  facet_grid(cols=vars(Kmers))
b

