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
?pdf
pdf("banda1.pdf")
plot(l2011$B1_sre, col = clblue)
dev.off()
?png
png("banda1.png")
plot(l2011$B1_sre, col = clblue)
dev.off()
?writeRaster
l2011
plot(l2011$B2_sre)
clgreen <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col = clgreen)
pdf("banda2.pdf")
plot(l2011$B2_sre, col = clgreen)
dev.off()
png("banda2.png")
plot(l2011$B2_sre, col = clgreen)
dev.off() 
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue)
plot(l2011$B2_sre, col = clgreen) 
pdf("multiframe.pdf")
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
dev.off() 
par(mfrow = c(2, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
clred <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col = clred)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir)
par(mfrow = c(2, 2))
pdf("multiframe_4.pdf")
par(mfrow = c(2, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
plot(l2011$B3_sre, col = clred)
plot(l2011$B4_sre, col = clnir)
dev.off() 


#6
#24.03.22
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("p224r63_2011.grd")
l2011 <- brick("p224r63_2011.grd")
l2011
plot(l2011$B4_sre)
plot(l2011[[1]])
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir) 
?plotRGB
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


#7
#25.03.22
library(RStoolbox)
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("defor1_.jpg")
l1992 <- brick("defor1_.jpg")
l1992
2^8
?plotRGB
plotRGB(l1992, r = 1, g = 2, b = 3, stretch = "lin")
brick("defor2_.jpg")
l2006 <- brick("defor2_.jpg")
l2006
plotRGB(l2006, r = 1, g = 2, b = 3, stretch = "lin")
par(mfrow = c(2, 1))
plotRGB(l1992, r = 1, g = 2, b = 3, stretch = "lin")
plotRGB(l2006, r = 1, g = 2, b = 3, stretch = "lin")
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi1992, col = cl)
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2006, col = cl)
dvi1992 = l1992$defor1_.1 - l1992$defor1_.2
dvi1992
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi1992, col = cl)
dvi2006 = l2006$defor1_.1 - l2006$defor1_.2
dvi2006
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2006, col = cl)
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c("blue", "white", "red"))(100)
dev.off()
plot(dvi_dif, col = cld)


#
#31.03.22
2^8
2^16
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("defor1_.jpg") 
l1992 <- brick("defor1_.jpg")
l1992
brick("defor2_.jpg")
l2006 <- brick("defor2_.jpg")
l2006
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])
ndvi1992
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])
ndvi1992
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(ndvi1992, col = cl) 
par(mfrow = c(2, 1))
plotRGB(l1992, r = 1, g = 2, b = 3, stretch = "lin")
plot(ndvi1992, col = cl)
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006
ndvi2006 = (l2006[[1]] - l2006[[2]]) / (l2006[[1]] + l2006[[2]])
ndvi2006
ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])
ndvi2006
par(mfrow = c(2, 1))
plot(ndvi1992, col = cl)
plot(ndvi2006, col = cl)
par(mfrow = c(1, 2))
plot(ndvi1992, col = cl)
plot(ndvi2006, col = cl)

install.packages("RStoolbox")
?RStoolbox
library(RStoolbox)
?spectralIndices
si1992 <- spectralIndices(l1992, green = 3, red = 2, nir = 1)
plot(si1992, col = cl)
si2006 <- spectralIndices(l2006, green = 3, red = 2, nir = 1)
plot(si2006, col = cl)

install.packages("rasterdiv")
library(rasterdiv)
plot(copNDVI)


#9
#01.04.22
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/greenland")
?raster
raster("lst_2000.tif")
lst2000 <- raster("lst_2000.tif")
lst2000
plot(lst2000)
raster("lst_2005.tif")
lst2005 <- raster("lst_2005.tif")
lst2005
raster("lst_2010.tif")
lst2010 <- raster("lst_2010.tif")
lst2010
raster("lst_2015.tif")
lst2015 <- raster("lst_2015.tif")
lst2015
cl <- colorRampPalette(c("blue", "light blue", "pink", "red")) (100)
par(mfrow = c(2, 2))
plot(lst2000, col = cl)
plot(lst2005, col = cl)
plot(lst2010, col = cl)
plot(lst2015, col = cl)
?lapply
?list.files 
list.files(pattern = "lst")
rlist <- list.files(pattern = "lst")
rlist
lapply(rlist, raster)
import <- lapply(rlist, raster)
import
?stack
stack(import)
tgr <- stack(import)
tgr
plot(tgr, col = cl)
plot(tgr$lst_2000, col = cl)
plot(tgr[[1]], col = cl)
?plotRGB
plotRGB(tgr, r = 1, g = 2, b = 3, stretch = "lin")



#10
#07.04.22
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/EN")
raster("EN_0001.png")
en01 <- raster("EN_0001.png")
en01
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en01, col = cl)
raster("EN_0013.png")
en13 <- raster("EN_0013.png")
en13
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en13, col = cl)
list.files(pattern = "EN")
rlist <- list.files(pattern = "EN")
lapply(rlist, raster)
rimp <- lapply(rlist, raster)
rimp
stack(rimp)
en <- stack(rimp)
en
plot(en, col = cl)
par(mfrow = c(1, 2))
plot(en[[1]], col = cl)
plot(en[[13]], col = cl)
stack(en[[1]], en[[13]])
en113 <- stack(en[[1]], en[[13]])
en113 
plot(en113, col = cl)
difen <- en[[1]] - en[[13]] #anche al contrario si può fare
difen
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(difen, col = cldif)



#11
#08.04.22
?source
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/EN")
en <- raster("EN_0001.png")
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en01, col = cl)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
source("R_inputcode.r")
list.files(pattern = "EN")
rlist <- list.files(pattern = "EN")
rlist
lapply(rlist, raster)
rimp <- lapply(rlist, raster)
rimp
stack(rimp)
en <- stack(rimp)
en
plot(en, col = cl)
?plotRGB
plotRGB(en, r = 1, g = 7, b = 13, stretch = "lin")
plotRGB(en, r = 1, g = 7, b = 13, stretch = "hist")
library(raster)
install.packages("RStoolbox")
library(RStoolbox)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
plotRGB(so, r = 1, g = 2, b = 3, stretch ="lin")
plotRGB(so, r = 1, g = 2, b = 3, stretch ="hist")
?unsuperClass
unsuperClass(so, nClasses = 3)
soc <- unsuperClass(so, nClasses = 3)
soc
cl <- colorRampPalette(c("yellow", "black", "red")) (100)
plot(soc$map, col = cl) 
cl <- colorRampPalette(c("red", "yellow", "black")) (100)
plot(soc$map, col = cl) 
?set.seed



#12
#21.04.22
#21.04.22
library(raster)
library(RStoolbox)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg") 
gc 
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="lin")
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="hist")
?unsuperClass
unsuperClass(gc, nClasses = 2)
gcclass2 <- unsuperClass(gc, nClasses = 2)
gcclass2
plot(gcclass2$map)
par(mfrow = c(2, 1))
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="lin")
plot(gcclass2$map)
?set.seed
unsuperClass(gc, nClasses = 4)
gcclass4 <- unsuperClass(gc, nClasses = 4)
gcclass4
plot(gcclass4$map)
par(mfrow = c(2, 1))
plot(gcclass4$map, col = cl)
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="hist")
cl <- colorRampPalette(c("yellow", "red", "black")) (100)
par(mfrow = c(2, 1))
plot(gcclass4$map, col = cl)
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="hist")




#13
#22.04.22

