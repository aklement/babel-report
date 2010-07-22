cr <- read.table(file="cosine.rand.eval", sep = "\t", head=TRUE)
mr <- read.table(file="moses.rand.eval", sep = "\t", head=TRUE)

xrange <- range(0, cr$K, mr$K)
yrange <- range(0, cr$Accuracy.TopK, mr$Accuracy.TopK)

colors <- c("blue","red")
names <- c("Context", "Alignments") 
types <- c(1, 1)
pts <- c(1, 2)
tsize <- 1.6
t1size <- 1.3

pdf(file="alignvscontext.pdf", height=6, width=7, onefile=TRUE, family='Helvetica', pointsize=12)

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=tsize, font.main=2, ps=14)

plot(xlim = xrange, ylim = yrange, cr$K, cr$Accuracy.TopK, type="o", pch=pts[1], lty=types[1], lwd=3, col=colors[1], ann = FALSE, cex.axis=t1size);
lines(mr$K, mr$Accuracy.TopK, type="o", pch=pts[2], lty=types[2], lwd=2, col=colors[2])

grid(col = "black", lty = "dotted", lwd = 1, equilogs = TRUE)

title(ylab="Accuracy", xlab="k in top-k")

mtext("Random", NORTH<-3, line=1.7, cex=tsize)

legend("bottomright", names, cex=t1size, col=colors, lty=types, pch=pts, lwd=3, bty="y", bg="white");

dev.off()
