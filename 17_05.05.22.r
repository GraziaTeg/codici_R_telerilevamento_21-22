#17
#05.05.22

#slide 7

#oggi analisi multivariata
#la misura della variabilità la possiamo fare su una variabile 
#es. età 
#dobbiamo scegliere una di queste bande?
#1 metodo 
#usare una banda in cui abbiamo fiducia = NIR
#2 metodo
#calcarci degli indici spettrali per es NDVI
#3
#compattare tutto il sistema di una sola banda
#passando da un sistema 2D o 3D a 4D

#unendo tutto 
#la prima banda è quella con più informazioni 
#e useremo quella per il calcolo della variabilità
#= nel calcolo della variabilità abbiamo bisogno di una sola 
#informazione = variabile = banda
#o utilizzare una banda a disposizione o utilizzare un indice spettrale 
#oppure fare un analisi multivariata e prenderci la prima banda

#di analisi multivariata ne esisto un sacco 
#noi utilizziamo la principal component analysis
#ce ne sono anche altre 
#tutti hanno come scopo quello di compattare i dati in un sistema più semplice

#google --> multivariate analysis
#è compattato in un numero minore di variabili 
#il nostro occhio arriva fino alla 3 dimensione 


#una variabile sulla quale 
#misurare la variabilità parziale 

#dobbiamo passare da un sistema complesso di bande 
#a una sistema ridotto a una sola banda

#film - cartone animato = Flatland = mondo a 2D

#sia abituati a scompattare le figure 2D o 3D = in una dimensione 
#N - 1 --> in una funzione più semplice
#es cubo 3d se apri cubo 2d 

#se noi consideriamo la 2D e poi la 3D --> nel modo 2D vedono elementi staccati 
#loro vedono 5 sezioni 

#nella nostra banale percezione del mondo in 3D --> ci potrebbero essere 
#degli elementi 4D, che per noi nella dimensione 3D sono separati 

#libro = "La quarta dimensione"

#come rappresentare un cubo = quadrimensionale in tre dimensione, è possibili?
#si, è possibili = cubo che poi si estende in un'altra dimensione 
#prendere i cubo 3D e 2D = cubo in 4D [che non possiamo immaginare]
#2D + 3D = 4D --> croce in 4D --> e passare dal cubo 4D a cubo 3D = 
#che si chiama IPERCUBO 

#IPERCUBO = con Dalì e Banchoff 

#cubo 4D = in un quadro = croce utilizzata è un ipercubo 
#la scienza entra per rappresentare qualcosa che sarebbe irrapresentabile

#noi dobbiamo fare Banchoff e Dalì 
#dalla 4D alla 3D 
#dall'ennessima dimensione di marte a una sola dimensione 

#analisi multivariata
#un articolo: ecography
#una immagine 
#noi lo applichiamo per delle bande/informazioni che sono correlate
#tra loro = e possiamo compattarle in un unica informazione 
#fatto con qualsiasi tipo di dato 

#altri teme e quelli che riguardano il telerilevamento = libro
#libro = Jensen introductory Digital Image Processing 

#jamboard [1]

#git hub
#R_code_multivariate_analysis.r

#R code for multivariate analysis

#quali libreria usiamo:
library(raster)
library(RStoolbox)#contiene le funzione per fare l'analisi multivariata

#settaggio della cartella 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#le bande che andremo a utilizzare sono quelle del
#p224r63
#immagini del Landsat
#path del satellite ogni path ha un numero con righe = battaglia navale
brick("p224r63_2011_masked.grd")#altro formato rispetto a quello utilizzato 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
#console
#class      : RasterBrick 
#dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
#resolution : 30, 30  (x, y)
#extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : p224r63_2011_masked.grd 
#names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
#min values : 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.196277e-02, 4.116526e-03, 2.951000e+02, 0.000000e+00 
#max values :    0.1249041,    0.2563655,    0.2591587,    0.5592193,    0.4894984,  305.2000000,    0.3692634 

