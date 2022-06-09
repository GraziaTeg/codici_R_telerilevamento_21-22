#15
#29.04.22

#misura della variabilità nello spazio
#andare a misurare dei pather spaziali 
#misurata dal satellite 

#andiamo a vedere i dati e i codici 
#utilizziamo dei dati che riguardano il ghiacciaio del Similaun 
#tra Trento e Bolzano 
#4/5 classi evidenti 
#rosso chiaro = prateria sommitali montane
#rossa = boschi misti di conifere e latifoglie
#grigio = roccia 
#nera = acqua 
#bianca = innevata
#misurare qual è la variabilità interna della stessa immagine 
#sia da un punto di vista geologico (crepacci, vari tipi di roccia,...)
#sia da un punto di vista ecologico (all'interno del bosco, + specie animale, 
#+ specie)
#sensore sentinel = lanciato dall'esa 
#con risoluzione di 10 m a terra 
#immagini già elaborata 
#si può utilizzare l'infrarosso 

#nella zona del Similaun, abbimao 2 pater di interesse [configurazione]
#1. variazioni che ci sono nella roccia = crepacci,... = variazioni geologiche
#2. variazioni ecologiche = da un tipo di praterie sommitali ai boschi

#git hub
#R_code_variability

#scaricare immagine in lab = sentinel.png

library(raster) 
library(RStoolbox) #for image viewing and variability calculation 
#per la visualizzazione delle immagini e il calcolo della variabilità
library(ggplot2) #for ggplot plotting

setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#jamboard [1]

#Exercise: import the Similaun image = importare l'immagine di Similaun 
#sentinel = lanciato tra il 2010 e 2020, nel 2016 già operativo ma con 
#immagini disperse = oggi sta andando bene = 10m 

brick("sentinel.png")
sen <- brick("sentinel.png")
sen
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

#4 bande disponibili 

#Exercise: plot the image by the ggRGB function = con funzione ggRGB
#plottiamo con infrarosso [1 banda] = nella componente 1
ggRGB(sen, 1, 2, 3, stretch = "lin")
#con ggRGB = possiamo anche non mettere lo stretch [possiamo utilizzare + valori]
ggRGB(sen, 1, 2, 3)

#ora infrarosso nella componente green 
ggRGB(sen, 2, 1, 3)
#diventa verde e viola 
#si vede bene le parti di bosco, crepacci, nevi

#Exercise: plot the two graphs one beside the other = uno accanto all'altro 
#con il pacchetto patchwork
#possiamo unire questi due grafici
library(patchwork)
#plottarli uno accanto all'altro 
#ggRGB(sen, 1, 2, 3)
#ggRGB(sen, 2, 1, 3)
ggRGB(sen, 1, 2, 3)
g1 <- ggRGB(sen, 1, 2, 3)
g1
ggRGB(sen, 2, 1, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g2
g1 + g2 

#abbiamo bisogno di un livello per calcolare la variabilità
#facciamo passare su uno strato che scegliamo una finestra mobile = si sposta
#lungo tutto l'immagine e fa il calcolo che noi vogliamo 

#jamboard [2]

#la funzione si chiama focal
#per fare un calcolo dalle media
?focal
#su una singola variabile = dei vari layer ne dobbiamo scegliere 1
#NIR oppure indice spettrale [NDVI]

#calculation of variability over NIR 
#= calcolo della variabilità rispetto al NIR
nir <- sen[[1]]
nir
#prima banda 
#console 
#class      : RasterLayer 
#band       : 1  (of  4  bands)
#dimensions : 794, 798, 633612  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 798, 0, 794  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : sentinel.png 
#names      : sentinel.1 
#values     : 0, 255  (min, max)
#faccio il plot nir
plot(nir)
#prima banda delle 4
#c'è tanta variabilità 
#NIR = la vegetazione ha riflettanza diverse la roccia, l'acqua,...diverse nel NIR
#banda buona per fare le stime del variabilità 

#selezionato singolo strato 

#funzione focal in 
#?focal
#= immagine per calcolare la variabilità è NIR e poi mettere la matrice

#jamboard [3]

#definiamo la matrice = è formata da 3 per 3 pixel = 1 su 9 pixel  
#funzione = fun = è la deviazione standard
focal(nir, matrix(1/9, 3, 3), fun = sd)
sd3 <- focal(nir, matrix(1/9, 3, 3), fun = sd)
#sd = standard deviation
sd3
#faccio il plot
plot(sd3)

#abbiamo fatto una colorRampPalette
clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown", "red", "yellow")) (100)
plot(sd3, col = clsd)

#luoghi a più bassa variabilità 
#ci aspettiamo che siano quelli con roccia compatta (senza crepacci = blu)
#quelli con acqua 
#quelli con variabilità alta = bordi = rossi = zona a più alta variabilità
#la neve = molto compatta crepacci molto forti 
#tra crepaccio = tra roccia e ombra 

#installo in pacchetto viridis
install.packages("viridis")
library(viridis)
#facciamo il plot con ggplot 
#e vidivis
#il ggplot delle immagini = del singolo raster = un pò più complesso del ggRGB
#ggplot = come funzione apre solo un plot vuoto
#ggplot = che apre al suo interno un ggplot vuoto 
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer))
#geom_raster = quadrati = una serie di pixel 
?geom_raster
#immagine = sd
#estretic = aes = sono la x, la y e il colore che vogliamo dare 
#in questo caso essendo un raster dobbiamo inserire un argomento = mapping

