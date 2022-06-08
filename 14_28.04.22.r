#14
#28.04.22
#classificazione = creare mappe di Land Cover
#land cover = tutto quello che copre il terreno di vegetazione o
#di natura urbana 

#ripasso scorsa volta

#richiamato i pacchetti 
library(raster) #comune
library(RStoolbox) #classificazioni
library(ggplot2) #grafica
library(patchwork) #ggRGB = con assegnazione oggetto 
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")

#inserito due immagini = infrarosso nella componente verde
brick("defor1_.jpg") 
l92 <- brick("defor1_.jpg")
l92
plotRGB(l92, 1, 2, 3, stretch= "lin")
brick("defor2_.jpg")
l06 <- brick("defor2_.jpg")
l06
plotRGB(l06, 1, 2, 3, stretch= "lin")

#multiframe con ggRGB = con la library(ggplot2)
ggRGB(l92, 1, 2, 3, stretch = "lin")
ggRGB(l06, 1, 2, 3, stretch = "lin")
#library(patchwork) = #ggRGB = con assegnazione oggetto 
ggRGB(l92, 1, 2, 3, stretch = "lin")
p1 <- ggRGB(l92, 1, 2, 3, stretch = "lin")
p1
ggRGB(l06, 1, 2, 3, stretch = "lin")
p2 <- ggRGB(l06, 1, 2, 3, stretch = "lin")
p2
p1 + p2
p1/p2

#mappe
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

#frequenza
?freq
#in totale 342726 
freq(l92c$map)
#value  count
#[1,]     1  36799 = agricola
#[2,]     2 304493 = foresta
freq(l06c$map)
#value  count
#[1,]     1 179246 = foresta
#[2,]     2 163480 = agricola 
#dai numeri si capisce come è cambiata nel tempo 

#1992
tot92 <- 342192
#proporzione
prop_forest_92 <- 304493 / tot92
prop_forest_92
#[1] 0.8898309
#con %
perc_forest_92 <- 304493 * 100 / tot92
perc_forest_92
#[1] 88.98309 = 89%

#exercise: calculate the percentage of agricultural areasin 1992
#percentuale agricolo 92
#tanti modi 
#1. metodo
perc_agr_92 <- 100 - perc_forest_92
perc_agr_92
#[1] 11.01691

#2. metodo
perc_agr_92_2 <- 36799 * 100 / tot92
perc_agr_92_2
#[1] 10.7539
#i due metodi non mi vengono uguali 

#percent_forest_92 = 88.98309
#percent_agr_92 = 11.01691


#percentuale 2006
tot_06 <- 342726
percent_forest_06 <- 179246 * 100 / tot_06
percent_forest_06
# [1] 52.30009

percent_agr_06 <- 100 - percent_forest_06
percent_agr_06
#[1] 47.69991
#percent_forest_06 = 52.30009
#percent_agr_06 = 47.69991

#differenza tra 1992 e 2006
#percent_forest_92 = 88.98309
#percent_agr_92 = 11.01691
#percent_forest_06 = 52.30009
#percent_agr_06 = 47.69991
#valori differenti da ciascuno di noi 

#dati finali 
#FINAL DATA:
#percent_forest_92 = 88.98309 = 88.98
#percent_agr_92 = 11.01691 = 11.02
#percent_forest_06 = 52.30009 = 52.30
#percent_agr_06 = 47.69991 = 47.70

#jamboard [1]

#possibilità di creare un dataframe [una tabella]
#con 3 colonne = campo
#1 colonna = classe ==> class = forest e agricultur
#2 colonna = valori percentuali del 1992 ==> %92
#3 colonna = valori percentuali del 2006 ==> %06

#mettere sempre il punto non le virgole 

