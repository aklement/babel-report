langs <- c("cy", "fa", "id", "lv", "ru", "sk", "sq", "sr", "tr", "uz")
colors <- c(colors()[34], colors()[26], colors()[53], colors()[137], colors()[12], colors()[150], colors()[50], colors()[81], colors()[85], colors()[184])
pts <- c(1:length(langs))
types <- array(1, dim = c(length(langs)))

tsize <- 1.6
t1size <- 1.3

xrange <- range(0, 600)
yrange <- range(0, 40)

png(filename="randcontext.png", height=500, width=600, bg="white")

par(mar=c(4.5,4.5,3.5,0.5), new=FALSE, cex.lab=tsize)

for (i in (1:(length(langs)))) {
  v <- read.table(file=paste(langs[i],"/context.eval", sep=""), sep = "\t", head=TRUE)

  if (i == 1) {
    plot(xlim = xrange, ylim = yrange, v$K, v$Accuracy.TopK, type="o", pch=pts[i], lty=types[i], lwd=2, col=colors[i], ann=FALSE, cex.axis=t1size)
  }
  else {
    lines(v$K, v$Accuracy.TopK, type="o", pch=pts[i], lty=types[i], lwd=2, col=colors[i])
  }
}

grid(col = "black", lty = "dotted", lwd = 1, equilogs = TRUE)

#title(xlab="k in top-k")
#title(ylab="Accuracy")

legend("bottomright", langs, cex=t1size, col=colors, lty=types, pch=pts, lwd=2, bty="n");

dev.off()
