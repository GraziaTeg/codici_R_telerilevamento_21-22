#22
#03.06.22
#modelli di distribuzioni di specie 
#realizzare variabili in funzioni di altre variabili 
#dati di distribuzione 
#dati a terra + dati vintuali = distribuzione specie nello spazio 
#scopi prevedere e capire com'è la distribuzione 
#pacchetto che si chiama sdm 

#R code for specie distribution modelling
#Codice R per la modellazione della distribuzione delle specie
#installiamo il pacchetto sdm
install.packages("sdm")
install.packages("rgdal", dependencies = T)
#pacchetti 
#raster = dobbiamo gestire dei dati spaziali e geografici
library(raster)#predictors
library(rgdal) 
library(sdm) #specie
library(ggplot2)
library(patchwork)
library(viridis)

#?rgdal #= libreria 
#non utiliziamo il file della woking directory
#ma un file sistem direttamente dalla libreria
?system.file
file <- system.file("external/species.shp", package="sdm") 
#nella cartella external con file species 
file
#console 
#fa vedere il percorso 
#[1] "C:/Users/grazi/AppData/Local/R/win-library/4.2/sdm/external/species.shp"
?shapefile
species <- shapefile(file)
species
#console
#class       : SpatialPointsDataFrame 
#features    : 200 
#extent      : 110112, 606053, 4013700, 4275600  (xmin, xmax, ymin, ymax)
#crs         : +proj=utm +zone=30 +datum=WGS84 +units=m +no_defs 
#variables   : 1
#names       : Occurrence 
#min values  :          0 
#max values  :          1 
#SpatialPointsDataFrame = punti nello spazio 
#ce ne sono 200
#Occurrence = presenza o assenza di una certa specie 

plot(species)
#vediamo dei punti nello spazio 
#cambiamo carattere = 19 punti chiusi 
plot(species, pch=19)

#facciamo un plot con le presenze o assenze
#con nome occurrence
species$Occurrence
#i 200 valori di 0 e 1
#[1] 1 0 1 1 1 0 0 1 1 1 1 1 1 0 1 1 0 1 1 0 0 1
#[23] 0 1 1 0 1 0 1 0 1 0 1 1 1 1 0 1 0 0 0 0 0 0
#[45] 0 1 0 0 1 0 1 0 0 0 0 0 1 1 1 1 0 0 1 0 1 0
#[67] 1 1 1 1 0 0 0 0 0 1 0 0 1 0 1 0 1 1 1 0 0 1
#[89] 1 0 0 1 1 1 1 0 0 0 0 0 0 0 1 1 1 0 0 1 1 0
#[111] 0 0 1 0 0 1 1 1 1 1 0 0 0 1 1 0 0 1 1 1 1 1
#[133] 0 0 0 1 0 0 1 1 0 1 0 1 0 0 1 1 0 0 1 0 0 1
#[155] 1 0 0 0 0 1 1 1 0 0 0 0 1 0 0 1 0 1 0 0 0 0
#[177] 1 0 1 0 1 0 1 0 0 0 0 1 1 0 1 0 1 1 0 1 0 0
#[199] 0 0

#plottiamo il database specie 
#subset = []
#vogliamo solo dove compare 1
occ <- species$Occurrence
#lo assegnamo a un oggetto 
#uguale ==
plot(species[occ == 1,], col="blue", pch=19)
#vengono fuori solo i 1 con i colori blu

#uniamo i punti uguale a 0 = li aggiungiamo con il points
points(species[occ == 0,], col="red", pch=19)
#con points ho aggiunto 
#1 = presenze = blu = dove ho visto la specie 
#2 = assenze = rosso 

#andiamo a vedere i predittori [fattori climatici]
#facciamo una lista di file, con un certo pattern

#jamboard [1]

#1. mettere il path = percorso 
path <- system.file("external", package="sdm")
path
#[1] "C:/Users/grazi/AppData/Local/R/win-library/4.2/sdm/external"
#estensione .asc

#list the predictors
list.files(path=path, pattern='asc', full.names=T)
lst <- list.files(path=path, pattern='asc', full.names=T)
lst
#console
#[1] "C:/Users/grazi/AppData/Local/R/win-library/4.2/sdm/external/elevation.asc"    
#[2] "C:/Users/grazi/AppData/Local/R/win-library/4.2/sdm/external/precipitation.asc"
#[3] "C:/Users/grazi/AppData/Local/R/win-library/4.2/sdm/external/temperature.asc"  
#[4] "C:/Users/grazi/AppData/Local/R/win-library/4.2/sdm/external/vegetation.asc" 

#full.names is needed in case you want to maintain the whole
#path in the name of the file 
#full.names è necessario nel caso in cui desideri 
#mantenere l'intero percorso nel nome del file

stack(lst)
#class      : RasterStack 
#dimensions : 71, 124, 8804, 4  (nrow, ncol, ncell, nlayers)
#resolution : 4219.223, 4219.223  (x, y)
#extent     : 100975.3, 624159, 3988830, 4288395  (xmin, xmax, ymin, ymax)
#crs        : NA 
#names      : elevation, precipitation, temperature, vegetation 
#importato 4 stack 

#plottiamo con una colorRampPalette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
preds <- stack(lst)
plot(preds, col=cl)

#4 bande = con elevation, precipitation, temperature, vegetation

