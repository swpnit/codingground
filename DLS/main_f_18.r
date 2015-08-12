dls_f<- read.csv(file="DLS_ALL_F_LESS18.csv",head=TRUE,sep=",")

#dls_f <- subset(dls_all,dls_all$SEX=="F" & dls_all$VALID_AGE=='Valid' & dls_all$AGE >= 0 & dls_all$AGE <= 18,)
#dls_f <- subset(dls_all,dls_all$SEX=="F" & dls_all$VALID_AGE=='Valid',)
dls_f$WEIGHT_VAR<- abs(dls_f$POST_GAIN_LOSS_KG)*dls_f$RN/dls_f$STEPS_DLS
summary(dls_f$WEIGHT_VAR)
pdf("main_female_less_than_18Yrs.pdf")

plot(dls_f$WEIGHT_VAR,dls_f$UFV,main="UFV vs Weight Variation(For Female Patients 0-18 Yrs)",ylab="UFV",xlab="Weight Variation",xlim=c(0,1.5),pch=dls_f$REG_NO,col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=1,y=3000,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

plot(dls_f$WEIGHT_VAR,dls_f$DLS_BP_LOW,main="Low BP vs Weight Variation(For Female Patients 0-18 Yrs)",ylab="Low BP",xlab="Weight Variation",ylim=c(40,140),xlim=c(0,1.5),pch=dls_f$REG_NO,col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=1,y=140,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

plot(dls_f$UFV,dls_f$DLS_BP_LOW,main="Low BP vs UFV (For Female Patients 0-18 Yrs)",ylab="Low BP",xlab="UFV",,ylim=c(40,140),pch=dls_f$REG_NO,col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=2500,y=140,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

plot(dls_f$WEIGHT_VAR,dls_f$DLS_BP_HIGH,main="High BP vs Weight Variation(For Female Patients 0-18 Yrs)",ylab="High BP",xlab="Weight Variation",ylim=c(65,220),xlim=c(0,1.5),pch=dls_f$REG_NO,col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=1,y=200,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

plot(dls_f$UFV,dls_f$DLS_BP_HIGH,main="High BP vs UFV (For Female Patients 0-18 Yrs)",ylab="High BP",xlab="UFV",ylim=c(65,220),pch=dls_f$REG_NO,col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=2500,y=200,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

plot(dls_f$WEIGHT_VAR,dls_f$BP_MEAN,main="Mean BP vs Weight Variation(For Female Patients 0-18 Yrs)",ylab="Mean BP",xlab="Weight Variation",ylim=c(45,160),xlim=c(0,1.5),pch=dls_f$REG_NO,col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=1,y=160,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

plot(dls_f$UFV,dls_f$BP_MEAN,main="Mean BP vs UFV(For Female Patients 0-18 Yrs)",ylab="Mean BP",xlab="UFV",pch=dls_f$REG_NO,ylim=c(45,160),col=dls_f$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=2500,y=160,unique(paste('Age:',dls_f$AGE),' Yrs'),cex=.5,col=unique(dls_f$AGE),pch=20)

pairs(~dls_f$UFV+dls_f$WEIGHT_VAR+dls_f$DLS_BP_LOW+dls_f$DLS_BP_HIGH+dls_f$BP_MEAN,data=dls_f, 
      main="Matrix Plot (For Female Patients 0-18 Yrs)",col=dls_f$AGE,pch=dls_f$REG_NO)
      
dev.off()