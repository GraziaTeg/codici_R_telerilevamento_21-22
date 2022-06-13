#all'inizio sempre l'installazione e i pacchetti 
#library
library(raster) 
library(RStoolbox) # for image viewing and variability calculation
library(ggplot2) # for ggplot plotting +anche ggRGB
library(patchwork)# multiframe with ggplot2 graphs
library(viridis)


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
library(raster)
library(RStoolbox) 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("defor1_.jpg") 
l92 <- brick("defor1_.jpg")
l92
plotRGB(l92, 1, 2, 3, stretch= "lin")
brick("defor2_.jpg")
l06 <- brick("defor2_.jpg")
l06
plotRGB(l06, 1, 2, 3, stretch= "lin")
par(mfrow = c(2, 1))
plotRGB(l92, 1, 2, 3, stretch= "lin")
plotRGB(l06, 1, 2, 3, stretch= "lin")
?ggplot2
install.packages("ggplot2")
library(ggplot2)
ggRGB(l92, 1, 2, 3, stretch = "lin")
ggRGB(l06, 1, 2, 3, stretch = "lin")
install.packages("patchwork")
library(patchwork)
ggRGB(l92, 1, 2, 3, stretch = "lin")
p1 <- ggRGB(l92, 1, 2, 3, stretch = "lin")
p1
ggRGB(l06, 1, 2, 3, stretch = "lin")
p2 <- ggRGB(l06, 1, 2, 3, stretch = "lin")
p2
p1 + p2
p1/p2
?unsuperClass
unsuperClass(l92, nClass = 2)
l92c <- unsuperClass(l92, nClasses = 2)
l92c 
dev.off()
plot(l92c$map)
unsuperClass(l06, nClass = 2)
l06c <- unsuperClass(l06, nClasses = 2)
l06c 
dev.off()
plot(l06c$map)
?freq
freq(l92c$map)
freq(l06c$map)



#14
#28.04.22
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("defor1_.jpg") 
l92 <- brick("defor1_.jpg")
l92
plotRGB(l92, 1, 2, 3, stretch= "lin")
brick("defor2_.jpg")
l06 <- brick("defor2_.jpg")
l06
plotRGB(l06, 1, 2, 3, stretch= "lin")
unsuperClass(l92, nClass = 2)
l92c <- unsuperClass(l92, nClasses = 2)
l92c 
dev.off()
plot(l92c$map)
unsuperClass(l06, nClass = 2)
l06c <- unsuperClass(l06, nClasses = 2)
l06c 
dev.off()
plot(l06c$map)
?freq
freq(l92c$map)
freq(l06c$map)
tot92 <- 342192
prop_forest_92 <- 304493 / tot92
prop_forest_92
perc_forest_92 <- 304493 * 100 / tot92
perc_forest_92
perc_agr_92 <- 100 - perc_forest_92
perc_agr_92
perc_agr_92_2 <- 36799 * 100 / tot92
perc_agr_92_2
tot_06 <- 342726
percent_forest_06 <- 179246 * 100 / tot_06
percent_forest_06
percent_agr_06 <- 100 - percent_forest_06
percent_agr_06
class <- c("Forest, Agriculture") 
percent_1992 <- c(88.98309, 11.01691)
percent_2006 <- c(52.30009, 47.69991)
?data.frame
multitemporal <- data.frame(class, percent_1992, percent_2006)
multitemporal
?ggplot
ggplot(multitemporal, aes(x = class, y = percent_1992, color = class)) + geom_bar(stat = "identity", fill = "white")
ggplot(multitemporal, aes(x = class, y = percent_2006, color = class)) + geom_bar(stat = "identity", fill = "white")
pdf("percentages_1992.pdf")
ggplot(multitemporal, aes(x = class, y = percent_1992, color = class)) + geom_bar(stat = "identity", fill = "white")
dev.off()
pdf("percentages_2006.pdf")
ggplot(multitemporal, aes(x = class, y = percent_2006, color = class)) + geom_bar(stat = "identity", fill = "white")
dev.off()
install.packages("viridis")
library(viridis)



