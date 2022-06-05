#24.03.22

#rivisto puntata precedente 18.03.22
#oggi esercizio sui colori e come creare immagini a colori
#slide 2

#immagini a colori
#o a singole bande oppure montare bande insieme = RGB = lo schema si chiama

#1 caricare i nostri dati 
library(raster)

#settaggio working directort = setwd
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#importazione immagine #p224 = path percorso satellite, r = row, riga
#incrociando path e row = abbiamo la singola immagine 
brick("p224r63_2011.grd")
l2011 <- brick("p224r63_2011.grd")
l2011
#importato immagine

#siamo in virtuale nell'area di studio = PARAKANA = 
#la deforestazione della foresta tropicale 


#jamboard [1]
#esercizio 
#plot of l2011 in the NIR channel = importare da l2011 solo l'infrarosso vicino = NIR
plot(l2011$B4_sre)
#oppure
plot(l2011[[1]])
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir)


#RGB
#colori 
#nostra percezione dei colori 
#un computer come lavora con i colori 
#google "RGB"
#qualsiasi computer, tv,... ==> lavora con questo schema RGB
#che sono il rosso, verde e il blu 
#montati insieme danno origine agli altri colori 
#si chiamano componenti RGB [ar gi bi compoint]
#questo vale per tutti schemi di apparto digitale 

#giochiamo con questi colori 
#jamboard [2]
#quando andiamo a fare un plottaggio possiamo solo utilizzare 3 bande per volta
#R --> rosso = banda B3
#G --> verde = banda B2
#B --> blu = banda B1
#per utilizzare la funzione plot RGB
?plotRGB #Red-Green-Blue plot of a multi-layered Raster object
#r = mettendo le bande
#Landsat ETM+
#b1 = blu
#b2 = verde
#b3 = rosso
#b4 = infrarosso vicino NIR
#plotRGB(l2011, r = 3, g = 2, b = 1,)
#più argomento STRETCH = li ampia per vedere meglio i contrasti lineari ["lin"]
#o a istogramma ["hist"] = tra virgolette
plotRGB(l2011, r = 3, g = 2, b = 1, stretch = "lin")
#immagine che viene fuori si dice a colori naturali 
#immagine ha una maschera in cui non sono registrati valori (detriti neri)
#rappresenta la nostra riserva naturale da 800 metri di distanza di come 
#lo vedrebbe l'occhio umano 

#ora andiamo ad usare anche l'infrarossa 
#jamboard [3]
#noi possiamo solo usare 3 bande
#quindi metto 
#r --> 4 = NIR
#g --> 3 = rosso 
#b --> 2 = verde
plotRGB(l2011, r = 4, g = 3, b = 2, stretch = "lin")
#non vediamo quello che vede l'uomo 
#ma vediamo tutto quello che rifletterà nell'infrarosso diventerà di coloro red = rosso 
#slide 2 pag 20  
#la pianta riflette moltissimo in infrarosso = perché le cellule del 
#mesofillo = con tessuto a palizzata (cellule molto robuste una accanto all'altra)
#e l'angolo di penetrazione = riflette insieme alla banda del verde (quella che vediamo noi)
#tutto quello che diventa rosso è vegetazione 
#sembra il polmone 
#vediamo tutte quelle zone con vegetazione = con singoli pixel con alti valori di 
#riflettanza nel NIR

#giochino
#spostiamo l'infrarosso non nella componente del red ma in quella verde
#r --> 3 = rosso
#g --> 4 = NIR 
#b --> 2 = verde
plotRGB(l2011, r = 3, g = 4, b = 2, stretch = "lin")
#tutto quello che rifletterà nell'infrarosso vicino (NIR) diventerà 
#verde fluorescente 
#risorse delle piante sono: sole e acqua (traspirazione)

