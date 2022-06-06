#10 
#07.04.22

#secondo esempio 
#altro set
#dati Esa con Copernico 
#con dati di media - alta risoluzione 
#dati 
#risoluzione 10 m 
#vari sensori = + sensori per il monitoraggio di alcune sostanze = come gli 
#ossidi di azoto 
#lockdown = - traffico = vediamo cosa è successo?
#google
#sentinel data on nitrogen during lockdown dell'Esa = 
#forte riduzione di ossidi di azoto 

#scaricare dati EN.zip
#EN = European nitrogen
#importiamo i dati tramite list.files, lapply, stack

#sul satelliti sentinel = dentro a Copernicus, c'è un satellite con 
#sensore = che è sentinel = sensore di 10 m 
#all'interno del Sentinel = sensore che misura gli ossidi di azoto 
#uso dati 

#oggi analisi con la riduzione di ossidi di azoto
#carichiamo il pacchetto raster
library(raster)
#settiamo la cartella di lavoro 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/EN")

#jamboard [1]

#1 file
raster("EN_0001.png")
en01 <- raster("EN_0001.png")
en01
#console
#class      : RasterLayer 
#band       : 1  (of  3  bands)
#dimensions : 432, 768, 331776  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 768, 0, 432  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : EN_0001.png 
#names      : EN_0001 
#values     : 0, 255  (min, max)
#file a 8 BIT 
#abbiamo importato la 1 layer di 3

#plottiamo il primo dato 
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en01, col = cl)
#1 immagine 
#dato già elaborato 
#dato inizio gennaio 
#si vedono bene le città 
#una dato a 8 BIT

#andiamo a vedere il 13 dato 
raster("EN_0013.png")
en13 <- raster("EN_0013.png")
en13
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en13, col = cl)
#a marzo 
#si vede molto bene la differenza 

#ora importiamo tutto il data set insieme = let's import the whole set (altogether!)
#exercise: impost the whole as in the Greenland example
#by the following steps: list.files, lapply, stack
#list.files = lista dei file disponibili nella cartella
#lapply = applicare una funzione a tutto il blocco e importare con un nome
#stack = stack di tutti i dati tutti insieme 
list.files(pattern = "EN") #EN parte comune del pattern
rlist <- list.files(pattern = "EN")#sempre r list
lapply(rlist, raster)
#console
#[[1]]
#class      : RasterLayer 
#band       : 1  (of  3  bands)
#dimensions : 432, 768, 331776  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 768, 0, 432  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : EN_0001.png 
#names      : EN_0001 
#values     : 0, 255  (min, max)
#[[2]]
#class      : RasterLayer 
#band       : 1  (of  3  bands)
#dimensions : 432, 768, 331776  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 768, 0, 432  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : EN_0002.png 
#names      : EN_0002 
#values     : 0, 255  (min, max)
#fino alla 13
#[[13]]
#class      : RasterLayer 
#band       : 1  (of  3  bands)
#dimensions : 432, 768, 331776  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 768, 0, 432  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : EN_0013.png 
#names      : EN_0013 
#values     : 0, 255  (min, max)
rimp <- lapply(rlist, raster) #mettere la rimp = importare
rimp
#stack
stack(rimp)
en <- stack(rimp)
en
#console 
#class      : RasterStack 
#dimensions : 432, 768, 331776, 13  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 768, 0, 432  (xmin, xmax, ymin, ymax)
#crs        : NA 
#names      : EN_0001, EN_0002, EN_0003, EN_0004, EN_0005, EN_0006, EN_0007, EN_0008, EN_0009, EN_0010, EN_0011, EN_0012, EN_0013 
#min values :       0,       0,       0,       0,       0,       0,       0,       0,       0,       0,       0,       0,       0 
#max values :     255,     255,     255,     255,     255,     255,     255,     255,     255,     255,     255,     255,     255 

#plottiamo 
plot(en, col = cl)

#sono tutte insieme

#esercizio = plottiamo EN01 vicino EN13
#se voglio mettere insieme #elementi [[]]
par(mfrow = c(1, 2))
plot(en[[1]], col = cl)
plot(en[[13]], col = cl)

#oppure 

#faccio uno stack
stack(en[[1]], en[[13]])
en113 <- stack(en[[1]], en[[13]])
en113 #del 1 e del 13
#invece di fare un multiframe = pesco solo il 1 e 13
#poi plot
plot(en113, col = cl)

#jamboard [3]
#ora fare una differenza tra azoto nella 1 e nella 13
#let's make the difference
difen <- en[[1]] - en[[13]] #anche al contrario si può fare
difen
#console
#class      : RasterLayer 
#dimensions : 432, 768, 331776  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 768, 0, 432  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -255, 255  (min, max)
#differenza varia tra -255 a +255
#plottiamo 
#nuova colorRampPalette
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(difen, col = cldif)
#zona d'Europa dove c'è stata la decrescita






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