#prima immagine caricata
#fare il plot
plot(p224r63_2011)
#vediamo le bande che abbiamo a disposizione 
#7 bande dall'immagine Landsat
#banda 6 = con l'infrarosso termico 
#sarebbe 6.1 e 6.2 = alla fine 8 immagini 
#qui la 6 già compattate = quindi ne ho 7
#riflettanza in 7 bande

#ora ricampionamento = resampling

#ora abbiamo un immagine con 4 milioni di pixel per ogni banda
#in tutto 30 milioni di pixel = proviamo a diminuire la mia 
#risoluzione iniziale 

#jamboard [2]

#si chiama RICAMPIONAMENTO 
#aggregriamo i pixel formando pixel un pò meno in dettaglio 
#--> PCA analisi invasiva = 
#funzione aggregate
?aggregate 
#compute summary statistics of data subsets
#fa delle summary statistics = set di dati (moda, media, mediana)
#si fa anche il ricampionamento 


#aggregate cells: resampling (ricampionamento) 
#= celle aggregate: ricampionamento (ricampionamento)
#fact = fator = lavora linearmente 10*10 = 100 pixel tutti insieme 
aggregate(p224r63_2011, fact = 10)
p224r63_2011res <- aggregate(p224r63_2011, fact = 10)
#p224r63_2011res = res = resampling
p224r63_2011res
#console
#class      : RasterBrick 
#dimensions : 150, 297, 44550, 7  (nrow, ncol, ncell, nlayers)
#resolution : 300, 300  (x, y)
#extent     : 579765, 668865, -522735, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : memory
#names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
#min values :   0.00670000,   0.01580000,   0.01356544,   0.01648527,   0.01500000, 295.54400513,   0.00270000 
#max values :   0.04936299,   0.08943339,   0.10513023,   0.43805822,   0.31297142, 303.57499786,   0.18649654 

#ci vuole un pò
#perché deve ricampionare tutto 

#possiamo fare il ggplot2
#mettere le librerie
library(ggplot2)
library(patchwork)

#usiamo bande infrarosso, rosso e verde = 4, 3, 2
ggRGB(p224r63_2011, 4, 3, 2)
g1 <- ggRGB(p224r63_2011, 4, 3, 2)
g1
ggRGB(p224r63_2011res, 4, 3, 2)
g2 <- ggRGB(p224r63_2011res, 4, 3, 2)
g2
g1 + g2

#immagine una vicino all'altra 
#si vede bene che 
#a sinistra la risoluzione dell'immagine è più alta di quella a destra
#a destra = un pò più sfumata
#sinistra = più nel dettaglio 

#il pattern è lineare = il fattore di cambiamento 
#fattore iniziale 30*30 
#con il campionamento (resampling) la risoluzione nuova è di 300*300
#con un fattore 10 compattiamo 10 pixel 

#jamboard [3]

#se voglio con un fattore di 100*100
#resampling più aggressivo 
#aggressive resamplig con fattore 100
aggregate(p224r63_2011, fact = 100)
p224r63_2011res100 <- aggregate(p224r63_2011, fact = 100)
p224r63_2011res100
#console
#class      : RasterBrick 
#dimensions : 15, 30, 450, 7  (nrow, ncol, ncell, nlayers)
#resolution : 3000, 3000  (x, y)
#extent     : 579765, 669765, -522735, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : memory
#names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
#min values :   0.01326567,   0.03136197,   0.02054964,   0.02450000,   0.02020000, 295.89243595,   0.01860000 
#max values :   0.03201742,   0.06424964,   0.05783996,   0.32584882,   0.20949732, 299.69603180,   0.10384682 

#rifacciamo il ggRGB
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
#sx = 30*30
#mezzo = 300*300
#dx = 100*100 = 3000*3000 pixel [100 * 30 pixel]
#dx = campionato in modo pesantina = perchè è stata ricampionata




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

