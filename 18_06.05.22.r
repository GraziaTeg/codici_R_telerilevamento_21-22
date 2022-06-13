#18
#06.05.22
#Analisi multivariata = ci serve per compattare un set
#in un numero inferiore di bande
#e poter calcolare su una sola di queste la variabilità spaziale 
#= analisi di quella che è la variabilità basandosi su quella che è 
#PCA

#su git hub

#riassunto puntata precedente

#libreria
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)

#settaggio cartella di lavoro
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#immagine 
brick("p224r63_2011_masked.grd") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)
#immagine pesante per calcolare una PCA sopra
#allora utilizziamo il comando aggregate che fa un resamplit
#il resampling
#--> abbiamo l'immagine originale, diamo un certo fattore
#e andiamo a creare una nuova immagine sulla quale fare un calcolo
#il fattore è lineare,
#se io metto un fattore di ricampionamento pari a 10 
#= prendo delle finestre = 10*10 pixel e all'interno calcolo un valore medio 
#e così possono ricampionare l'immagine con una risoluzione inferiore 
#per esempio 

#jamboard [1]

?aggregate 
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

#poi lo abbiamo fatto con il fattore 100
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


#ora facciamo la PCA con l'immagine ricampionata [media di tutti i valori interni]
#la funzione si chiama
#rasterPCA 
#funzione del RStoolbox
?rasterPCA
#andiamo a utilizzare
#jamboard [1]

#PCA Analysis
#PCA scritto in maiuscolo
#immagine quella che finiva con res
rasterPCA(p224r63_2011res)
p224r63_2011respca <- rasterPCA(p224r63_2011res)
p224r63_2011respca

#console
#$call
#rasterPCA(img = p224r63_2011res)
#$model
#Call:
#  princomp(cor = spca, covmat = covMat[[1]])
#Standard deviations:
#  Comp.1       Comp.2       Comp.3       Comp.4 
#1.2050671158 0.0461548804 0.0151509526 0.0045752199 
#Comp.5       Comp.6       Comp.7 
#0.0018413569 0.0012333745 0.0007595368 
#7  variables and  41233 observations.
#$map
#class      : RasterBrick 
#dimensions : 150, 297, 44550, 7  (nrow, ncol, ncell, nlayers)
#resolution : 300, 300  (x, y)
#extent     : 579765, 668865, -522735, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : memory
#names      :         PC1,         PC2,         PC3,         PC4,         PC5,         PC6,         PC7 
#min values : -1.96808589, -0.30213565, -0.07212294, -0.02976086, -0.02695825, -0.01712903, -0.00744772 
#max values : 6.065265723, 0.142898435, 0.114509984, 0.056825372, 0.008628344, 0.010537396, 0.005594299 
#attr(,"class")
#[1] "rasterPCA" "RStoolbox"
#> p224r63_2011respca <- rasterPCA(p224r63_2011res)
#> p224r63_2011respca
#$call
#rasterPCA(img = p224r63_2011res)
#$model
#Call:
#  princomp(cor = spca, covmat = covMat[[1]])
#Standard deviations:
#  Comp.1       Comp.2       Comp.3       Comp.4 
#1.2050671158 0.0461548804 0.0151509526 0.0045752199 
#Comp.5       Comp.6       Comp.7 
#0.0018413569 0.0012333745 0.0007595368 
#7  variables and  41233 observations.
#$map
#class      : RasterBrick 
#dimensions : 150, 297, 44550, 7  (nrow, ncol, ncell, nlayers)
#resolution : 300, 300  (x, y)
#extent     : 579765, 668865, -522735, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : memory
#names      :         PC1,         PC2,         PC3,         PC4,         PC5,         PC6,         PC7 
#min values : -1.96808589, -0.30213565, -0.07212294, -0.02976086, -0.02695825, -0.01712903, -0.00744772 
#max values : 6.065265723, 0.142898435, 0.114509984, 0.056825372, 0.008628344, 0.010537396, 0.005594299 
#attr(,"class")
#[1] "rasterPCA" "RStoolbox"

#ora noi abbiamo fatto la PCA 
#abbiamo creato un oggetto da un modello
#crea una mappa, variazioni [quanta variazione spiega una banda],
#serie di tabelle 

#jamboard [2]

