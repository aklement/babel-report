cr <- read.table(file="cosine.rand.eval", sep = "\t", head=TRUE)
mr <- read.table(file="moses.rand.eval", sep = "\t", head=TRUE)

xrange <- range(0, cr$K, mr$K)
yrange <- range(0, cr$Accuracy.TopK, mr$Accuracy.TopK)

colors <- c("blue","green")
names <- c("Context (Random)", "Alignments (Random)") 
types <- c(1, 1)
pts <- c(1, 2)
tsize <- 1.6
t1size <- 1.3

png(filename="alignvscontext.png", height=500, width=600, bg="white")

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=tsize)

plot(xlim = xrange, ylim = yrange, cr$K, cr$Accuracy.TopK, type="o", pch=pts[1], lty=types[1], lwd=2, col=colors[1], ann = FALSE, cex.axis=t1size);
lines(mr$K, mr$Accuracy.TopK, type="o", pch=pts[2], lty=types[2], lwd=2, col=colors[2])

grid(col = "black", lty = "dotted", lwd = 1, equilogs = TRUE)

title(ylab="Accuracy")
title(xlab="k in top-k")

legend("bottomright", names, cex=t1size, col=colors, lty=types, pch=pts, lwd=2, bty="n");

dev.off()
