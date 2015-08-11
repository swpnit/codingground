  library(gplots)
patientwisecont<- read.csv(file="patientwisecont.csv",head=TRUE,sep=",")

patientwisecont_f <- subset(patientwisecont,patientwisecont$SEX=="F" & patientwisecont$VALID_AGE=='Valid',)
patientwisecont_m <- subset(patientwisecont,patientwisecont$SEX=="M" & patientwisecont$VALID_AGE=='Valid',)

patientwisecont_f_1 <- subset(patientwisecont,patientwisecont_f$AGE >=0 & patientwisecont_f$AGE <=18)

rnames <- patientwisecont_f_1[,6]           
mat_data <- data.matrix(patientwisecont_f_1[,7:ncol(patientwisecont_f_1)]) 
rownames(mat_data) <- rnames 
pdf("patientwise.pdf")

heatmap.2(mat_data,
  cellnote = mat_data,  # same data set for cell labels
  main = "Correlation", # heat map title
  notecol="black",      # change font color of cell labels to black
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns off trace lines inside the heat map
  margins =c(12,9),     # widens margins around plot
  col=my_palette,       # use on color palette defined earlier 
  breaks=col_breaks,    # enable color transition at specified limits
  dendrogram="row",     # only draw a row dendrogram
  Colv="NA")            # turn off column clustering
  
dev.off()