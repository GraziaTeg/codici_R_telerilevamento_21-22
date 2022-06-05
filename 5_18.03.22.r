#18.03.22

#codici precedenti 
library(raster)
setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
#?brick
brick("p224r63_2011.grd")
l2011 <- brick("p224r63_2011.grd")
l2011
#?plot
plot(l2011)
?colorRampPalette
colorRampPalette(c("black", "grey", "light grey")) 
colorRampPalette(c("black", "grey", "light grey")) (100)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col = cl)

l2011 <- brick("p224r63_2011.grd")
l2011

#ora 18.03.22 + github + ripasso
#visualizzazione di immagini satellitari 
#rimandato i codici 
l2011
#class      : RasterBrick 
#dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
#resolution : 30, 30  (x, y)
#extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : p224r63_2011.grd 
#names      :      B1_sre,      B2_sre,      B3_sre,      B4_sre,      B5_sre,       B6_bt,      B7_sre 
#min values :         0.0,         0.0,         0.0,         0.0,         0.0,       295.1,         0.0 
#max values :   1.0000000,   0.2563655,   0.2591587,   0.5592193,   0.4894984, 305.2000000,   0.3692634

#numero di pixel = ncell = per ogni banda 4 milioni di pixel 
#per 7 bande = 28 milioni di pixel di dati 
#risoluzione di 30 per 30 
#partendo da un datum = ellissoide che era WG84 = e diviso in varie zone il pianeta
#la numero 22 = è il Brasile con la proiezione trasversa di mercatore
#varie bande con le riflettanze 
#oggi ci interessano dalla 1 alla 4
#valori minimi sempre 0 = la luce interamente assorbita = tranne banda dell'infrarosso termico 
#valori massimi fino a 1
#quindi range da 0 a 1
#riflettanza = è la divisione tra il flusso radiante che viene riflesso, rispetto
#al flusso incidente 
#= se ho un oggetto che non rifletta per niente (blu) ma l'assorbe tutta = riflettanza = 0
#invece se quella radiazione viene riflessa per tutto (infrarosso) = alta riflettanza
# = energia riflessa rispetto a quella incidente = energia riflessa è tutta quella 
#che arrivava = 1

#cosa sono queste banda dalla 1 alla 4
#Landsat ETM+ [Enhanced Thematic Mapper Plus]
#b1 = blu
#b2 = verde
#b3 = rosso 
#b4 = infrarosso vicino = NIR infrared = vicino alla luce che possiamo vedere

#jamboard [1]
#nelle nostre immagine satellitare = vari pixel = 4 milioni per ogni banda = 
#16 milioni di dati circa 
#con la riflettanza per ogni singola lunghezza d'onda
#es: 
#nella lunghezza d'onda del blu = abbiamo la divisione del paesaggio in tanti pixel 
#poi verde
#poi banda rosso 
#poi infrarosso vicino = che non sappiamo il colore 
#con ogni pixel (in basso a destra) = 
#con riflettanza nel blu -> verde -> rosso -> nel vicino infrarosso 


#possiamo fare un plot con le immagine singole e poi tutte insieme 

#noi abbiamo fatto una colorRampPalette e poi abbiamo plottato tutte le immagini
#satellitari  = tutte le bande con quella colorRampPalette

#ora plottiamo una singola banda

#plot della banda del blu [solo una]
#qual è la prima banda 
#si mette 
l2011
#jamboard [2]
#si va a vedere i nomi della prima banda, in names
#B1_sre = spectral reflectance
#B1_sre
#plot(l2011.....B1_sre)
#qual è il simbolo per legare l'immagine satellitare [l2011] alla banda [B1_sre]
#$ = il dollaro = corda che serve a legare
plot(l2011$B1_sre)
#salvata con r

#un altro modo 
#questa volta andiamo a prendere il primo elemento = 
#e si racchiude in doppia parentesi [[]]
plot(l2011[[1]])
#elemento numero 1 = banda blu 
#mettere il nome o l'elemento = è la stessa cosa = alcune volte 
#è più importante usare il nome e altre volte è più importante usare l'elemento 

#legenda non ci piace rimettiamo la palette di prima 
#colorRampPalette(c("black", "grey", "light grey")) (100)
#3 colori fondamentali "black", "grey", "light grey" = la variazione 
#da un colore ad un altro = 100 --> ci sono 100 variazioni di colore
#che passano da black a light grey

#con anche 
cl <- colorRampPallette(c("black", "grey", "light grey")) (100) 
#quindi prendiamo 
plot(l2011$B1_sre)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre, col = cl) #col = colorare 
#con variazione del colore dal nero al chiaro 

#ora 
#plot del blu = B1
#con la scala di colori che va dal
#dark blu, blu e light blu
#mettiamo noi i nomi dei colori = dark e light possono essere anche staccati
#plot b1 da dark blu a light blu 
l2011
plot(l2011$B1_sre)
clblue <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col = clblue)
#tutto quello che assorbe = blu scuro 
#tutto quello che riflette = blu chiaro 

#se ci sono degli elementi sull'elemento X, in questo caso, è l'immagine