#con il dollaro [$] crea:
#1. $call --> la funzione che abbiamo fatto partire 
#= rasterPCA con l'immagine
#2. $model = modello --> stessa cosa della classificazione
# ci sono tutte le varibilità spiegate dalle varie componenti 
#standard deviation
#3. $map = mappa --> 
#4. tipo di classe che è 

#come sapere le informazioni legate al modello 
#con la funzione summary per avere tutte le statistiche in uscita
?summary
#Object Summaries
#= riassunto per ogni oggetto che abbiamo creato 
#in questo caso un modello

#ha creato:
#$call
#$model
#$map

#summary del modello 
summary(p224r63_2011respca$model)

#console
#Importance of components:
#  Comp.1      Comp.2       Comp.3
#Standard deviation     1.2050671 0.046154880 0.0151509526
#Proportion of Variance 0.9983595 0.001464535 0.0001578136
#Cumulative Proportion  0.9983595 0.999824022 0.9999818357
#Comp.4       Comp.5
#Standard deviation     4.575220e-03 1.841357e-03
#Proportion of Variance 1.439092e-05 2.330990e-06
#Cumulative Proportion  9.999962e-01 9.999986e-01
#Comp.6       Comp.7
#Standard deviation     1.233375e-03 7.595368e-04
#Proportion of Variance 1.045814e-06 3.966086e-07
#Cumulative Proportion  9.999996e-01 1.000000e+00

#importanza delle varie componenti 
#7 componenti = alle 7 bande
#c'è una propozione della varianza = quanta variabilità viene spiegata 
#da ogni singola componente

#jamboard [3]

#PC1 = abbiamo il 99,83% della variabilità = tutta l'informazione 
#PC2 = 0.14%, ....
#la proporzione accumulata = la prima 0.99 + la seconda 
#fino ad arrivare alla 7 che abbiamo 1 

#questa componente abbiamo una nuova asse con la pc

#$map
#fare plot = per vedere tutte le componenti 
plot(p224r63_2011respca$map)
#vediamo che la prima PC1 
#è quella che ha èiù informazioni di tutte 
#l'ultima è quella che ha solo rumore

#usiamo la prima componente principale = PC1
#prima facciamo un plottaggio tra la prima componente e la 7
#con nomi giusti 
#facciamo un ggplot
library(viridis)
?viridis
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("PC1")
#fill = vogliamo mappare la PC1 
#prima componente principale con la legenda cividis

#i valori più alti sono quelli nel giallo 
#la variabilità dell'immagine si vede bene 

#pixel un pò sgranata perchè abbiamo usato l'immagine decampionata

#proviamo ad utilizzare magma o inferno 
#magma
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "magma") +
  ggtitle("PC1")
#inferno
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")

#andiamo a plottare anche la 7
ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC7)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC7")
#la differenza tra PC1 e PC7 si nota 
#non c'è tanta informazione 
#c'è più rumore inconsistente 
#non si nota tutte l'immagine 

