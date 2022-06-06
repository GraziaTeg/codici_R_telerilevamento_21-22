#9
#01.04.22

#come importare e visualizzare immagini satellitari 
#come calcolare gli indici spettrali a partire da queste immagini
#per ora solo due date

#oggi con + date
#Greenland date = cambiamento nel tempo della temperatura della Groenlandia 
#questi dati derivano da Copernicus

#slide 6 pag 4
#DESCRIZIONI DELLE VARIABILI 

#Copernico = programma sviluppato dell'Esa
#4 parti = vegetazione, energia, acqua e criosfera
#+ hot spot e dati a terra
#VEGETAZIONE = tante variabili 
#esempi:
#-> LAI = LEAF AREA INDEX = quanto è grande la dimensione della foglia
#= + è grande la foglia + è grande l'indice
#-> FCOVER = qual è la parte della pianta verde e in salute 
#-> FAPAR = quanto è potente fotosinteticamente una pianta
#-> NDVI 
#-> VCI = molto relazionato al NDVI 
#-> VPI = molto relazionato al NDVI = va a misurare la deviazione del valore di 
#NDVI misurato di un certo momento rispetto alla sua storia
#-> DMP = quanta materia secca riprodotta = materia organica con massa = stima
#-> BURNT AREA = incendi = indice che l'indice cambia 
#-> SOIL WATER INDEX = misura le condizioni di umidità del suolo 
#-> SURFACE SOIL MOISTURE = uguale a prima ma in centimetri

#ENERGIA:
#-> TOP OF CANOPY REFLECTANCE = energia della riflettanza degli alberi = quanto
#il suolo e gli alberi vengono riflessi
#-> SURFACE ALBEDO = quanto è l'albedo = quanta luce viene riflessa
#-> LAND SURFACE TEMPERATURE = usiamo oggi = dati a 8 BIT + formule = per 
#misurare la temperatura della Terra = non quella dell'aria = non 
#quello che percepiamo, ma al suolo o vegetazione 

#indici basati sui laghi principalmente
#CICLO DELL'ACQUA:
#-> LAKE SURFACE WATER TEMPERATURE = temperatura della superficie del lago
#-> LAKE WATER QUALITY = qualità delle acque
#-> WATER BODIES = acque che non sono perenni = delle acque interne = per 
#esempio stagni
#-> WATER LEVEL = livello delle acque = altezza colonna

#CRIOSFERA:
#-> SNOW COVER = strato di neve che è cambiato 
#-> LAKE ICE EXTENT = estensione del ghiaccio nei laghi 

#########################
#OGGI USIAMO la variabili di energia 
#LST = LAND SURFACE TEMPERATURE
#per vedere quanta è cambiata all'interno della Groenlandia la 
#temperatura in un certo periodo di tempo 
#scaricare dati GREENLAND DATA 
#dentro ci sono 4 file 2000, 2005, 2010, 2015
#dentro la cartella lab = cartella greenland

#Time series analysis of Greenland LST data 
#Analisi delle serie temporali dei dati LST della Groenlandia
#inserire pacchetti 
library(raster)
#oggi importiamo tanti dati insieme
#cartella di lavoro 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/greenland")
#aggiungere anche la cartella greenland

#importiamo tutti i dati 
#prima con l'importazione classica, poi quella globale = tutti insieme
#lst = landsat estemperation = che misura la temperatura
#jamboard [1]

#con la funzione RASTER, io creo un singolo raster, strato layer
?raster

raster("lst_2000.tif")
lst2000 <- raster("lst_2000.tif")
lst2000
#console 
#class      : RasterBrick 
#dimensions : 1913, 2315, 4428595, 1  (nrow, ncol, ncell, nlayers)
#resolution : 1546.869, 1546.898  (x, y)
#extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
#crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
#source     : lst_2000.tif 
#names      : lst_2000 
#min values :        0 
#max values :    65535 
#ci sono tanti pixel 4428595
#1 solo layer
#665535 = 16 BIT 
#plottiamo l'immagine della Groenlandia nel 2000
plot(lst2000)
#vediamo che la parte con temperature più basse è la parte centrale 
#dove si sono le zone bianche centrali = zone coperte da neve

#importiamo tutti i dati del 2005, 2010, 2015
#2005
raster("lst_2005.tif")
lst2005 <- raster("lst_2005.tif")
lst2005
#2010
raster("lst_2010.tif")
lst2010 <- raster("lst_2010.tif")
lst2010
#2015
raster("lst_2015.tif")
lst2015 <- raster("lst_2015.tif")
lst2015

#creiamo una nostra colorRampPalette
cl <- colorRampPalette(c("blue", "light blue", "pink", "red")) (100)

