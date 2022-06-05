#10.03.22
#richiamiamo la libreria raster
#installazione
#install.packages("raster")[apriamo le virgolette perchè siamo usciti da R]
library(raster)
#Caricamento del pacchetto richiesto: sp

#oggi tante errori, perchè andiamo a caricare dei dati 
#perchè facciamo dialogare R con l'interno dei nostri computer

#nel nostro pc, in un percorso corto, creiamo una cartella che si 
#chiami "lab" -> inserirci e scaricare da Virtuale con i Data
#Landsat date (zip) 

#jamboard [1] -> tutti i file dati nella cartella lab

#quello che faremo oggi e da oggi per sempre = 
# è il settaggio della cartella di lavoro 
#e tutte le volte ricaricare i dati, quando utilizziamo i dati raster
#perché i dati raster = immagine, R li carica come dati temporanei e 
#non c'è altro modo di recuperare i dati da zero 
#il commando per selezionare la cartella di lavoro = setwd
#con google SETWD = set working directory
#GETWD = nome della cartella di lavoro
#SETWD = andiamo a decidere qual è la cartella di lavoro 

#settaggio cartella di lavoro
#a seconda di dove l'abbiamo messa ci dobbiamo mettere il percoso
#setwd("~/lab/")#linux
#setwd("/User/utente/lab") #mac
#setwd("C:/lab/") #windows

#per trovare il percorso della cartella = 
#tasto destro della cartella lab e si trova il percorso 
#per me il percorso è questo 
#mettere / -> non \
#jamboard [2]
#dobbiamo collegare la cartella lab a R 
#mettiamo le " " perché è esterna e proteggono il percorso 

setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
#nella console non avviene niente perché abbiamo solo settato la cartella di lavoro
#setworkingdirectory

#nella cartella lab
#nei file ci sono vari nomi 
#c'è una P e una R = perché questo satellite si chiama
#LANDSAT 
#nelle slide 2
#nel 1972 esce il primissimo SATELLITE COMMERCIALE, si chiama 
#Landsat ha una risoluzione di 60 metri
#fonte di dati importanti 
#parte nel 1972 un sensore che si chiama 
#Multi Spectral Sensor = MSS 
#[Multi-Spectral Scanner o MSS (sistema di scanner multispettrale)]
#con 60 metri di risoluzione 
#ma si spinge verso l'infrarosso 
#tempo di rivisita 14 gg = ogni 14 gg riabbiamo l'immagine sullo stesso punto del pianteta

#il satellite fa questo percorso [file 2 slide pag 35]
#https://www.youtube.com/watch?v=yPF2jpjB3Qw
#sono immagini NB
#non parlate mai di foto satellitari  
#il sensore che è sui satelliti è uno scanner 
#quindi non acquisisce una foto 
#ma uno scanner/scansione = immagine 
#nel video sta facendo dei percorsi che si chiamano = PATH
#e alla fine abbiamo tutte le immagini della Terra

#se portiamo su una mappa un percorso circolare ci viene 
#una sinusoide di pag 35 delle specie di derivate a s
#che si chiamano path = percorsi che fa il satellite
#in fondo ci sono dei numeri per ogni path 
#in più possiamo suddividere il pianeta in righe orizzontali con
#anche queste un numerino che si chiamano row

#ora con un incrocio di battaglia navale di path e row
#noi individuiamo ogni singola immagine del pianeta e in 
#quale zona
#dove siamo noi 
#p = path
#r = row
#preso dal file lab 
#p224r63
#incrocio delle immagini landsat
#riga 63 
#colonna 224
#siamo in mezzo della Foresta Amazzonica