#let's export the image and let it appear in the lab folder: kind of magic
#esportiamo l'immagine e facciamola apparire nella cartella lab: sorta di magia
#la funzione si chiama pdf = es banda1.pdf
#pdf(banda1.pdf) = mancano le "_" perché usciamo da R = path = percorso 
#?pdf
pdf("banda1.pdf")
plot(l2011$B1_sre, col = clblue)

#dev.off() ==> metto come commento

#come facciamo a far capire che vogliamo salvare nella cartella lab
#perchè all'inizio abbiamo settato la cartella di lavoro
#set working directory, con tutto il percorso 
#se lo vogliamo dentro un'altra cartella = cambiando il path mettiamo
#per esempio
#pdf("~/Downloads/banda1.pfd")
#senza specificare il path = percorso va dentro alla cartella lab

#stessa cosa con .png
#?png
png("banda1.png")
plot(l2011$B1_sre, col = clblue)

#dev.off() ==> metto come commento

#questo è per esportare il plot
#per esportare un immagine si sua writeRaster 
#esporta l'intero dataset = intero raster 
#?writeRaster



#ora come plottare più immagini insieme scegliendone quali immagini 
#abbiamo già fatto il plot scegliendo più immagini insieme
#facciamo la banda del blu e del verde 
#prima facciamo una nuova colorRampPalette del verde
#plottiamo la banda numero 2 che è il verde 
#B2_sre
#plot B2 da dark green a green a light green 
l2011
plot(l2011$B2_sre)
clgreen <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col = clgreen)

#salviamo in pdf
pdf("banda2.pdf")
plot(l2011$B2_sre, col = clgreen)
#dev.off() ==> metto come commento
#salviamo in png
png("banda2.png")
plot(l2011$B2_sre, col = clgreen)
#dev.off() ==> metto come commento


#ora le mettiamo insieme quella blu e quella rossa 
#immaginiamo di avere un multiframe 
#jamboard [4]
#è un multiframe = mf
#visto che vogliamo il plot blu di fianco il plot verde 
#abbiamo 1 riga e 2 colonne
#allora abbiamo par(mfrow = 1, 2) #row = riga = partiamo dalle righe
#ma 1, 2 è un arrey = stanno insieme ci vuole la c
#allora diventa par(mfrow c = (1, 2))
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue) #plot banda 1 = blue
plot(l2011$B2_sre, col = clgreen) #plot banda 2 = green

#abbiamo banda 1 e banda 2 

#come si fa a chiudere tutto 
#dev.off() ==> metto come commento


#se vogliamo fare un pdf con questo oggetto 
#export multiframe plot #esporto un plot multiframe
pdf("multiframe.pdf")
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
#dev.off() ==> metto come commento

#esercizio: 
#exercise: revert the multiframe
#ora proviamo a fare un multiframe con il blu (B1) sopra e (B2) sotto
par(mfrow = c(2, 1))
plot(l2011$B1_sre, col = clblue) #plot banda 1 = blue
plot(l2011$B2_sre, col = clgreen) #plot banda 2 = green
#dev.off() ==> metto come commento

#salviamo 
pdf("multiframe_b_g.pdf")
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
#dev.off() ==> metto come commento


#ora fare un par con mfrow con tutte e quattro le bande
#2 righe e 2 colonne 
#1 riga B1 e B2
#2 riga B3 e B4
par(mfrow = c(2, 2))
#blu
plot(l2011$B1_sre, col = clblue) 
#verde
plot(l2011$B2_sre, col = clgreen) 
#per B3 = per il rosso 
clred <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col = clred)
#per B4 = NIR
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir)
#rimando il 
par(mfrow = c(2, 2))

#salviamo 
pdf("multiframe_4.pdf")
par(mfrow = c(2, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
plot(l2011$B3_sre, col = clred)
plot(l2011$B4_sre, col = clnir)
#dev.off() ==> metto come commento
dev.off()




#codici 18.03.22
l2011
plot(l2011$B1_sre)
plot(l2011[[1]])
cl <- colorRampPallette(c("black", "grey", "light grey")) (100) 
plot(l2011$B1_sre)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre, col = cl) 
l2011
plot(l2011$B1_sre)
clblue <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col = clblue)
#?pdf
#pdf("banda1.pdf")
#plot(l2011$B1_sre, col = clblue)
#dev.off()
#?png
#png("banda1.png")
#plot(l2011$B1_sre, col = clblue)
#dev.off()
#?writeRaster
l2011
plot(l2011$B2_sre)
clgreen <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col = clgreen)
#pdf("banda2.pdf")
#plot(l2011$B2_sre, col = clgreen)
#dev.off()
#png("banda2.png")
#plot(l2011$B2_sre, col = clgreen)
#dev.off() 
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue)
plot(l2011$B2_sre, col = clgreen) 
pdf("multiframe.pdf")
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
#dev.off() ==> metto come commento
par(mfrow = c(2, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
clred <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col = clred)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col = clnir)
par(mfrow = c(2, 2))
#salviamo 
pdf("multiframe_4.pdf")
par(mfrow = c(2, 2))
plot(l2011$B1_sre, col = clblue) 
plot(l2011$B2_sre, col = clgreen) 
plot(l2011$B3_sre, col = clred)
plot(l2011$B4_sre, col = clnir)
#dev.off() ==> metto come commento

