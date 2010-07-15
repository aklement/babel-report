cf <- read.table(file="cosine.freq.eval", sep = "\t", head=TRUE)
cr <- read.table(file="cosine.rand.eval", sep = "\t", head=TRUE)
mf <- read.table(file="moses.freq.eval", sep = "\t", head=TRUE)
mr <- read.table(file="moses.rand.eval", sep = "\t", head=TRUE)

xrange <- range(0, cf$K, cr$K, mf$K, mr$K)
yrange <- range(0, cf$Accuracy.TopK, cr$Accuracy.TopK, mf$Accuracy.TopK, mr$Accuracy.TopK)

colors <- c("blue", "blue", "green", "green")
names <- c("Context (Frequent)", "Context (Random)", "Alignments (Frequent)", "Alignments (Random)") 
types <- c(1, 1, 1, 1)
pts <- c(1, 2, 1, 2)

png(filename="alignvscontext.png", height=500, width=600, bg="white")

plot(xlim = xrange, ylim = yrange, cf$K, cf$Accuracy.TopK, type="o", pch=pts[1], lty=types[1], lwd=1.5, col=colors[1], ann = FALSE);
lines(cr$K, cr$Accuracy.TopK, type="o", pch=pts[2], lty=types[2], lwd=1.5, col=colors[2])
lines(mf$K, mf$Accuracy.TopK, type="o", pch=pts[3], lty=types[3], lwd=1.5, col=colors[3])
lines(mr$K, mr$Accuracy.TopK, type="o", pch=pts[4], lty=types[4], lwd=1.5, col=colors[4])

title(ylab="Accuracy")
title(xlab="k in top-k")

legend("bottomright", names, cex=0.8, col=colors, lty=types, pch=pts, lwd=2, bty="n");

dev.off()
