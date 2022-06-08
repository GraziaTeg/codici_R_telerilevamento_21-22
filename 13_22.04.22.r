#13
#22.04.22
#abbiamo concluso la lezione sulla classificazione 
#Sole e Grand Canyon

#analisi multi temporale di un cambiamento dell'uso del suolo 

#copertura del suolo 

#il fiume Colorado = anche altri tipi di ecosistema 

#cambiamento del nostro sistema 
#pianeta cambiamento a tassi anche molto veloci 
#cambiamento che c'è per uso del suolo o copertura del suolo
#ambienti naturali = foresta tropicale 
#o flusso umano = apertura dell'uomo durante la foresta 

#tirarli fuori attraverso la classificazione 
#oggi anche più librerie
#una ggplot2 = primo impatto che abbiamo = facciamo piccoli grafici 
#statistiche sulla restituzione delle classi 

#code for generating land cover maps from satellite imagery
#codice per la generazione di mappe di copertura del suolo da immagini satellitari
#librerie

library(raster)
library(RStoolbox) #funzioni per la classificazione 
#working direttory
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
#su Virtuale -> immagini -> defor1_.jpg e defor2_.jpg [del Rio Peixoto = in Brasile]
#immagini del 1992 e 2006 in lab 

#imamgini multispettrali = diverse bande all'interno = usiamo brick
#prima immagine
#brick = serve per importare l'intero pacchetto di dati = importiamo l'intera
#immagine satellitare

brick("defor1_.jpg") 
l92 <- brick("defor1_.jpg")
l92

#NIR = 1
#rosso = 2
#verde = 3 

#plotRGB
plotRGB(l92, 1, 2, 3, stretch= "lin")
#per velocizzare non ho scritto r = 1, g = 2, b = 3
#venuta fuori immagine 
#1 = NIR = vicino infrarosso = e tutto quello che è diventato rosso è vegetazione

#exercise: import defor2 and plot both in a single window
#= importa defor2 e traccia entrambi in un'unica finestra
brick("defor2_.jpg")
l06 <- brick("defor2_.jpg")
l06
plotRGB(l06, 1, 2, 3, stretch= "lin")

#par = perchè abbiamo immagini multispettrali 
par(mfrow = c(2, 1))
plotRGB(l92, 1, 2, 3, stretch= "lin")
plotRGB(l06, 1, 2, 3, stretch= "lin")

#altri pacchetti per fare il multiframe 
#making a simple multiframe with ggplot2 = creare un semplice multiframe con ggplot2
?ggplot2
install.packages("ggplot2")
#pacchetto elegante per la visualizzazione dei dati 
library(ggplot2)
#libro gratis di ggplo2 = https://ggplot2-book.org/

#usiamo funzioni 
#?ggRGB function RStoolbox = con ggRGB {RStoolbox}
#ggRGB(
#  img,
#  r = 3,
#  g = 2,
#  b = 1,
#  stretch = "none",)
ggRGB(l92, 1, 2, 3, stretch = "lin")

#sulla x e y ci sono le coordinate = a immagine non geo referenziate
#utile per plottare in modo speditivo le immagini satellitari 
#e anche multiframe favolori 
ggRGB(l06, 1, 2, 3, stretch = "lin")

#ora come facciamo ad unire le due immagini 
#con pacchetto 
??patchwork
#molto bello
#io considero il mio plot come se fosse un oggetto e lo assegno a un oggetto = p1
#poi p2 
#e poi faccio la somma p1 + p2

#jamboard [2]

install.packages("patchwork")
library(patchwork)

#associamo i due plot precedenti a un nome = 2 oggetti 
ggRGB(l92, 1, 2, 3, stretch = "lin")
p1 <- ggRGB(l92, 1, 2, 3, stretch = "lin")
p1
ggRGB(l06, 1, 2, 3, stretch = "lin")
p2 <- ggRGB(l06, 1, 2, 3, stretch = "lin")
p2
p1 + p2
#uno accanto all'altro 

#se li voglio uno sopra e uno sotto 
#mettere la divisione 
p1/p2

#https://patchwork.data-imaginist.com/


#la classificazione = classification
#unsupervised classification 
?unsuperClass
#con C maiuscola 
#unsuperClass(
#  img,
#  nSamples = 10000,
#  nClasses = 5,....)
#nelle nostre imamgini 2/3 classi 
unsuperClass(l92, nClass = 2)
l92c <- unsuperClass(l92, nClasses = 2)
l92c 
#immagine del 92 con la classificazione = l92c
#console
#unsuperClass results
#*************** Model ******************
#  $model
#K-means clustering with 2 clusters of sizes 1035, 8965
#Cluster centroids:
#  defor1_.1 defor1_.2 defor1_.3
#1  202.8657 156.84251 151.97391
#2  197.2886  21.87161  35.99978
#Within cluster sum of squares by cluster:
#  [1]  6892968 10525612
#*************** Map ******************
#  $map
#class      : RasterLayer 
#dimensions : 478, 714, 341292  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : class 
#values     : 1, 2  (min, max)
#più veloce
#pixel uguale 
#immagini già elaborata 

dev.off()

#fare plot 
#è un modello e ci leghiamo la mappa che possiamo plottare
plot(l92c$map)
#colori diversi dal prof.
#classe 1 = è la foresta = verde = 
#nel mio caso è la classe 2 la foresta
#classe 2 = è l'agricoltura + acqua = bianca =
#e qui la classe 1
#andare a vedere l'immagine originale 
#inversione di colori rispetto al prof

#se si una la funzione di set.seed() 
#la prossima volta che lo apro viene fuori la stessa cosa

#exercise: classify the Landsat image from 2006 classificare l'immagine Landsat del 2006
#2006
unsuperClass(l06, nClass = 2)
l06c <- unsuperClass(l06, nClasses = 2)
l06c 

dev.off()

plot(l06c$map)
#so che la foresta è centrale 
#ora la mappa è uguale al prof
#mappa 
#foresta = la classe 1
#agricoltura + acqua = la classe 2

#jamboard [3]
#frequenza = misura di quante volte avviene un certo evento
#in questo caso i pixel che appartengono alla classe foresta

#frequenza = funzione di chiama freq = frequencies
?freq
#genera delle tabelle di frequenze = quanti pixel ci sono 
#frequenza dei pixel delle due classi 
freq(l92c$map)
#value  count
#[1,]     1  34807 (agricoltura)
#[2,]     2 306485 (foresta)
#noi abbiamo a disposizione della mappa l92c = 341292 pixel totali 
#di questi = 34807 = appartengono alla classe 1 = agricoltura
#mentre la classe 2 = foresta ha 306485
#diverso dal prof = 305213 foresta classe 1 e 36079 = agricoltura classe 2

#per la mappa del 2006
freq(l06c$map)
#value  count
#[1,]     1 178641 (foresta)
#[2,]     2 164085 (agricoltura)
#uguale al prof = 
#classe 1 foresta 178641
#classe 2 agricoltura 164085




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