#in virtuale = descrizione sommaria dell'area di studio
#area di studio, presa da un libro 
#Study Area
#We wanted to have a study area with clear patterns of land cover change, which shows
#the effects of a protected area on forest and deforestation patterns. Remote sensing data
#sets had to be available for this area also, with no or minimum cloud cover. One area that
#suited our needs was located in Brazil, the Parakanã Indigenous Reserve in the state of
#Pará, North Region of Brazil (Figure 0.1). This reserve, founded in 1975, is listed as an
#indigenous area but has not been assigned to an International Union for Conservation
#of Nature (IUCN) category (Protected Planet, http://www.protectedplanet.net). Large-
#scale deforestation in the region is due to agricultural expansion and cattle ranching
#and has modified this region considerably in the past. Mainly, the Parakanã Indigenous
#Reserve remains forested (Figure 0.2). A reservoir on the Rio Tocantins (Tocantins River)
#covers the north-east part of the area. This large body of water (Lago Tucuruí) is an
#artificial lake created by the construction of a hydroelectric dam called Represa de Tucuruí
#(Tucuruí Dam) which was finished in 1984. Construction of the dam is closely related to
#the observed deforestation and degradation patterns, as workers began settling down
#after the construction of the dam was complete. Moreover the area is bisected by the
#Transamazônica highway.

#traduzione 
#Area studio
#Volevamo avere un'area di studio con modelli chiari di cambiamento della copertura del suolo, come si vede
#gli effetti di un'area protetta sui modelli forestali e di deforestazione. Dati di telerilevamento
#i set dovevano essere disponibili anche per quest'area, con copertura nuvolosa nulla o minima. Una zona che
#adatta alle nostre esigenze si trovava in Brasile, la Riserva Indigena Parakanã nello stato di
#Pará, regione settentrionale del Brasile (Figura 0.1). Questa riserva, fondata nel 1975, è elencata come an
#area indigena ma non è stata assegnata a un'Unione internazionale per la conservazione
#della categoria Nature (IUCN) (Protected Planet, http://www.protectedplanet.net). Larga-
#la deforestazione su vasta scala nella regione è dovuta all'espansione agricola e all'allevamento di bestiame
#e ha modificato notevolmente questa regione in passato. Principalmente, gli indigeni Parakanã
#La riserva rimane boscosa (figura 0.2). Un bacino idrico sul Rio Tocantins (fiume Tocantins)
#copre la parte nord-orientale dell'area. Questo grande specchio d'acqua (Lago Tucuruí) è un
#lago artificiale creato dalla costruzione di una diga idroelettrica chiamata Represa de Tucuruí
#(Diga di Tucuruí) che è stata terminata nel 1984. La costruzione della diga è strettamente correlata a
#i modelli osservati di deforestazione e degrado, quando i lavoratori hanno iniziato a stabilirsi
#dopo il completamento della costruzione della diga. Inoltre l'area è divisa in due dal
#Autostrada Transamazonica.

#la riserva indigena di Parakana
#su google 
#foresta tropicale che è stata distrutta per far posto di aree agricole

#foresta dall'alto
#dal 1988 al 2011
#video tutor [Torresani] per scaricare la immagini landsat del pianeta
#https://youtu.be/JN-P04Dkx48

#nella cartella lab = per ogni dato abbiamo questo blocco di file
#.grd --> file grafico quello che ci serve
#.gri --> informazione dei pixwl = riflettanza = sono valori 
#e i colori sono solo dei valori numerici 
#.gri.aux.xml --> xml = dato aggiuntivo che descrive i metadati
#.hdr --> header = per capire al sistema le coordinate usate 
#.stx --> indice = contiene informazioni su coordinate e risoluzione

#ora giocare con i nostri dati 
#1. caricare DATI
#jamboar [3] per importare dei dati raster 
#un file raster = formato da tante bande, ognuna della quali
#abbiamo la riflettanza di un oggetto =
#(quanta energia riflette l'oggetto rispetto l'energia che è arrivata in entrata)
#con un sensore per ogni lunghezza d'onda
#[file 2 slide 10]
#ognuno registra il nostro paesaggio in una diversa lunghezza d'onda = colore diverso 
#in funzione della lunghezza d'onda abbiamo un colore diverso 
#piccole = blu
#grandi = rosso 
#vari sensori ognuno dei quali registra il nostro paesaggio in una certa lunghezza d'onda
#quindi abbiamo il nostro paesaggio nella lunghezza d'onda dell'arancione, giallo,
#rosso,.... [slide 2 pag 14]
#quante ne vogliamo 
#la banda = è ugnuna di questi strati 