#15
#28.04.22
library(raster) 
library(RStoolbox) 
library(ggplot2) 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("sentinel.png")
sen <- brick("sentinel.png")
sen
ggRGB(sen, 1, 2, 3, stretch = "lin")
ggRGB(sen, 1, 2, 3)
library(patchwork)
ggRGB(sen, 1, 2, 3)
g1 <- ggRGB(sen, 1, 2, 3)
g1
ggRGB(sen, 2, 1, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g2
g1 + g2
?focal
nir <- sen[[1]]
nir
plot(nir)
?focal
focal(nir, matrix(1/9, 3, 3), fun = sd)
sd3 <- focal(nir, matrix(1/9, 3, 3), fun = sd)
sd3
plot(sd3)
clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown", "red", "yellow")) (100)
plot(sd3, col = clsd)
#install.packages("viridis")
library(viridis)
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer))
?viridis
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "magma") +
  ggtitle("Standard deviation by viridis")




#16
#03.05.22
library(raster) 
library(RStoolbox)
library(ggplot2) 
library(patchwork)
library(viridis)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("sentinel.png")
sen <- brick("sentinel.png")
sen
ggRGB(sen, 1, 2, 3, stretch = "lin")
ggRGB(sen, 1, 2, 3)
g1 <- ggRGB(sen, 1, 2, 3)
g1
ggRGB(sen, 2, 1, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g2
library(patchwork)
ggRGB(sen, 1, 2, 3)
g1 <- ggRGB(sen, 1, 2, 3)
g1
ggRGB(sen, 2, 1, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g2
g1 + g2
g1/g2
(g1+g2)/(g1+g2)
nir <- sen[[1]]
nir
plot(nir)
?focal
focal(nir, w=matrix(1/9, 3, 3), fun = sd)
sd3 <- focal(nir, matrix(1/9, 3, 3), fun = sd)
sd3
plot(sd3)
clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown", "red", "yellow")) (100)
plot(sd3, col = clsd)
library(viridis)
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer))
?viridis
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "magma") +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation by viridis")



#17
#05.05.22
library(raster)
library(RStoolbox)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("p224r63_2011_masked.grd") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
?aggregate 
aggregate(p224r63_2011, fact = 10)
p224r63_2011res <- aggregate(p224r63_2011, fact = 10)
p224r63_2011res
library(ggplot2)
library(patchwork)
ggRGB(p224r63_2011, 4, 3, 2)
g1 <- ggRGB(p224r63_2011, 4, 3, 2)
g1
ggRGB(p224r63_2011res, 4, 3, 2)
g2 <- ggRGB(p224r63_2011res, 4, 3, 2)
g2
g1 + g2
aggregate(p224r63_2011, fact = 100)
p224r63_2011res100 <- aggregate(p224r63_2011, fact = 100)
p224r63_2011res100
ggRGB(p224r63_2011, 4, 3, 2)
g1 <- ggRGB(p224r63_2011, 4, 3, 2)
g1
ggRGB(p224r63_2011res, 4, 3, 2)
g2 <- ggRGB(p224r63_2011res, 4, 3, 2)
g2
ggRGB(p224r63_2011res, 4, 3, 2)
g3 <- ggRGB(p224r63_2011res100, 4, 3, 2)
g3
g1 + g2 + g3


