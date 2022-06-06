#8
#31.03.22

#scorsa volta DVI
#altro indice molto simile che si chiama NDVI 
#NDVI = viene normalizzato sulla somma delle due bande 
#DVI = era per differenza
#NDVI = importante = immaginiamo di avere due immagini con numero di bit diverso
#es
2^8
#[1] 256
2^16
#[1] 65536 
#sono diverse
#per standardizzare i due indici = facendo la somma 
#con i valori della riflettanza delle due bande


#simile alla somma ma aggiungiamo la somma delle due riflettanze
#differenza tra due valori e il rapporto con la loro somma
#slide 2 pag 23
#standardizziamo sul valore totale della loro somma

#jamboard [1]

#Range DVI (8 BIT): -255 a 255
#Range NDVI (8 BIT): -1 a 1
#NDVI = normalizzato o standardizzato 

#ora 16 bit
2^16
#[1] 65536
#Range DVI (16 BIT): -65535 a 65535
#Range NDVI (16 BIT): -1 a 1

#è meglio utilizzare NDVI perchè è possibile fare confronti perché il 
#range del NDVI = è normalizzato perchè è sempre -1 a +1
#NDVI può essere usato anche con immagini con risoluzione radiometrica differente 
#[risoluzione radiometrica --> quanti bit ci sono a disposizione di un immagine]

#ora calcoliamo NDVI = per le immagini 
#carichiamo la libreria raster
library(raster) #raster = rastrum = aratro

#settiamo la Working directory
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#importo le due immagini l1992 e l2006
brick("defor1_.jpg") #brick = carica un intero blocco di bande
l1992 <- brick("defor1_.jpg")
l1992
#è a 8 BIT = min 0 max 255
brick("defor2_.jpg")
l2006 <- brick("defor2_.jpg")
l2006
#è a 8 BIT = min 0 max 255

#calcolo 
#DVI = calcolo o con nome o con elementi 
dvi1992 = l1992[[1]] - l1992[[2]]
#dvi = riflettanza NIR - riflettanza R
dvi1992

#NDVI 
#1 banda = NIR
#2 banda = RED
#NDVI 1992
#con parentesi che racchiudono numeratore e denominatore
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])
ndvi1992
#oppure
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])
ndvi1992
#oppure con la funzione sum
#console
#class      : RasterLayer 
#dimensions : 478, 714, 341292  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -1, 1  (min, max)
#range è -1 a 1 [-1 nell'acqua]

#ora facciamo un plot
cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(ndvi1992, col = cl) #col = colorRampPalette


#esercizio
#fare un multiframe con il plotRGB dell'immagine sopra [dalla scorsa volta]
#e l'NDVI sotto
par(mfrow = c(2, 1)) #due righe e una colonna
plotRGB(l1992, r = 1, g = 2, b = 3, stretch = "lin")
plot(ndvi1992, col = cl)

#sono slittate = perché una è un immagine naturale già analizzata e l'altra con legenda
#NDVI valore minimo -1 = blu scuro = dove il nero NIR infrarosso viene assorbito 
#del tutto = indice crolla = è dell'acqua 
#allora perché gran parte del fiume non è di colore blu = perché ci sono dei detriti
#con anche solidi disciolti 
#in questi periodi la riflettanza è sempre la stessa 
#non c'è il valore minimo nel fiume

#ora facciamo il 2006
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

#NDVI 
#1 banda = NIR
#2 banda = RED
#NDVI 2006
ndvi2006 = (l2006[[1]] - l2006[[2]]) / (l2006[[1]] + l2006[[2]])
ndvi2006
#oppure
ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])
ndvi2006
#console 
#class      : RasterLayer 
#dimensions : 478, 717, 342726  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : -1, 1  (min, max)


#facciamo il plot del NDVI del 2006
#multiframe 
#esercizio
#fare un multiframe con il NDVI1992 dell'immagine sopra e NDVI2006 sotto
#usando sempre questa colorRampPalette
#cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
par(mfrow = c(2, 1))
plot(ndvi1992, col = cl)
plot(ndvi2006, col = cl)
#oppure metterla una di fianco all'altra = rende meglio
par(mfrow = c(1, 2))
plot(ndvi1992, col = cl)
plot(ndvi2006, col = cl)

