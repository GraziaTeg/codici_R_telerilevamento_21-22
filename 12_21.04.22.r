#12
#21.04.22
#oggi 
#classifichiamo le immagini: il caso del Grand Canyon 
#con dati processati e foto da Space Station 
#[qui foto e va bene perché sono foto]
#ma si dice sempre IMMAGINI = perché è uno scanner

#CLASSIFICAZIONE 
#come passare da dati continui a classi mineralogiche 

#jamboard [1]

#algoritmo di classificazione 
#serve per individuare le differenze di composizione mineralogiche 
#della classificazione mineralogica del Grand Canyon

#classificazione con git hub
library(raster)
library(RStoolbox)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#scorsa volta con immagini del sole 
#con vari livelli energeti di gas

#https://landsat.visibleearth.nasa.gov/view.php?id=80948
#sito immagini che caricheremo

#oggi GRAND CANYON
#importiamo le immagini 
brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg") 
gc #Grand Canyon
#console
#class      : RasterBrick 
#dimensions : 6222, 9334, 58076148, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 9334, 0, 6222  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : dolansprings_oli_2013088_canyon_lrg.jpg 
#names      : dolansprings_oli_2013088_canyon_lrg.1, dolansprings_oli_2013088_canyon_lrg.2, dolansprings_oli_2013088_canyon_lrg.3 
#min values :                                     0,                                     0,                                     0 
#max values :                                   255,                                   255,                                   255 

#rosso = 1
#verde = 2
#blu = 3
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="lin")
#differenza della roccia, nuvole, acqua

plotRGB(gc, r = 1, g = 2, b = 3, stretch ="hist")
#non cambia i dati 
#sembra 3D

#classificazione
?unsuperClass
#unsupervised = non supervisionata = e cerca te i gruppi 
#immagine, numero di campioni se vogliamo e numero di classe
#ognuno li ha diversi 

unsuperClass(gc, nClasses = 2)
gcclass2 <- unsuperClass(gc, nClasses = 2) #gc della classe 2
gcclass2

#console
#unsuperClass results

#*************** Model ******************
#  $model
#K-means clustering with 2 clusters of sizes 3080, 6920

#Cluster centroids:
#  dolansprings_oli_2013088_canyon_lrg.1 dolansprings_oli_2013088_canyon_lrg.2
#1                              105.9860                              91.26981
#2                              177.9087                             160.36604
#dolansprings_oli_2013088_canyon_lrg.3
#1                              70.27727
#2                             136.62211

#Within cluster sum of squares by cluster:
#  [1]  7884524 10060895

#*************** Map ******************
#  $map
#class      : RasterLayer 
#dimensions : 6222, 9334, 58076148  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 9334, 0, 6222  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : r_tmp_2022-06-08_003530_7364_43532.grd 
#names      : class 
#values     : 1, 2  (min, max)

#due valori perchè sono le due classi 

#jamboard [2]
 
plot(gcclass2$map)
#pixel random
#classe 1 verde = corrisponde a tutta la parte che c'è di roccia
#parte 2 bianca = corrisponde all'acqua, ombre, + differenziazione roccia,...
#al prof viene opposto 

#il prof ha fatto una multiframe
#metto insieme per un confronto
par(mfrow = c(2, 1))
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="lin")
plot(gcclass2$map)
#messi a confronto 

#per mantenere la stessa si mette la funzione = set.seed()
#es
?set.seed
#set.seed(17)

#ora andiamo con un numero differenti di classi 
#esercizio = classifichiamo la mappa con 4 classi 
unsuperClass(gc, nClasses = 4)
gcclass4 <- unsuperClass(gc, nClasses = 4)
gcclass4
plot(gcclass4$map)

#console
#unsuperClass results
#*************** Model ******************
#  $model
#K-means clustering with 4 clusters of sizes 3121, 2254, 3727, 898

#Cluster centroids:
#  dolansprings_oli_2013088_canyon_lrg.1
#1                             192.74688
#2                             125.96894
#3                             166.19882
#4                              64.58018
#dolansprings_oli_2013088_canyon_lrg.2
#1                             177.74591
#2                             107.88199
#3                             146.74162
#4                              57.38196
#dolansprings_oli_2013088_canyon_lrg.3
#1                             156.64018
#2                              82.85847
#3                             120.84867
#4                              44.54677

#Within cluster sum of squares by cluster:
#  [1] 2737492 1336366 1481747 1339327
#*************** Map ******************
#  $map
#class      : RasterLayer 
#dimensions : 6222, 9334, 58076148  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 9334, 0, 6222  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : r_tmp_2022-06-08_005030_7364_44546.grd 
#names      : class 
#values     : 1, 4  (min, max)

#mappa con 4 classi 
par(mfrow = c(2, 1))
plot(gcclass4$map, col = cl)
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="hist")

#li cambiamo i colori 
cl <- colorRampPalette(c("yellow", "red", "blue", "black")) (100)
par(mfrow = c(2, 1))
plot(gcclass4$map, col = cl)
plotRGB(gc, r = 1, g = 2, b = 3, stretch ="hist")

#si vede di più la differenza
#abbiamo una conformazione che unisce le nuvole (giallo) alla parte molto 
#probabilmente alla sabbia
#acqua = con delle nuvole = nero 
#rosso = altro tipo di composizione mineralogica
#due tipi di roccia = rossa e blu 
#gialla = sabbia
#nero = ombre ed acqua



#con quella lineare si capisce un pò meno invece di quella a istogramma
#si differenzia molto di più

#se le immagini sono troppo piccole e strette
st <- stack(gc, gcclass4$map)
plot(st) 
#singole bande con 4 bande


#domani lavoriamo sulle immagini di Land Cover = 
#usata sia in Ecologie e Geologia = 
#copertura del suolo da parte della vegetazione o informazioni
#naturali o artificiali




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
st <- stack(gc, gcclass4$map)
plot(st) 
