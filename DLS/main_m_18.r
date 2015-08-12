dls_m<- read.csv(file="DLS_ALL_M_LESS18.csv",head=TRUE,sep=",")

#dls_m <- subset(dls_all,dls_all$SEX=="F" & dls_all$VALID_AGE=='Valid' & dls_all$AGE >= 0 & dls_all$AGE <= 18,)
#dls_m <- subset(dls_m,dls_m$REG_NO==4,)
dls_m$WEIGHT_VAR<- abs(dls_m$POST_GAIN_LOSS_KG)*dls_m$RN/dls_m$STEPS_DLS
summary(dls_m$WEIGHT_VAR)
pdf("main_male_less_than_18Yrs.pdf")

plot(dls_m$WEIGHT_VAR,dls_m$UFV,main="UFV vs Weight Variation(For Male Patients 0-18 Yrs)",ylab="UFV",xlab="Weight Variation",xlim=c(0,5),pch=dls_m$REG_NO,col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=4,y=3500,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

plot(dls_m$WEIGHT_VAR,dls_m$DLS_BP_LOW,main="Low BP vs Weight Variation(For Male Patients 0-18 Yrs)",ylab="Low BP",xlab="Weight Variation",ylim=c(50,120),xlim=c(0,5),pch=dls_m$REG_NO,col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=4,y=120,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

plot(dls_m$UFV,dls_m$DLS_BP_LOW,main="Low BP vs UFV (For Male Patients 0-18 Yrs)",ylab="Low BP",xlab="UFV",,ylim=c(50,120),pch=dls_m$REG_NO,col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=3500,y=120,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

plot(dls_m$WEIGHT_VAR,dls_m$DLS_BP_HIGH,main="High BP vs Weight Variation(For Male Patients 0-18 Yrs)",ylab="High BP",xlab="Weight Variation",ylim=c(100,170),xlim=c(0,5),pch=dls_m$REG_NO,col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=4,y=170,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

plot(dls_m$UFV,dls_m$DLS_BP_HIGH,main="High BP vs UFV (For Male Patients 0-18 Yrs)",ylab="High BP",xlab="UFV",ylim=c(110,170),pch=dls_m$REG_NO,col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=3500,y=170,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

plot(dls_m$WEIGHT_VAR,dls_m$BP_MEAN,main="Mean BP vs Weight Variation(For Male Patients 0-18 Yrs)",ylab="Mean BP",xlab="Weight Variation",ylim=c(80,135),xlim=c(0,5),pch=dls_m$REG_NO,col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=4,y=135,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

plot(dls_m$UFV,dls_m$BP_MEAN,main="Mean BP vs UFV(For Male Patients 0-18 Yrs)",ylab="Mean BP",xlab="UFV",pch=dls_m$REG_NO,ylim=c(80,135),col=dls_m$AGE)
grid(nx = 10, ny = 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)
legend(x=3500,y=135,unique(paste('Age:',dls_m$AGE),' Yrs'),cex=.5,col=unique(dls_m$AGE),pch=20)

pairs(~dls_m$UFV+dls_m$WEIGHT_VAR+dls_m$DLS_BP_LOW+dls_m$DLS_BP_HIGH+dls_m$BP_MEAN,data=dls_m, 
      main="Matrix Plot (For Male Patients 0-18 Yrs)",col=dls_m$AGE,pch=dls_m$REG_NO)
      
dev.off()