#exercise: multiframe con 4 dati = 2 righe e 2 colonne
par(mfrow = c(2, 2))
plot(lst2000, col = cl)
plot(lst2005, col = cl)
plot(lst2010, col = cl)
plot(lst2015, col = cl)

#ci possono essere delle fluttuazioni all'interno di un trend
#ma si vede che all'inizi nel 2000 la parte di temperature più basse è più
#estesa degli altri anni 


###########################
#oggi 
#come importare questo set tutto insieme
?lapply

#jamboard [2]

#utilizzeremo tanto 
?list.files #list dot files
#lista di file = dire in che cartella deve prenderli 
#parametro importante è il pattern = serve per spiegare una caratteristica 
#comune di tutti i file che vogliamo caricare

#import the whole set altogether!
#1. fare la lista del file = con list.files
#pattern = ci vuole un pezzo comune = "lst" = tra "_" perchè è un pezzo del testo
list.files(pattern = "lst")
#diamo un nome
rlist <- list.files(pattern = "lst")
rlist
#console
#[1] "lst_2000.tif" "lst_2005.tif" "lst_2010.tif" "lst_2015.tif"

#la lista si chiama rlist
#ora il raster 
lapply(rlist, raster)
import <- lapply(rlist, raster)
import
#abbiamo importato i 4 file tutti insieme
#4 elementi [[]]
#console
#[[1]]
#class      : RasterLayer 
#dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
#resolution : 1546.869, 1546.898  (x, y)
#extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
#crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
#source     : lst_2000.tif 
#names      : lst_2000 
#values     : 0, 65535  (min, max)
#[[2]]
#class      : RasterLayer 
#dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
#resolution : 1546.869, 1546.898  (x, y)
#extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
#crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
#source     : lst_2005.tif 
#names      : lst_2005 
#values     : 0, 65535  (min, max)
#[[3]]
#class      : RasterLayer 
#dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
#resolution : 1546.869, 1546.898  (x, y)
#extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
#crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
#source     : lst_2010.tif 
#names      : lst_2010 
#values     : 0, 65535  (min, max)
#[[4]]
#class      : RasterLayer 
#dimensions : 1913, 2315, 4428595  (nrow, ncol, ncell)
#resolution : 1546.869, 1546.898  (x, y)
#extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
#crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
#source     : lst_2015.tif 
#names      : lst_2015 
#values     : 0, 65535  (min, max)

#jamboard [3]
#stack = mette tutto insieme
?stack
#blocco comune di tutti i dati 
#stack di import
stack(import)
#altro nome tgr = temperation greenland
tgr <- stack(import)
tgr
#raster stack tutto insieme 
#brick = importavamo per immagine satellitare
#stack = per singoli dati 
#console
#class      : RasterStack 
#dimensions : 1913, 2315, 4428595, 4  (nrow, ncol, ncell, nlayers)
#resolution : 1546.869, 1546.898  (x, y)
#extent     : -267676.7, 3313324, -1483987, 1475229  (xmin, xmax, ymin, ymax)
#crs        : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs 
#names      : lst_2000, lst_2005, lst_2010, lst_2015 
#min values :        0,        0,        0,        0 
#max values :    65535,    65535,    65535,    65535 

#layer 4 = con valori 65535
#invece di fare il multiframe 
#io faccio una lista -> applico la funzione lapply che mi applica alla funzione
#raster alla lista e poi faccio uno stack

#plot con lo stesso colorRampPalette
plot(tgr, col = cl)
#l'immagine ti da anche i titoli sopra 
#ora si fanno sempre gli stack

#ora si possono anche parlare di bande = sono layer dello stesso stack

#ora se vogliamo plottare anche il primo elemento dello stack 
#o con $ o elemento 
plot(tgr$lst_2000, col = cl)
#oppure
plot(tgr[[1]], col = cl)


#abbaimo fatto il plottaggio con schema RGB con riflettanze da satellite
#fare RGB basandoci sui layer dei nostri stack 

#jamboard [4]
#mettiamo 
#lst_2000 ==> R
#lst_2005 ==> G
#lst_2010 ==> B
?plotRGB #con sintassi
#abbiamo un multilayer
plotRGB(tgr, r = 1, g = 2, b = 3, stretch = "lin")
#la parte centrale si vede molto bene = con la parte + alta esterna
#scura = temperatura + bassa
#sovrappone 3 bande insieme


#########################
#?colorist 
#colorazione delle specie 



#######################
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
#sentinel data on nitrogen during lockdown dell'Esa


#scaricare dati EN.zip
#importiamo i dati tramite list.files, lapply, stack

#prossima volta




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