#jamboar [3]
#per importare un pacchetto di dati esiste una funzione in R
#la funzione per importare tanti dati in R si chiama BRICK
#come si usano le funzioni su R
?brick
#brick(x,)
#x = dove andare a pescare la nostra immagine
#in lab, quella più recente 
#2011 in grd = griglia di dati 
#è
#p224r63_2011.grd
#brick(p224r63_2011.grd) --> non funzionerà perchè è esterna a R, quindi ci 
#vogliono le "_" virgolette
#dopo che è dentro a R assegnamo alla funzione un nome di un oggetto 
#per esempio l2011 = leandsat 2011
#brick funziona per la libreria raste

brick("p224r63_2011.grd")

#poi l'assegnamo all'oggetto
l2011 <- brick("p224r63_2011.grd")
#dopo aver importato i dati = diamo il nome l2011 e usciranno tutte le informazioni 
l2011
#console
#class      : RasterBrick 
#dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
#resolution : 30, 30  (x, y)
#extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
#crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#source     : p224r63_2011.grd 
#names      :      B1_sre,      B2_sre,      B3_sre,      B4_sre,      B5_sre,       B6_bt,      B7_sre 
#min values :         0.0,         0.0,         0.0,         0.0,         0.0,       295.1,         0.0 
#max values :   1.0000000,   0.2563655,   0.2591587,   0.5592193,   0.4894984, 305.2000000,   0.3692634 

#tutte le infomazioni 
#classe = tipo di oggetto = RasterBrick 
#Brick = creava un oggetto raster brick
#dimensioni = 
#1499 = pixel numero di righe 
#2967 = pixel numero di colonne
#4447533 = numero di pixel nelle celle = dati di riflettanze 
#quante bande a questa immagine = 7 NLAYERS = numero di strati 
#numero di righe per numero di colonne = numero di celle 
#che sono per ogni banda 
#quindi sono 4447533 per 7 = sono circa 30 milioni di dati 
#ogni pixel è grande 30 metri sulla x e 30 sulla y = sono quadrati 
#con coordinate con proiezione 
#source = sorgente del dato 
#nomi = all'interno del nostro file 
#tutte le bande b1 = blu
#B1_sre = spectral reflectance
#valori minimi e valori massimi
#i valori minimi sono sempre 0 [tranne nella banda del termico, che è particolare]
#valori massimi = da 0 a 1 = perchè la riflettanza l'abbiamo definita 
#= flusso radiante [quanto energia arriva]
#la riflettanza è la divisione tra quanto flusso radiante viene riflesso e quanto era
#in entrata
#se noi assorbiamo tutto la nostra riflettanza andrà a 0 = valore minimo
#se invece riflettiamo tutta l'energia che ci è arrivata = 1 = valore massimo 
#slide 3 pag 5
#in alcune immagini i valori non vanno solo da 0 a 1 ma anche da 0 a 255

#su virtuale il codice

#andiamo a vedere il primo plot di questa immagine
?plot #Generic X-Y Plotting
#plot mettendo la x e la y = righe e colonnna sono già nella nostra immagine  
#plot(x, y, ...)

plot(l2011)

#prendendo il pdf salvato come plot_l2011_in_R, perchè si vede meglio
#anche per chi non vede i colori è una buona legenda perchè va da un chiaro a uno scuro 
#riflettanza ad ogni banda
#banda del blu minimo da 0 a 0.2 fino a 0.10 = blu riflettono un pochino 
#verde
#3 rosso
#4 infrarosso 
#5 infrarosso medio 
#6 termico
#7 infrarosso medio

#ora cambiare legenda di default 
#dallo scuro (blu) = 0 a chiaro (bianco) a = 1

