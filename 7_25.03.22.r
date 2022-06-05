#25.03.22
#utilizzare bande singoli 
#ma anche montarli negli 
#INDICI SPETTRALI
#noi partiamo con gli indici di vegetazione 
#una pianta quando sta male cambia colore 
#per esempio quando è sotto stress cambia il colore e spettro vegetale

#slide 2 pag 23 
#indice NDVI
#Normalized Difference Vegetation Index
#indice di vegetazione 
#basato sulla differenza tra due bande 

#pag 20
#un pixel dove è presente vegetazione sana = avrà questa componetene delle foglie 
#ogni specie assorbe e riflette la lunghezza d'onda in modo peculiare 
#in generale, qualsiasi piante riflette molto vicino infrarosso e verde ed
#assorbe il rosso e blu per fare la fotosintesi 
#è possibile utilizzare queste bande del rosso e dell'infrarosso per creare 
#un indice

#jamboard [1]

#ho installato questo pacchetto per dopo
#library(RStoolbox)
#serve per calcolare gli indici di vegetazione 
library(raster)

#per chi ha avuto dei problemi = installare il pacchetto ("rgdal")
#library("rgdal")

#poi fare il settaggio della cartella di lavoro della Working directory
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#dati già analizzati che andiamo a utilizzare sono  
#dal sito earth.observaroty -> Rio Peixoto
#dati con scritte 
#nell'agosto del 1992 e nel luglio del 2006
#caricare queste due file 
#defor1_.jpg
#defor2_.jpg

#brick = per importare immagini raster tutte insieme
#esercizio
#import the firth file -> defor1_.jpg -> give it the name l1992
#importare la prima immagine satellitare con l1992
brick("defor1_.jpg")
l1992 <- brick("defor1_.jpg")
l1992
#nella console
#class      : RasterBrick 
#dimensions : 478, 714, 341292, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : defor1_.jpg 
#names      : defor1_.1, defor1_.2, defor1_.3 
#min values :         0,         0,         0 
#max values :       255,       255,       255 

#la classe è un RasterBrick
#sono solo presenti 3 bande [nlayers]
#risoluzione = immagine non georeferenziata = perchè scaricata direttamente dal sito
#i nomi = sono defor1_.1, defor1_.2, defor1_.3 = 3 bande con 3 nomi
#valori minimi e massimi da 0 a 255
#interviene Shannon

#slide 3
#come funzionano le immagini satellitari 
#la nostra fonte per le immagini ottiche è il sole
#il satellite capisce parte di queste lunghezze d'onda e restituisce valori di 
#riflettanza [il flusso radiante = un flusso incidente
#una parte del flusso incidente viene riflessa]
#jamboard [2]

#Indice di SHANNON = BIT
2^8 #2 al 8
#[1] 256
#o da 0 a 255 = 256
#o da 1 a 256 = 256
#molti immagini satellitari vanno da 0 a 255 = 8 BIT = 
#quindi utilizziamo solo dati interi 

#ora dobbiamo fare un plot 
#capendo quale bande sono coivolte = perché non sappiamo quali siano
#facendo un PLOT con 3 bande insieme = plotRGB
?plotRGB
#del pacchetto raster = con pacchetto a funzione
#andiamo alla cieca
plotRGB(l1992, r = 1, g = 2, b = 3, stretch = "lin")

#foresta tropicale intorno a Rio Piexoto
#la vegetazione rifletta moltissimo l'infrarosso 
#jamboard [3]
#scoprire quale banda è diventata rossa
#NIR = montata sul red
#1 NIR ==> R
#2 red ==> G
#3 green ==> B
#la prima NIR siamo sicuri
#la 2 e la 3 non siamo sicuri 
#non è il numero 4 perché sono immagini già analizzate 
#non è un immagine originale di Landsat

#layer 1 = NIR = prima banda
#layer 2 = red
#layer 3 = green

