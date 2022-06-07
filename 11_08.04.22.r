#11
#08.03.22
#tutti i codici della scorsa volta

#oggi andiamo a utilizzare una funzione che serve per utilizzare codice
#che deriva da altre fonti 
#scritto su git hub poi R
?source
#prendere file salvare e lo richiamiamo da r direttamente senza aprirlo
#su git hub codice a disposizione 
library(raster)
#facciamo il settaggio 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/EN")
#poi carichiamo l'immagine 
en <- raster("EN_0001.png")
#plot
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en01, col = cl)

#ora mettiamo tutto in un editor di testo 
#es. blocco note 
#e simuliamo un codice che ci arriva da un collega

#salvato nella cartella di lab 
#come R_inputcode.R
#evitare.doc

#andiamo su R 
#fare solo il settaggio della working directory 
#con lab solo 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#jamboard [1]

#la funzione è source
#exercise: use source function and upload the code
#funzione source e mettere il nome del file
source("R_inputcode.r")
#viene fuori l'immagine = solo scrivendo source
#con una sola riga di codice abbiamo tutto il codice



#########################################
#ora rimportiamo i dati e facciamo un plot di RGB di 3 immagini dei dati 
#che abbiamo a disposizione
#dati si possono anche importare
#con una list.files con vari file
#funzione lapply alla lista
#e poi un altra funzione con raster
#e unire tutti insieme che si chiama stack
list.files(pattern = "EN")
rlist <- list.files(pattern = "EN")
rlist
lapply(rlist, raster)
rimp <- lapply(rlist, raster)
rimp
stack(rimp)
en <- stack(rimp)
en
#plot di tutto lo stack
plot(en, col = cl)

#visualizziamo tutte le immagini 


#ora facciamo un plotRGB con 3 file insieme
#plotRGB of three files together
?plotRGB

#jamboard [2]
#R = [[1]]
#G = [[7]]
#B = [[13]]
plotRGB(en, r = 1, g = 7, b = 13, stretch = "lin")
plotRGB(en, r = 1, g = 7, b = 13, stretch = "hist")
#si vedono nelle immagini dove abbiamo messo i colori 
#rosso = gennaio, verde = febbraio e blu = marzo 
#anche più bande insieme 


#finito la parte di time series



#####################################
#Classificazione dei minerali del Gran Canyon
#classifichiamo gli oggetti per vedere se si riesce a vedere arbusti, alberi, 
#zone agricole,...

#è possibile vederli attraverso metodi automatici di classificazione 
#delle immagini 
#l'immagine satellitare [reg 1 08.04.22 = minuti 42]
#rappresenta la parte delle Alpi Monti dei Sililao = trovato un oggetto 
#otzi = nel ghiaccio di Sililao = Trento 
#la neve = verde
#prateria sommitali = blu 
#ambiente seminaturali e boschi = verde scuro 
#ambiente urbani = viola

#tutti questi ambienti 
#come si dispongono questi pixel in uno spazio spettrale 

#jamboard [3]

library(raster)
#installare il pacchetto RStoolbox
install.packages("RStoolbox")
library(RStoolbox)
#RStoolbox = ar es tool box
#Tools for Remote Sensing Data Analysis
#Strumenti per l'analisi dei dati di telerilevamento
?RStoolbox

#scaricare immagini da Virtuale 
#satellite Solar orbiter = prende immagini dal sole 
#risposte su come si sta comportando il sole 
#già immagini lavorate
#gas con diversi livelli energetici
#zone gialle intense = energia maggiore 
#zone più scura = energia minore 

#git hub 
#classificazione 

#salvata dentro la cartella lab 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#quindi a classificare questa immagine 
#recuperiamo questa immagine 
#molto lungo il nome perché così posso andarla a rintracciare 
#messa in lab 
#il nome è Solar_Orbiter_s_first_views_of_the_Sun_pillars

#importare immagine 
#è un RGB 
#non conosciamo le lunghezze d'onda le importiamo dentro a R
#funzione BRICK
#data import
brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#diamo il nome so = solar orbiter
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
#nella console 
#class      : RasterBrick 
#dimensions : 1157, 1920, 2221440, 3  (nrow, ncol, ncell, nlayers)
#resolution : 1, 1  (x, y)
#extent     : 0, 1920, 0, 1157  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg 
#names      : Solar_Orbiter_s_first_views_of_the_Sun_pillars.1, Solar_Orbiter_s_first_views_of_the_Sun_pillars.2, Solar_Orbiter_s_first_views_of_the_Sun_pillars.3 
#min values :                                                0,                                                0,                                                0 
#max values :                                              255,                                              255,                                              255 
#sono 3 bande
#8 BIT

