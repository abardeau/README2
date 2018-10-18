snpcol[gwastab$Chromosome == chrnames[i]] <- allcol[i]
}

# draw plot
par(mar = c(3.1, 3.1, 1.1, 1.1), mgp = c(2, 0.5, 0))
plot(transp, col = snpcol, pch = 16, axes = FALSE,
     xlab = "Genomic location", ylab = "-log10(p)")
abline(h = threshold.lines, lty = 2, col = "darkgrey")
axis(2) # add in standard y-axis

# label points above the cutoff
tolabel <- which(transp >= label.cutoff)
text(tolabel, transp[tolabel], gwastab$SNP[tolabel])

# axis with chromosome labels
ticklocs <- numeric(nchr) # set up empty vector
for(i in 1:nchr){
  ticklocs[i] <- median(which(gwastab$Chromosome == chrnames[i]))
}
axis(1, at = ticklocs, labels = as.character(chrnames))
}
# fancy version
manhattan3(yieldGWAS, threshold.lines = c(2, 10), label.cutoff = 5) #I changed your threshold lines to
#make it more visually appealing

#this is lucas roberts commenting