#mettiamo uno vicino all'altro = PC1 e PC7
#assegnando il nome 
#g1 = PC1
#g2 = PC7
g1 <- ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
g2 <- ggplot() + 
  geom_raster(p224r63_2011respca$map, mapping =aes(x=x, y=y, fill=PC7)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC7")
g1 + g2

#sugli assi ci sono le coordinate originali 
#nel PC7 -> -500000 sulla Y distanza dall'equatore = qui sotto all'equatore
#nel PC7 -> sulla X distanza meridiano centrale di ogni fuso 
#l'immagine PC1 = conserva gran parte dell'informazione iniziale 
#immagine PC7 = perde tutte le informazioni = rumore di fondo continuo
#asse molto bassa

#nella PCA i valori minimi e i valori massimi = in legenda
#sono nuovi valori riscalati su quella banda li
#il significato di questi valori sono reali 
#a differenza delle bande = dove sono valori di riflettanza

#questa può essere correlata al vicino infrarosso = NIR
#lo assegnamo a g3
#immagine originale
#nel fill = mettere B4_sre = che è il nome dell'immagine per vederla = p224r63_2011res
#e ti da il nome dell'immagine dell'infrarosso 
g3 <- ggplot() + 
  geom_raster(p224r63_2011res, mapping =aes(x=x, y=y, fill=B4_sre)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")
#g3 = NIR
g1 + g3 
#dove la riflettanza nel NIR è più alta la PC1 è più bassa
#sono inversamente correlati 
#NIR infrared, ha più informazioni di tutte le bande, di solito
#le correlazioni sono anche piutosto alte

#es sulla destra = valore effettivo di riflettanza 
#riflettanza = rapporto tra la radiazione incidente al denominatore
#e quella che viene riflessa al numeratore
#da 0 a 0.4
#nel PC1 i numeri non hanno un significato di per se perché
#abbiamo riscalato i valori su un altro asse 


#possiamo farlo anche con un ggRGB
#con imamgine ricampionata p224r63_2011res
#R = 4 NIR
#G = 3 RED
#B = 2 GREEN
ggRGB(p224r63_2011res, 4, 3, 2)
g4 <- ggRGB(p224r63_2011res, 4, 3, 2)
g4
g1 + g4
#è ricampionata e non si vede bene 
#la parte di foresta corrisponde ai valori bassi della PCA

#se io invece dell'immagine ricampionata ci metto quella originale 
#= p224r63_2011
ggRGB(p224r63_2011, 4, 3, 2)
g5 <- ggRGB(p224r63_2011, 4, 3, 2)
g5
g1 + g5
#si vede un pelo meglio 
#proviamo a mettere l'infrarosso nel blu 
ggRGB(p224r63_2011, 2, 3, 4)
g6 <- ggRGB(p224r63_2011, 2, 3, 4)
g6
g1 + g6
#tutto quello che è vegetazione è blu = a dx
#e il suolo nudo è questo giallo nella PC1 

#meglio un plotRGB
plotRGB(p224r63_2011, 2, 3, 4, stretch = "lin")
#non posso unirlo 
#la parte centrale con la parte di vegetazione 
#parti con suolo nudo = più chiaro 
#la PCA contiene gran parte dell'informazione 
#praticamente la stessa cosa 
#avevamo l'immagine con tante bande l'abbiamo compattata 
#con un immagine con una banda sola

#in ggRGB = se non dichiaro lo stretch = con poche informazioni 
#se metto lo stretch = aumento 
ggRGB(p224r63_2011, 2, 3, 4, stretch = "hist")
g7 <- ggRGB(p224r63_2011, 2, 3, 4, stretch = "hist")
g7
#così si vede il contrasto 
#proviamo a unirli 
g1 + g7
#la PC1 è molto simili all'immagine originale 
#è inversamente correlata la vegetazione 
#PC1 = valori più bassi, a dx valori più alti nella vegetazione 
#PC1 = immagine originale 
#perché rappresenta il 99% della varianza 

#ora usare il plotRGB = con le prime tre componenti principali 
#plotRGB = con tutti i dati 

plotRGB(p224r63_2011respca$map, 1, 2, 3, stretch = "lin")

#nuova situazione 
#il massimo di informazioni che possiamo avere 
#si vede bene la variazione da un punto a un altro 
#possiamo usare focal = per calcolare la variabilità 
#non è una rappresentazione che ci porta dei colori a un significato 
#sono solo le prime 3 componenti = spiegano il 99.83% della variabilità totale 

#se mettiamo le ultime 3 
#il livello di informazione è più basso 
plotRGB(p224r63_2011respca$map, 5, 6, 7, stretch = "lin")
#situazione strana
#tanto rumore

#ora usiamo la PC1 per fare il calcolo della variabilità dell'immagine Similaun


###################################

#in git hub = tornare sul calcolo della variabilità della scorsa volta
#questa volta lo facciamo con la PC1 applicata al Similaun
#anzi ne facciamo uno nuovo su git hub

#r code for calculating spatial variability based on multivariate maps
#r codice per il calcolo della variabilità spaziale sulla base di mappe multivariate 
#in questo caso non andiamo a sceglierci noi una banda, ma andiamo 
#a compattare l'immagine originale su una solo banda
#= PC1 e su quella facciamo il calcolo
library(raster)
library(RStoolbox)
#settaggio
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("sentinel.png")
siml <- brick("sentinel.png")
siml
#console
#class      : RasterBrick 
#dimensions : 794, 798, 633612, 4  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 798, 0, 794  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : sentinel.png 
#names      : sentinel.1, sentinel.2, sentinel.3, sentinel.4 
#min values :          0,          0,          0,          0 
#max values :        255,        255,        255,        255 

#già elaborata
#ci interessano le prime 3 per la visualizzazione 

#NIR = 1
#Red = 2
#Green = 3

#facciamo un ggRGB
library(ggplot2)
ggRGB(siml, 1, 2, 3)
#eccolo il ghiacciaio del Similaun

#per evidenziare di più le parti a suolo nudo possiamo cambiare
#anche l'ordine
#es. NIR nella parte del verde
ggRGB(siml, 3, 1, 2)
#NIR = verde = sforescente 
#parte suolo nudo = viola
#acqua = scura perché assorbe tutto l'infrarosso 

#Exercise = calsulate a PCA on the image
?rasterPCA
rasterPCA(siml)
simlpca <- rasterPCA(siml)
simlpca
#console
#$call
#rasterPCA(img = siml)
#$model
#Call:
#  princomp(cor = spca, covmat = covMat[[1]])
#Standard deviations:
#  Comp.1   Comp.2   Comp.3   Comp.4 
#77.33628 53.51455  5.76560  0.00000 
#4  variables and  633612 observations.
#$map
#class      : RasterBrick 
#dimensions : 794, 798, 633612, 4  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 798, 0, 794  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      :       PC1,       PC2,       PC3,       PC4 
#min values : -227.1124, -106.4863,  -74.6048,    0.0000 
#max values : 133.48720, 155.87991,  51.56744,   0.00000 
#attr(,"class")
#[1] "rasterPCA" "RStoolbox"

#abbiamo la $call = funzione, $modello, $mappa 
#$call
#$model
#$map

#Exercise: view how much variance is explainde by each PC
#visualizza quanta varianza viene spiegata da ciascun PC

#fare un summary del modello 
?summary
#spiegazione 
summary(simlpca$model)
#console 
#Importance of components:
#  Comp.1     Comp.2      Comp.3
#Standard deviation     77.3362848 53.5145531 5.765599616
#Proportion of Variance  0.6736804  0.3225753 0.003744348
#Cumulative Proportion   0.6736804  0.9962557 1.000000000
#Comp.4
#Standard deviation          0
#Proportion of Variance      0
#Cumulative Proportion       1

#la prima componente spiega solo il 77%
#prime due il 99% insieme
#sono solo le prime tre

#le visualizziamo con il ggplot
#mettere la libreria
library(viridis)
ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC1)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC1")

#bomba di mappa
#mappa originale = applichiamo la PCA e applichiamo la prima componente
#i valori + alti = vegetale 
#valori + bassi = in altre zone 
#tanta informazione

#proviamo a plottare l'immagine numero 3 
#spiegava da solo solo 0.03% di proporzione della variabilità totaòe 
ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC3)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("PC3")
#tanto rumore 
#molta meno informazione rispetto al PC1
ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC3)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC3")