#faccio un plotRGB
plotRGB(so, r = 1, g = 2, b = 3, stretch ="lin")
#proviamo anche con lo stretch non lineare
plotRGB(so, r = 1, g = 2, b = 3, stretch ="hist")
#meno colore
#meglio con lin
#dato da cui partiamo 
#si vedono i colori di livello scuro chiaro e intermedio
#usiamo l'intelligenza artificiale o machine learning
#la macchina impara e capisce delle cose 
#in questo caso 
#impara a classificare l'immagine sulla base di come si sono disposti i pixel 
#nello spazio multidimensionale in termini spettrali 
#3 dimensioni 

#jamboard [4]

#funzione 
?unsuperClass
#classifica l'immagine con questo numero di immagini 
#unsuperClass(
#  img,
#  nSamples = 10000,
#  nClasses = 5,
unsuperClass(so, nClasses = 3)
soc <- unsuperClass(so, nClasses = 3)
soc
#nella console
#unsuperClass results
#*************** Model ******************
#  $model
#K-means clustering with 3 clusters of sizes 3734, 4153, 2113
#Cluster centroids:
#  Solar_Orbiter_s_first_views_of_the_Sun_pillars.1
#1                                         54.30905
#2                                        128.67855
#3                                        219.63038
#Solar_Orbiter_s_first_views_of_the_Sun_pillars.2
#1                                         38.76888
#2                                         96.52902
#3                                        173.84619
#Solar_Orbiter_s_first_views_of_the_Sun_pillars.3
#1                                         8.891537
#2                                        29.716831
#3                                        69.154756
#Within cluster sum of squares by cluster:
#  [1] 3830956 3811778 4784362
#*************** Map ******************
#  $map
#class      : RasterLayer 
#dimensions : 1157, 1920, 2221440  (nrow, ncol, ncell)
#resolution : 1, 1  (x, y)
#extent     : 0, 1920, 0, 1157  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : memory
#names      : class 
#values     : 1, 3  (min, max)

#abbiamo fatto il nostro primo modello 
#unico output è la mappa 
#abbiamo operato la classificazione 
#e abbiamo creato un output = soc che ha all'interno una mappa
#come si fa a collegare la mappa con il dato soc ==> con $
#mappa = valori da 1 a 3 = sono le classi 

#plottiamo i risultati con soc
cl <- colorRampPalette(c("yellow", "black", "red")) (100)
plot(soc$map, col = cl) 
#essendo un modello ci vuole la mappa 

#mappa ottenuta 1, 2 e 3 
#classe 1, 2 e 3 
#zona centrale che è quella più scura = rossa
#zona intermedia = nera
#zona gialla = più alta energia 

#ognuno di noi ha ottenuto una mappa diversa 
#prima uniamo tutto poi 
#lo prende l'algoritmo


#questa è uguale a quella del prof
cl <- colorRampPalette(c("red", "yellow", "black")) (100)
plot(soc$map, col = cl) 

?set.seed
#set.seed()
#con un numero = prende prende sempre lo stesso

#mappa con 3 livelli energetici del sole 


#08.04.22
?source
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab/EN")
en <- raster("EN_0001.png")
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot (en01, col = cl)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
source("R_inputcode.r")
list.files(pattern = "EN")
rlist <- list.files(pattern = "EN")
rlist
lapply(rlist, raster)
rimp <- lapply(rlist, raster)
rimp
stack(rimp)
en <- stack(rimp)
en
plot(en, col = cl)
?plotRGB
plotRGB(en, r = 1, g = 7, b = 13, stretch = "lin")
plotRGB(en, r = 1, g = 7, b = 13, stretch = "hist")
library(raster)
install.packages("RStoolbox")
library(RStoolbox)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
plotRGB(so, r = 1, g = 2, b = 3, stretch ="lin")
plotRGB(so, r = 1, g = 2, b = 3, stretch ="hist")
?unsuperClass
unsuperClass(so, nClasses = 3)
soc <- unsuperClass(so, nClasses = 3)
soc
cl <- colorRampPalette(c("yellow", "black", "red")) (100)
plot(soc$map, col = cl) 
cl <- colorRampPalette(c("red", "yellow", "black")) (100)
plot(soc$map, col = cl) 
?set.seed