#esercizio: 
#import the second file -> defor2_.jpg -> give it the name l2006
#importare la seconda immagine satellitare con l2006
brick("defor2_.jpg")
l2006 <- brick("defor2_.jpg")
l2006
#console
#class      : RasterBrick 
#dimensions : 478, 717, 342726, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : defor2_.jpg 
#names      : defor2_.1, defor2_.2, defor2_.3 
#min values :         0,         0,         0 
#anche in questo caso il range di valori va da 0 a 255
plotRGB(l2006, r = 1, g = 2, b = 3, stretch = "lin")
#si vede quanta distruzione c'è 

#exercise: 
#plot in a multiframe the two images with one on top of the other
#fare un multiframe 
#due immagini 
#sopra = l1992
#sotto = l2006
#quindi sono 2 righe e 1 colonna
par(mfrow = c(2, 1))
plotRGB(l1992, r = 1, g = 2, b = 3, stretch = "lin")
plotRGB(l2006, r = 1, g = 2, b = 3, stretch = "lin")
#vediamo la differenza tra le due immagini 
#la foresta (sopra)
#campi agricoli (sotto)
#il Rio lo vedete in due situazioni diverse, l'acqua 
#assorbe molto il NIR = l'acqua è nera 
#?perché nell'immagine sopra non lo è
#più sedimento all'interno del fiume e spostamento 
#guardare attentamente l'immagine 

################################
#DVI

#ora andiamo a misurare la saluta di questa vegetazione tramite l'indice DVI
#facciamo il calcolo di un indice spettrale
#in inglese DVI = di vi ai
#DVI = Difference Vegetation Index
#1992 e poi 2006
#DVI = è la differenza 
#jamboard [4]
#ora è meglio mettere gli elementi
#[[1]] = NIR
#[[2]] = red
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992
#valori 
#console
#class      : RasterLayer 
#dimensions : 478, 714, 341292  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -114, 248  (min, max)
#in values = valori minimi e massimi
#abbiamo usato = invece che <- l'assegnazione

#facciamo un plot di questo dato del DVI 1992
#deciso noi il colore
#DVI = è un singolo strato
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi1992, col = cl)
#DVI del 1992 = la salute della vegetazione del 1992
#rosso scuro = vegetazione in salute
#in giallo = male + fiume [simile a suolo nudo]

#ora andiamo a fare 2006 
#bande sempre le stesse
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006
#console
#class      : RasterLayer 
#dimensions : 478, 717, 342726  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -103, 249  (min, max)
#valori 

cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2006, col = cl)
#il giallo è male 
#c'è stata moltissima deforestazione = si vede molto bene 
#giallo molto
#con anche estinzione delle popolazione e anche specie 
#come sono a rischio i colubi rossi 
#problemi di noi stessi con la distruzione del pianeta 

#giallo è uno dei colori che colpisce di più la retina = 
#è quello che si vede subito 

#c'è un altro metodo per il calcolo della DVI 
#invece di usare gli elementi [[1]] e [[2]]
#possiamo usare i nomi 
dvi1992 = l1992$defor1_.1 - l1992$defor1_.2
dvi1992
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi1992, col = cl)
dvi2006 = l2006$defor1_.1 - l2006$defor1_.2
dvi2006
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2006, col = cl)

#jamboard [5]

#DVI 1992 = abbiamo della vegetazione 
#DVI 2006 = abbiamo meno vegetazione ma più deforestazione 
#ora facciamo la differenza tra 
#DVI1992 - DVI2006 = otteniamo la differenza di DVI 
#la differenza di DVI = dvi_dif
#DVI difference in time 
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c("blue", "white", "red"))(100)
#mi da un warning, non errore = ci sono magari nel bordo esterno, visto che sono immagini esportate
#non importa 
#Warning message:
#In dvi1992 - dvi2006 :
#  Raster objects have different extents. Result for their intersection is returned
#facciamo il plot
dev.off()
plot(dvi_dif, col = cld)
#in questa immagine 
#dove ho delle situazioni con più alta situazione ho valori rossi 
#la differenza tra NIR e red 
#dov'è venuta la deforestazione = questo è un metodo 
#numeri su mappa = non ci interessano 


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