#plottiama accianto all'altra
#con library 
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
#la 1 rispetto alla 3
#1 = informazione 

#ora inseriamo anche la seconda componente
#Exercise: insert the second component in the graph
g2 <- ggplot() + 
  geom_raster(simlpca$map, mapping =aes(x=x, y=y, fill=PC2)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("PC2")
g1 + g2 + g3
#1 = 77%
#2 = 30% circa = anche questa ha molto informazione
#le varie componenti non sono mai correlate tra di loro 


#facciamo il calcolo della variabilità
#let's calculate variability
#creiamo un nuovo oggetto 
pc1 <- simlpca$map[[1]]

sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
#applico una finestra mobile di 3*3
sd3
#console
#class      : RasterLayer 
#dimensions : 794, 798, 633612  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 798, 0, 794  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : layer 
#values     : 0, 17.61334  (min, max)

#plottiamo 
plot(sd3)

#ora facciamo un plot con ggplot
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "inferno") +
  ggtitle("Standard deviation of PC1")

#la mappa di più alta variabilità possibili
#indica qui punti dove c'è una discontinuità più forte 
#dove ci sono i crepacci, variazioni di un tipo generale e un altro
#più è di + sulla parte geomorfologica

#la volta scorsa abbiamo utilizzato la banda dell'infrarosso
#per fare il calcolo
#questa volta come tutte quelle volte nelle quali possiamo utilizzare 
#una sola variabile = una sola banda 
#questa volta abbiamo utilizzato la PC1

#questi metodi di analisi multivariata servono proprio per compattare
#dati = quindi li possiamo applicare anche da dati tabellari di qualsiasi natura
#c'è un pacchetto che si chiama VEGAN 
#e ordinano i dati 

#libro = numerical ecology





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