#let's build a dataframe with our data
#= costruiamo un dataframe con i nostri dati
#columns (fields) = campi 
#class <- Forest, Agriculture #2 elementi dello stesso gruppo = vettore o arrey
#"_" perchè è un testo #evitare simboli
class <- c("Forest, Agriculture") 
percent_1992 <- c(88.98309, 11.01691)
percent_2006 <- c(52.30009, 47.69991)
#dichiarato colonne
#ora creare tabella = database = tabella = dataframe 
?data.frame
#data.frame e nome delle colonne della tabella
#data.frame(class, percent_1992, percent_2006)
#assocciamo a un nome
multitemporal <- data.frame(class, percent_1992, percent_2006)
#analisi multitemporale che conduce alla tabella 
multitemporal
#console
#                class percent_1992 percent_2006
#1 Forest, Agriculture     88.98309     52.30009
#2 Forest, Agriculture     11.01691     47.69991

#valori in formato tabella 
#con la funzione View
View(multitemporal)
#tabella

#fare il grafico 
#funzione di ggplot2
#su google = ggplot2 histagram
?ggplot
#aes = aesthetics  

ggplot(multitemporal, aes(x = class, y = percent_1992, color = class)) + geom_bar(stat = "identity", fill = "white")

#plot = a barre = 2 istogrammi = bar charts 
#a me non viene uguale al prof su RStudio 
#ma su R viene

#exercise: make the same graph for 2006 = stesso grafico per il 2006
ggplot(multitemporal, aes(x = class, y = percent_2006, color = class)) + geom_bar(stat = "identity", fill = "white")


#analisi in cui abbiamo visto come varia la 5 di agricoltura e di foresta 
#nel tempo 
#2006 = circa al 50%

#fare il pdf = viene salvato nel lab
#1992
pdf("percentages_1992.pdf")
ggplot(multitemporal, aes(x = class, y = percent_1992, color = class)) + geom_bar(stat = "identity", fill = "white")
dev.off()
#2006
pdf("percentages_2006.pdf")
ggplot(multitemporal, aes(x = class, y = percent_2006, color = class)) + geom_bar(stat = "identity", fill = "white")
dev.off()






##########################################
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


#domani riprendiamo 
#installare il pacchetto viridis
install.packages("viridis")
#?viridis
#serve a creare colorazioni con legende che hanno già dei nomi 
library(viridis)





#14
#28.04.22
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
brick("defor1_.jpg") 
l92 <- brick("defor1_.jpg")
l92
plotRGB(l92, 1, 2, 3, stretch= "lin")
brick("defor2_.jpg")
l06 <- brick("defor2_.jpg")
l06
plotRGB(l06, 1, 2, 3, stretch= "lin")
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
tot92 <- 342192
prop_forest_92 <- 304493 / tot92
prop_forest_92
perc_forest_92 <- 304493 * 100 / tot92
perc_forest_92
perc_agr_92 <- 100 - perc_forest_92
perc_agr_92
perc_agr_92_2 <- 36799 * 100 / tot92
perc_agr_92_2
tot_06 <- 342726
percent_forest_06 <- 179246 * 100 / tot_06
percent_forest_06
percent_agr_06 <- 100 - percent_forest_06
percent_agr_06
class <- c("Forest, Agriculture") 
percent_1992 <- c(88.98309, 11.01691)
percent_2006 <- c(52.30009, 47.69991)
?data.frame
multitemporal <- data.frame(class, percent_1992, percent_2006)
multitemporal
?ggplot
ggplot(multitemporal, aes(x = class, y = percent_1992, color = class)) + geom_bar(stat = "identity", fill = "white")
ggplot(multitemporal, aes(x = class, y = percent_2006, color = class)) + geom_bar(stat = "identity", fill = "white")
pdf("percentages_1992.pdf")
ggplot(multitemporal, aes(x = class, y = percent_1992, color = class)) + geom_bar(stat = "identity", fill = "white")
dev.off()
pdf("percentages_2006.pdf")
ggplot(multitemporal, aes(x = class, y = percent_2006, color = class)) + geom_bar(stat = "identity", fill = "white")
dev.off()
install.packages("viridis")
library(viridis)
