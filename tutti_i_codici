#1
#03.03.22
install.packages("raster")
library(raster)


#2
#04.03.22
3 + 2 
d <- 3 + 2 
d
7 + 3 
a <- 7 + 3 
a
3 + 2 + 7 + 3
d + a
mam <- c(2, 4, 7, 10, 15, 20)
mam
suo <- c(100, 80, 50, 30, 10, 2)
suo
plot(suo, mam)
plot(suo, mam, pch = 19)
plot(suo, mam, pch=19, col="blue")
plot(suo, mam, pch=19, col="blue", cex=3)
plot(suo, mam, pch=19, col="blue", cex=0.5)


#3
#codici 10.03.22
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
?brick
brick("p224r63_2011.grd")
l2011 <- brick("p224r63_2011.grd")
l2011
?plot
plot(l2011)
?colorRampPalette
colorRampPalette(c("black", "grey", "light grey")) 
colorRampPalette(c("black", "grey", "light grey")) (100)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col = cl)


#4
#codici 11.03.22
l2011 <- brick("p224r63_2011.grd")
l2011

#5
#codici 18.03.22
l2011
plot(l2011$B1_sre)
plot(l2011[[1]])
cl <- colorRampPallette(c("black", "grey", "light grey")) (100) 
plot(l2011$B1_sre)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre, col = cl) 
l2011
plot(l2011$B1_sre)
clblue <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col = clblue)
#?pdf
#pdf("banda1.pdf")
#plot(l2011$B1_sre, col = clblue)
#dev.off()
#?png
#png("banda1.png")
#plot(l2011$B1_sre, col = clblue)
#dev.off()
#?writeRaster
l2011
plot(l2011$B2_sre)
clgreen <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col = clgreen)
#pdf("banda2.pdf")
#plot(l2011$B2_sre, col = clgreen)
#dev.off()
#png("banda2.png")
#plot(l2011$B2_sre, col = clgreen)
#dev.off() 
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue)
plot(l2011$B2_sre, col = clgreen) 
#pdf("multiframe.pdf")
#par(mfrow = c(1, 2))
#plot(l2011$B1_sre, col = clblue) 
#plot(l2011$B2_sre, col = clgreen) 
#dev.off() ==> metto come commento
par(mfrow = c(2, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
clred <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col = clred)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir)
par(mfrow = c(2, 2))
#salviamo 
#pdf("multiframe_4.pdf")
#par(mfrow = c(2, 2))
#plot(l2011$B1_sre, col = clblue) 
#plot(l2011$B2_sre, col = clgreen) 
#plot(l2011$B3_sre, col = clred)
#plot(l2011$B4_sre, col = clnir)
#dev.off() ==> metto come commento


#6
#24.03.22
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("p224r63_2011.grd")
l2011 <- brick("p224r63_2011.grd")
l2011
plot(l2011$B4_sre)
#oppure
plot(l2011[[1]])
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir)?plotRGB 
#?plotRGB
plotRGB(l2011, r = 3, g = 2, b = 1, stretch = "lin")
plotRGB(l2011, r = 4, g = 3, b = 2, stretch = "lin")
plotRGB(l2011, r = 3, g = 4, b = 2, stretch = "lin")
plotRGB(l2011, r = 3, g = 4, b = 2, stretch = "hist")
par(mfrow = c(2, 1))
plotRGB(l2011, r = 3, g = 2, b = 1, stretch = "lin")
plotRGB(l2011, r = 3, g = 4, b = 2, stretch = "hist")
brick("p224r63_1988.grd")
l1988 <- brick("p224r63_1988.grd")
l1988
par(mfrow = C(2, 1))
plotRGB(l1988, r = 4, g = 3, b = 2, stretch = "lin")
plotRGB(l2011, r = 4, g = 3, b = 2, stretch = "lin")