#si vede bene la vegetazione e la struttura interna 
#es. passaggio di acqua 
#e anche in violetto = zone con suolo nudo 
#ora altra composizione di banda
#infrarosso anche nella componente blu 
#r --> 3 = rosso
#g --> 2 = verde 
#b --> 4 = NIR
plotRGB(l2011, r = 3, g = 2, b = 4, stretch = "lin")
#diventerà blu la componente 
#si vedono molto bene le zone a suolo nudo 
#tutto quello che diventa giallo = parti agricole aperte che sono state aperte
#di agricoltura, aperte

#lo STRETCH
#jamboard [4]
#LIN = è lineare
#HIST = è un istogramma
#ora provo HIST sull'infrarosso sul verde 
plotRGB(l2011, r = 3, g = 4, b = 2, stretch = "hist")
#ora vediamo dentro la foresta la differenziazione che c'è

#come capire quale usare
#prima fare RGB naturale e poi mettere accanto le altre 
#es
#1. immagine del sito 
#2. RGB a colori naturali
#3. false colours = infrarossi 
#4. NDVI (successivamente)

#esercizio
#multiframe = insieme di più immagini 
#esercizio: build a multiframe with visible RGB 
#(linear stretch) on top of false colour
#(histogram stretch)
#costruire un multiframe con visualizzazione a colori naturali 
#stretch lineare = visibile normale = sopra = RGB visibile
#stretch istogramma = a falsi colori a infrarosso = sotto 
#quindi sopra RGB normale e sotto RGB + NIR
#jamboard [5]
#riga 2 
#colonna 1
#più elementi con c
par(mfrow = c(2, 1))
plotRGB(l2011, r = 3, g = 2, b = 1, stretch = "lin")
plotRGB(l2011, r = 3, g = 4, b = 2, stretch = "hist")
#si vede la differenza 


#esercizio = carichiamo l'immagine del 1988
#paragoniamo l'immagine del 1988 e del 2011
#andare a vedere come si chiama l'immagine del 1988
#nella cartella lab 
#stesso path del percorso di Landsat 224 con riga 67
#ci serve quella .grd
brick("p224r63_1988.grd")
l1988 <- brick("p224r63_1988.grd")
l1988
#nella console 
#class      : RasterBrick 
#dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
#resolution : 30, 30  (x, y)
#extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : p224r63_1988.grd 
#names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
#min values : 0.000000e+00, 7.159799e-03, 1.300000e-03, 6.015250e-04, 0.000000e+00, 2.916000e+02, 0.000000e+00 
#max values :    1.0000000,    0.4799183,    0.4921374,    0.6595379,    0.6034456,  305.2000000,    0.5607360 

#come era la riserva del Parakana nel 1988
#facciamo un multiframe
#sopra 4 3 2 del 1988
#sotto 4 3 2 del 2011
par(mfrow = C(2, 1))
plotRGB(l1988, r = 4, g = 3, b = 2, stretch = "lin")
plotRGB(l2011, r = 4, g = 3, b = 2, stretch = "lin")
#si vede la differenza 
#1988 = + foschia, uomo iniziato ad aprire le prime strade con campi coltivati 
# = inizio distruzione 
#2011 = situazione dopo 


#############

#slide 5 pag 27
#l'importanza di usare satelliti per visualizzare variazioni nel tempo dei loro sistemi
#immagini = foresta di prima
#immagini = quando è passato l'uomo 
#sito nella NASA = per sviluppare algoritmi per differenze nel tempo
#visualizzazione a colori naturali 
#può essere visualizzato dal satellite
#se usiamo con i colori naturali RGB 
#immagini = aumento della parte agricola = si vede ma non benissimo
#se con zoom e poi con infrarosso = si vede bene 

#pag 33-34
#due immagini infrarosso caricate su Virtuale 
#defor1_jpg e 
#defor2_jpg
#messe dentro alla cartella lab 

#sito: earth observatory
#con vari immagini = per esempio deforestazione 
#Rio Peixoto


#indici di vegetazione 
#misurano quanto una pianta è sana 
#le due immagini caricate in lab 
#calcoleremo gli indici di vegetazione con differenza tra 1992 e 2006
#periodo fenologico = paragone tra le due immagini tra agosto e luglio 

#domani lavoriamo sugli indici di vegetazione 

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