#1 immagine = valore NDVI = alto verso 1
#2 immagine = valori molto bassi tende verso il basso vicino allo 0 
#[sempre circa suolo nudo]
#quanto si apre l'uomo per le attività agricole


#########################
#ora dobbiamo utilizzare una nuova libreria
#prima installarlo
install.packages("RStoolbox")
?RStoolbox
library(RStoolbox)
#tanti strumenti che servono ad analizzare i dati da telerilevamento 
#es: analisi multivariata delle immagini satellitari
#dentro c'è anche una funzione che si chiama 
#spectralIndices = calcola una serie di indici multispettrali come NDVI, SAVI
#SAVI = indice che pesa la riflettanza del suolo ecc
?spectralIndices
#bande coinvolte = blu, vede, rosso, NIR, redEdge [differenza rosso e NIR], swir [infrarosso medio]
#noi calcoliamo gli indici con il rosso, NIR e verde

#1 banda = NIR
#2 banda = red
#3 banda = green
#ora possiamo usare la funzione spectralIndices = si
si1992 <- spectralIndices(l1992, green = 3, red = 2, nir = 1)
#mi da un warning
#Warning message:
#  EVI/EVI2 parameters L_evi, G, C1 and C2 are defined for reflectance [0,1] but img values are outside of this range.
#If you are using scaled reflectance values please provide the scaleFactor argument.
#If img is in DN or radiance it must be converted to reflectance.
#Skipping EVI calculation.

#andiamo a visualizzare i nostri indici 
#cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100) sempre uguale 
plot(si1992, col = cl)

#tutte le mappe che andiamo a creare
#tutti gli indici che riguardano la nostra area di studio
#ogni singolo indice 
#GEMI
#NDVI
#DVI
#tutti gli indici possibili che possiamo calcolare per un immagine 
#NDWI = con anche quantità di acqua = per i geologi
#NDWI = normalized difference water index = si calcola quali sono gli stress
#a livello di acqua = stress idrici 

#2006
si2006 <- spectralIndices(l2006, green = 3, red = 2, nir = 1)
plot(si2006, col = cl)


#il prof ha citato il COPERNICUS
#l'ESA = agenzia spaziale europea
#ha deciso di fare dei calcoli con immagini da satelliti con parti ambientali 
#tutto gratuito
#sito 
#https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
#4 comparti fondamentali 
#1. stati della vegetazione 
#2. budget energetico
#3. ciclo dell'acqua
#4. criosfera = ghiaccio
#dentro a ognuno ci sono i vari indici 
#es. quanto cambia la temperatura globale sulla terra 

#NDVI a scala globale, il prof lo ha già inserito nel pacchetto ma dobbiamo
#partire dai dati COPERNICUS
#il pacchetto = per la misura della diversità dalla spazio 
#si chiama RASTERDIV
#?rasterdiv #https://cran.r-project.org/web/packages/rasterdiv/index.html
#del prof
#in ogni pacchetto c'è un manuale e poi ci sono anche le vignettes
#rasterdiv = perché è la diversità misurata su dati raster partendo 
#dell'ecologia di comunità = branca dell'ecologia che misura la diversità
#all'interno delle comunità di gruppi di organismi di varie specie che convivono 
#insieme 

###########
install.packages("rasterdiv")
#una volta installato il pacchetto
library(rasterdiv)

#ora che data set c'è dentro rasterdiv
#copNDVI = è NDVI di Copernicus
#--> raster a 8 BIT [0 - 255] = è la media del Normalised Difference 
#Vegetation Index dal 1999 al 2017 
#media globale di questo indice 
#più c'è vegetazione e maggiore è questo indice = + biomassa = + energia 
#all'interno anche del sistema [biomassa = regola il sistema del basso] =
#perché: 
#- è fonte di cibo di tutta la catena alimentare,
#- la vegetazione rappresenta una protezione per tanti animali o piante
#= + biomassa + NDVI a scala globale = + condizione degli ecosistemi 

#facciamo il plot
plot(copNDVI)
#blu = acqua
#verdi = + alta biomassa = zone centrali nell'Equatore = con 
#foreste tropicali e foreste di conifere delle alte latitudini = con NDVI alto




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
