dls_all<- read.csv(file="DLS_M.csv",head=TRUE,sep=",")

dls_1 <- subset(dls_all,dls_all$REG_NO =='5215')
dls_1$WEIGHT_VAR<- abs(dls_1$POST_GAIN_LOSS_KG)*dls_1$RN/dls_1$STEPS_DLS

pdf("main.pdf")

plot(dls_1$UFV,dls_1$WEIGHT_VAR, main="UFV vs Weight", 
  	xlab="UFV ", ylab="Weight var ", pch=21 )


dev.off()