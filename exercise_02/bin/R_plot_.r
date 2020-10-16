#!/usr/bin/Rscript
#give permisions:
#chmod +x R_plot_.r
#execute:
#./R_plot_.r Ecol Bsub Mgen Mpne

args = commandArgs(trailingOnly=TRUE)
#getwd()
dir <- setwd('/home/adria/Escritorio/Computational_genomics/exercise_02/stats/')
for (SPC in args){
  for (w in c(100, 200, 500, 1000, 2000, 5000, 10000)){
    GC_avg <- 50.79; # the whole genome average GC content
    d <- '/home/adria/Escritorio/Computational_genomics/exercise_02/stats/'
    middle = '_genomegcanalysis_wlen'
    extension = '.tbl.gz'
    path<-(paste(d,as.character(SPC),middle,as.character(w),extension, sep=""))
    print(path)
    ZZ <- gzfile(path);
    GC_w <- read.table(ZZ, header=FALSE);
    colnames(GC_w) <- c("CHRid","NUCpos","GCpct");

    summary(GC_w)

    library(ggplot2);

    G <- ggplot(GC_w, aes(x=NUCpos, y=GCpct)) +
      geom_line(colour = "blue") +
      theme_bw() +
      geom_hline(yintercept=GC_avg, colour="red", linetype="dashed", size=1.5) +
      ggtitle(paste("E.coli GC content over the genome (window length = ",w,"bp)")) +
      labs(x="Genomic Coords (bp)", y="%GC Content");
    dirs <-'/home/adria/Escritorio/Computational_genomics/exercise_02/images/'
    mid2 <- '_genomegcanalysis_wlen'
    ex <-'.png'
    p <- (paste(dirs,SPC,mid2,w,ex,sep=''))
    ggsave(p,plot=G, width=25, height=8, units="cm", dpi=600);

  }
}
