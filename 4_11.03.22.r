#11.03.22

#codici del 10.03.22
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

#rimesso i codici di ieri = 10.03.22
#visualizzazione di immagini da satellite dentro a R
#tirato dentro un'immagine e poi plottata 
#quando abbiamo tirato dentro un immagine 
#l2011 informazioni all'interno
l2011 <- brick("p224r63_2011.grd")
l2011
#class      : RasterBrick 
#dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
#resolution : 30, 30  (x, y)
#extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : p224r63_2011.grd 
#names      :      B1_sre,      B2_sre,      B3_sre,      B4_sre,      B5_sre,       B6_bt,      B7_sre 
#min values :         0.0,         0.0,         0.0,         0.0,         0.0,       295.1,         0.0 
#max values :   1.0000000,   0.2563655,   0.2591587,   0.5592193,   0.4894984, 305.2000000,   0.3692634 

#crs = Coordinate Reference System
#ogni tipo di dato geografico = ha bisogno di un sistema di riferimento per 
#essere georeferenziato in uno spazio quindi deve avere delle coordinate
#x e y
#qui abbiamo: +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs

#Su virtuale
#slide 4 
#generalità sui sistemi di riferimento 
#pag 3 
#divisioni di meridiani e paralleli
#parallelo che circonda il piano equatoriale 
#meridiano principale a cui partono le longitudini 
#nord e sud = latitudine
#est ed ovest = longitudine
#oggi latitudine con una cosa nuova 

#per stabilire un sistema di riferimento, noi possiamo 
#usare qualsiasi forma appossima alla Terra
#tra le forme che approssimano la Terra quella ideale è il 
#GEOIDE
#pag 5
#Geoide = non forma geometrica = convesso
#non può essere usata per la misura

#un geoide
#jamboard[1]
#GEOIDE = la superficie equi-potenziale, che approssima al meglio il
#livello del mare
#sul foglio 

#in R

#quindi la proiezione è UTM
#e la zona è la 22 [importante scriverla sempre]
#con l'estensione della mia immagine che sono [extent] = 
#la X
#579765 = 79km a Est del meridiano centrale 
#e arriva fino a 
#668775 
#668775 - 579765 dal meridiano centrale 
#la Y = la distanza in metri dall'equatore = eravamo nell'Amazonia
#con - 

#jamboard [2]

#proiezione = UTM
#zone = 22 = fuso = partendo dall'antimeridiano di Greenwich
#datum = WGS84
#datum = ellissoide e dov'è stato piazzato 
#unit = unità che sono m = metri 

#latitudine e longitudine non sono coordinate assolute, ma sono misure 
#fatte su un certo ellissoide 
#la latitudine non va al centro della Terra 


#codici 11.03.22
l2011 <- brick("p224r63_2011.grd")
l2011
