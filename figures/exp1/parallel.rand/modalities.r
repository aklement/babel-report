c <- read.table(file="context.eval", sep = "\t", head=TRUE)
t <- read.table(file="time.eval", sep = "\t", head=TRUE)
e <- read.table(file="edit.eval", sep = "\t", head=TRUE)
all <- read.table(file="aggmrr.eval", sep = "\t", head=TRUE)

xrange <- range(0, c$K, t$K, e$K, all$K)
yrange <- range(0, c$Accuracy.TopK, t$Accuracy.TopK, e$Accuracy.TopK, all$Accuracy.TopK)

colors <- c("blue", "green", "magenta", "red")
names <- c("Context", "Time", "EditDistance", "Aggregate") 
types <- c(1, 1, 1, 1)
pts <- c(1, 2, 3, 4)

png(filename="modalities.png", height=500, width=600, bg="white")

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE)

plot(xlim = xrange, ylim = yrange, c$K, c$Accuracy.TopK, type="o", pch=pts[1], lty=types[1], lwd=2, col=colors[1], ann = FALSE);
lines(t$K, t$Accuracy.TopK, type="o", pch=pts[2], lty=types[2], lwd=2, col=colors[2])
lines(e$K, e$Accuracy.TopK, type="o", pch=pts[3], lty=types[3], lwd=2, col=colors[3])
lines(all$K, all$Accuracy.TopK, type="o", pch=pts[4], lty=types[4], lwd=2, col=colors[4])

title(ylab="Accuracy")
title(xlab="k in top-k")

legend("bottomright", names, cex=0.8, col=colors, lty=types, pch=pts, lwd=2, bty="n");

dev.off()