# plot of predictors with presences
elev <- preds$elevation
prec <- preds$precipitation
temp <- preds$temperature
vege <- preds$vegetation

#plot con le presenze 
#elevation
plot(elev, col=cl)
points(species[occ == 1,], pch=19)

#tempemperature
plot(temp, col=cl)
points(species[occ == 1,], pch=19)

#precipitation
plot(prec, col=cl)
points(species[occ == 1,], pch=19)

#vegetation
plot(vege, col=cl)
points(species[occ == 1,], pch=19)

#MODEL
#dati
#dichiarare quali sono i dati del modellino sdm
#specie + predittori 
?sdmData
#train = dati a terra
#predittori = quali sono
datasdm <- sdmData(train=species, predictors=preds)
datasdm
#console
#class                                 : sdmdata 
#=========================================================== 
#  number of species                     :  1 
#species names                         :  Occurrence 
#number of features                    :  4 
#feature names                         :  elevation, precipitation, temperature, ... 
#type                                  :  Presence-Absence 
#has independet test data?             :  FALSE 
#number of records                     :  200 
#has Coordinates?                      :  TRUE 

?sdm
#alt + 126 = ~
sdm(Occurrence ~ elevation + 
      precipitation + temperature + vegetation, data=datasdm, methods="glm")
m1 <- sdm(Occurrence ~ elevation + 
      precipitation + temperature + vegetation, data=datasdm, methods="glm")
m1
#console 
#class                                 : sdmModels 
#======================================================== 
#  number of species                     :  1 
#number of modelling methods           :  1 
#names of modelling methods            :  glm 
#------------------------------------------
#  model run success percentage (per species)  :
#  ------------------------------------------
#  method          Occurrence       
#---------------------- 
#  glm        :        100   %
#
###################################################################
#model performance (per species), using training test dataset:
#  -------------------------------------------------------------------------------
#  ## species   :  Occurrence 
#  =========================
#  methods    :     AUC     |     COR     |     TSS     |     Deviance 
#-------------------------------------------------------------------------
#  glm        :     0.88    |     0.7     |     0.69    |     0.83  

#andiamo a fare la predisione 
?predict 
#Model Predictions
predict(m1, newdata=preds)
p1 <- predict(m1, newdata=preds)
p1
#console
#file raster
#class      : RasterLayer 
#dimensions : 71, 124, 8804  (nrow, ncol, ncell)
#resolution : 4219.223, 4219.223  (x, y)
#extent     : 100975.3, 624159, 3988830, 4288395  (xmin, xmax, ymin, ymax)
#crs        : NA 
#source     : sdm_prediction_bshzln.grd 
#names      : id_1.sp_1.m_glm 
#values     : 0.00376331, 0.9957391  (min, max)
#fullname   : id_1-species_Occurrence-method_glm 

#plottiamo = output
plot(p1, col=cl)
#aggiungiamo il points
points(species[occ == 1,], pch=19)

#mappa di previsione della nostra previsione della specie 
#nei punti = ci c'è la specie a terra

#par
par(mfrow=c(2,3))
plot(p1, col=cl) #predict
plot(elev, col=cl)
plot(prec, col=cl)
plot(temp, col=cl)
plot(vege, col=cl)
#nostro modello rispetto a tutti i parametri 


#alternative #2
final <- stack(preds, p1)
plot(final, col=cl)
#mette anche i nomi 





##########################
#22
#03.06.22
install.packages("sdm")
install.packages("rgdal", dependencies = T)
library(raster)
library(rgdal) 
library(sdm)
library(ggplot2)
library(patchwork)
library(viridis)
?system.file
file <- system.file("external/species.shp", package="sdm") 
file
?shapefile
species <- shapefile(file)
species
plot(species)
plot(species, pch=19)
species$Occurrence
occ <- species$Occurrence
plot(species[occ == 1,], col="blue", pch=19)
path <- system.file("external", package="sdm")
path
list.files(path=path, pattern='asc', full.names=T)
lst <- list.files(path=path, pattern='asc', full.names=T)
lst
stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
preds <- stack(lst)
plot(preds, col=cl)
elev <- preds$elevation
prec <- preds$precipitation
temp <- preds$temperature
vege <- preds$vegetation
plot(elev, col=cl)
points(species[occ == 1,], pch=19)
plot(temp, col=cl)
points(species[occ == 1,], pch=19)
plot(prec, col=cl)
points(species[occ == 1,], pch=19)
plot(vege, col=cl)
points(species[occ == 1,], pch=19)
?sdmData
datasdm <- sdmData(train=species, predictors=preds)
datasdm
?sdm
sdm(Occurrence ~ elevation + 
      precipitation + temperature + vegetation, data=datasdm, methods="glm")
m1 <- sdm(Occurrence ~ elevation + 
            precipitation + temperature + vegetation, data=datasdm, methods="glm")
m1
?predict 
predict(m1, newdata=preds)
p1 <- predict(m1, newdata=preds)
p1
plot(p1, col=cl)
points(species[occ == 1,], pch=19)
par(mfrow=c(2,3))
plot(p1, col=cl) 
plot(elev, col=cl)
plot(prec, col=cl)
plot(temp, col=cl)
plot(vege, col=cl)
final <- stack(preds, p1)
plot(final, col=cl)