#per cambiare il colore
#la funzione si chiama colorramppalette
?colorRampPalette
#c'è una serie di colori che viene adattato il coloro di un immagine a 
#questa serie di colori qua
#palette = legenda di colori 
#Ramp e Palette = hanno la lettere maiuscole 
#funzione si compone sempre con ()
#in questo caso ci metto una serie di colori che io andrò a usare 
#i colori di R sono in generale = salvato come color_in_R
#o al seguente link: https://www.r-graph-gallery.com/42-colors-names.html
#colori tra "_"
#colorRampPalette("black", "grey", "light grey")
#"black", "grey", "light grey" -> sono una serie di dati uno dopo l'altro = arrey
#= serie di caratteri in R mettiamo una c
#quindi ci dobbiamo mettere una c
#colorRampPalette(c("black", "grey", "light grey"))
#abbiamo un passaggio graduale non è netto 
#quante ne vogliamo?? = quanti numeri di passaggio = con 100 colori 
colorRampPalette(c("black", "grey", "light grey")) (100)
#nella console
#[1] "#000000" "#030303" "#070707" "#0B0B0B" "#0F0F0F" "#131313" "#171717" "#1A1A1A"
#[9] "#1E1E1E" "#222222" "#262626" "#2A2A2A" "#2E2E2E" "#313131" "#353535" "#393939"
#[17] "#3D3D3D" "#414141" "#454545" "#484848" "#4C4C4C" "#505050" "#545454" "#585858"
#[25] "#5C5C5C" "#5F5F5F" "#636363" "#676767" "#6B6B6B" "#6F6F6F" "#737373" "#767676"
#[33] "#7A7A7A" "#7E7E7E" "#828282" "#868686" "#8A8A8A" "#8E8E8E" "#919191" "#959595"
#[41] "#999999" "#9D9D9D" "#A1A1A1" "#A5A5A5" "#A8A8A8" "#ACACAC" "#B0B0B0" "#B4B4B4"
#[49] "#B8B8B8" "#BCBCBC" "#BEBEBE" "#BEBEBE" "#BFBFBF" "#BFBFBF" "#BFBFBF" "#C0C0C0"
#[57] "#C0C0C0" "#C1C1C1" "#C1C1C1" "#C2C2C2" "#C2C2C2" "#C2C2C2" "#C3C3C3" "#C3C3C3"
#[65] "#C4C4C4" "#C4C4C4" "#C5C5C5" "#C5C5C5" "#C5C5C5" "#C6C6C6" "#C6C6C6" "#C7C7C7"
#[73] "#C7C7C7" "#C7C7C7" "#C8C8C8" "#C8C8C8" "#C9C9C9" "#C9C9C9" "#CACACA" "#CACACA"
#[81] "#CACACA" "#CBCBCB" "#CBCBCB" "#CCCCCC" "#CCCCCC" "#CDCDCD" "#CDCDCD" "#CDCDCD"
#[89] "#CECECE" "#CECECE" "#CFCFCF" "#CFCFCF" "#D0D0D0" "#D0D0D0" "#D0D0D0" "#D1D1D1"
#[97] "#D1D1D1" "#D2D2D2" "#D2D2D2" "#D3D3D3"

#ora andiamo a dargli un nome 
#come 
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)

#nella funzione plot = l'argomento da inserire come colore = col
plot(l2011, col = cl)

#notiamo che 
#nella parte della banda 4 = riflettanza sparettissima = è quella dell'infrarosso 
#perchè se c'è vegetazione c'è un alta riflettanza 
#ora giochiamo con i colori 
#per ogni banda abbiamo dato analizzato quella che era la riflettanza danno una 
#nostra legenda dalle riflettanze più scure alle riflettanze + alte = chiare
#con una nostre legenda a ogni singola banda 


#dev.off = chiude qualsiasi device grafico


#codici 10.03.22
#library(raster)
#setwd("D:/UNIVERSITA' MAGISTRALE/1 ANNO/2 SEMESTRE/TELERILEVAMENTO GEO-ECOLOGICO/R/3. 10.03.22/lab")
#?brick
#brick("p224r63_2011.grd")
#l2011 <- brick("p224r63_2011.grd")
#l2011
#?plot
#plot(l2011)
#?colorRampPalette
#colorRampPalette(c("black", "grey", "light grey")) 
#colorRampPalette(c("black", "grey", "light grey")) (100)
#cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
#plot(l2011, col = cl)
