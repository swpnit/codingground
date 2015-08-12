
agesexwisecont<- read.csv(file="agesexwisecont.csv",head=TRUE,sep=",")

agesexwisecont_f <- subset(agesexwisecont,agesexwisecont$SEX=="F",)
agesexwisecont_m <- subset(agesexwisecont,agesexwisecont$SEX=="M",)
agesexwisecont_f
agesexwisecont_m
pdf("agewise.pdf")

plot(agesexwisecont_f$AGE, agesexwisecont_f$CNT, main="Plot for Female patient", 
  	xlab="Age", ylab="No of Patient", pch=19,type='h',col='pink',lwd=3)
grid(nx = agesexwisecont_f$CNT, ny = NULL, col = "black", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)
  	
plot(agesexwisecont_m$AGE, agesexwisecont_m$CNT, main="Plot for Male patient", 
  	xlab="Age", ylab="No of Patient", pch=19,type='h',col='blue',lwd=3)
grid(nx = agesexwisecont_f$CNT, ny = NULL, col = "black", lty = "dotted",
     lwd = 1, equilogs = TRUE)

#max_f_age=max(agesexwisecont_f$AGE)

#qplot(agesexwisecont_f$AGE,geom="histogram",binwidth = 5,main = "Histogram for Female patient",
#      xlab = "Age",ylab="No of Patient",fill=I("pink"),col=I("red"),alpha=I(.2),xlim=c(0,max_f_age))

#max_m_age=max(agesexwisecont_m$AGE)

#qplot(agesexwisecont_m$AGE,geom="histogram",binwidth = 5,main = "Histogram for Male patient", 
#      xlab = "Age",ylab="No of Patient",fill=I("blue"),col=I("red"),alpha=I(.2),xlim=c(0,max_m_age))


dev.off()