#si vedono benissimo i crepacci = zone chiare
#zone di variazione = linee di demarcazione tra bosco e prateria 

#andiamo a vedere altre colorazioni 
#il pacchetto viridis
?viridis
#https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
#l'idea è che alcuni codici non possono essere visualizzati da tante persone 
#per esempio i daltonici = creare legende che sono create per vederli tutti 
#legente usate molto è la legenda viridis, vividis, magna 
#andiamo a provarle = è quella di vivridis 
#con la funzione che si chiama
#scale_fill_viridis()
#lo aggiungiamolo al ggplot
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("Standard deviation by viridis")

#funziona ma bisogna richiamare il pacchetto viridis
#ggtitle = gli diamo un titolo
#ggplot = dove le zone a più alta variabilità sono di quel colore giallo chiaro 
#zone di transizione tra foresta e prateria


#per cambiare la legenda 
#dentro alla ggplot mettiamo una funzione che si chiama 
#u*saiamo cividis = con la funzione cividis
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("Standard deviation by viridis")

#cambiato legenda 
#simile ma diminuisce la gamma dei colori scuri 

#oppure magma 
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "magma") +
  ggtitle("Standard deviation by viridis")

#magma = frutta anche i colori intermedi 

#noi abbiamo utilizzato la finestra 3*3 = possiamo anche aumentare
#la finestra come 5*5, 7*7, 9*9,...

#exercise: make the same calculation with a 7x7 window = 
#fare lo stesso calcolo con una finestra 7x7
#7 * 7 = 49
#sd = deviazione standard

#jamboard [4]

#il problema è che non si mette la FUNZIONE COME L'OGGETTO 
#sd = sd 
#ora correggere tutto il nome con sd3 tranne nella fun sd

#riprendiamo prossima volta




#15
#28.04.22
library(raster) 
library(RStoolbox) 
library(ggplot2) 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("sentinel.png")
sen <- brick("sentinel.png")
sen
ggRGB(sen, 1, 2, 3, stretch = "lin")
ggRGB(sen, 1, 2, 3)
library(patchwork)
ggRGB(sen, 1, 2, 3)
g1 <- ggRGB(sen, 1, 2, 3)
g1
ggRGB(sen, 2, 1, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g2
g1 + g2
?focal
nir <- sen[[1]]
nir
plot(nir)
?focal
focal(nir, matrix(1/9, 3, 3), fun = sd)
sd3 <- focal(nir, matrix(1/9, 3, 3), fun = sd)
sd3
plot(sd3)
clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown", "red", "yellow")) (100)
plot(sd3, col = clsd)
#install.packages("viridis")
library(viridis)
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer))
?viridis
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "cividis") +
  ggtitle("Standard deviation by viridis")
ggplot() + 
  geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis(option = "magma") +
  ggtitle("Standard deviation by viridis")