#18
#06.05.22
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("p224r63_2011_masked.grd") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
aggregate(p224r63_2011, fact = 10)
p224r63_2011res <- aggregate(p224r63_2011, fact = 10)
p224r63_2011res
ggRGB(p224r63_2011, 4, 3, 2)
g1 <- ggRGB(p224r63_2011, 4, 3, 2)
g1
ggRGB(p224r63_2011res, 4, 3, 2)
g2 <- ggRGB(p224r63_2011res, 4, 3, 2)
g2
g1 + g2
aggregate(p224r63_2011, fact = 100)
p224r63_2011res100 <- aggregate(p224r63_2011, fact = 100)
p224r63_2011res100
ggRGB(p224r63_2011, 4, 3, 2)
g1 <- ggRGB(p224r63_2011, 4, 3, 2)
g1
ggRGB(p224r63_2011res, 4, 3, 2)
g2 <- ggRGB(p224r63_2011res, 4, 3, 2)
g2
ggRGB(p224r63_2011res, 4, 3, 2)
g3 <- ggRGB(p224r63_2011res100, 4, 3, 2)
g3
g1 + g2 + g3
?rasterPCA
rasterPCA(p224r63_2011res)
p224r63_2011respca <- rasterPCA(p224r63_2011res)
p224r63_2011respca
?summary
summary(p224r63_2011respca$model)
plot(p224r63_2011respca$map)
library(viridis)
?viridis
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("PC1")
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "magma") +
  ggtitle("PC1")
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC7)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC7")
g1 <- ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
g2 <- ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC7)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC7")
g1 + g2
g3 <- ggplot() + 
  geom_raster(p224r63_2011res, mapping =aes(x=x, y=y, fill=B4_sre)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
g1 + g3 
ggRGB(p224r63_2011res, 4, 3, 2)
g4 <- ggRGB(p224r63_2011res, 4, 3, 2)
g4
g1 + g4
ggRGB(p224r63_2011, 4, 3, 2)
g5 <- ggRGB(p224r63_2011, 4, 3, 2)
g5
g1 + g5
ggRGB(p224r63_2011, 2, 3, 4)
g6 <- ggRGB(p224r63_2011, 2, 3, 4)
g6
g1 + g6
plotRGB(p224r63_2011, 2, 3, 4, stretch = "lin")
ggRGB(p224r63_2011, 2, 3, 4, stretch = "hist")
g7 <- ggRGB(p224r63_2011, 2, 3, 4, stretch = "hist")
g7
g1 + g7
plotRGB(p224r63_2011respca$map, 1, 2, 3, stretch = "lin")
plotRGB(p224r63_2011respca$map, 5, 6, 7, stretch = "lin")
################################
library(raster)
library(RStoolbox)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("sentinel.png")
siml <- brick("sentinel.png")
siml
library(ggplot2)
ggRGB(siml, 1, 2, 3)
ggRGB(siml, 3, 1, 2)
?rasterPCA
rasterPCA(siml)
simlpca <- rasterPCA(siml)
simlpca
?summary
summary(simlpca$model)
library(viridis)
ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC3)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("PC3")
ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC3)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC3")
library(patchwork)
g1 <- ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
g3 <- ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC3)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC3")
g1 + g3 
g2 <- ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC2)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC2")
g1 + g2 + g3
pc1 <- simlpca$map[[1]]
sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
sd3
plot(sd3)
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")


#19
#19.05.22
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("sentinel.png")
sen <- brick("sentinel.png")
sen
library(ggplot2)
ggRGB(sen, 1, 2, 3)
ggRGB(sen, 3, 1, 2)
?rasterPCA
rasterPCA(sen)
sen_pca <- rasterPCA(sen)
sen_pca
?summary
summary(sen_pca$model)
plot(sen_pca$map)
sen_pca$map
pc1 <- sen_pca$map$PC1
pc2 <- sen_pca$map$PC2
pc3 <- sen_pca$map$PC3
ggplot() + 
  geom_raster(pc1, mapping =aes(x=x, y=y, fill=PC1)) 
library(patchwork)
?patchwork
g1 <- ggplot() + 
  geom_raster(pc1, mapping =aes(x=x, y=y, fill=PC1)) 
g2 <- ggplot() + 
  geom_raster(pc2, mapping =aes(x=x, y=y, fill=PC2)) 
g3 <-ggplot() + 
  geom_raster(pc3, mapping =aes(x=x, y=y, fill=PC3)) 
g1 + g2 + g3
?focal
focal(pc1, matrix(1/9, 3, 3), fun = sd)
sd3 <- focal(pc1, matrix(1/9, 3, 3), fun = sd)
sd3
plot(sd3)
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) 
library(viridis)
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "viridis") +
  ggtitle("Standard deviation of PC1")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "cividis") +
  ggtitle("Standard deviation of PC1")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")
im1 <- ggRGB(sen, 2, 1, 3)
im2 <- ggplot() + 
  geom_raster(pc1, mapping =aes(x=x, y=y, fill=PC1)) 
im3 <- ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")
im1 + im2 + im3 
focal(pc1, matrix(1/25, 5, 5), fun = sd)
sd5 <- focal(pc1, matrix(1/25, 5, 5), fun = sd)
sd5
plot(sd5)
ggplot() + 
  geom_raster(sd5, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")
im4 <- ggplot() + 
  geom_raster(sd5, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")
im3 + im4
sd7 <- focal(pc1, matrix(1/49, 7, 7), fun = sd)
sd7
ggplot() + 
  geom_raster(sd7, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")
im5 <- ggplot() + 
  geom_raster(sd7, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")
im3 + im4 + im5

