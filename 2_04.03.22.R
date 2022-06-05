#04.03.22

#oggi facciamo:
#- R
#- Git Hub (account)
#- lab folder
#- data

#i dati satellitare = dati raster
#--> salvati in temporaneo su r
#meglio avere i dati separati e poi unirli tutte le volte 

#dati su virtuale 


#oggi 3 aspetti:
#1. assegnazione 
#2. oggetti 
#3. portage??

#R usato come una calcolatrice 
3 + 2 
#[1] 5
 
#jambord (2)
#d = oggetto
#in r basta premere la freccia in alto che prende 
#la funzione precedente 

d <- 3 + 2 
#se premo invio non succede niente
d
#[1] 5
#d = oggetto 

#altra operazione 
7 + 3 
#[1] 10
a <- 7 + 3 
a
#[1] 10

#da questo punto questi oggetti 
#possono essere sempre utilizzati 
3 + 2 + 7 + 3
#[1] 15
#oppure 
d + a
#[1] 15

#abbiamo imparato due termini importanti:
#1. ASSEGNAZIONE <- (freccia)
#2. OGGETTI a o d

#Etichetta = come mi piace che sia scritto un codice 
#freccia in alto prende il codice precedente 
#spazio prima e dopo l'assegnazione
#(no spazio, si spazio)
#fra argomento e l'altro = metto lo spazio e anche la virgola

#più ordine con gli SPAZI 


#ora fare una sorta di plottaggio 
#VETTORE
#serie di oggetti metti insieme

#esempio
#tesi su migrazione dei grandi mammiferi 
#mam = oggetto 
#misura il passaggio nel tempo 
#per un certo tempo = quanto stiamo a campionare
#jambord (3) 

#mam <- 2, 4, 7, 10, 15, 20 
#insieme di elementi = vettori o arredi 
#vettore = serie di coordinate
#vettore in R serie di caratteri 
#vettore indichiamo con una c
mam <- c(2, 4, 7, 10, 15, 20)
mam
#[1] 2 4 7 10 15 20

#altra tesi = con relazioni tra piante e suolo 
#valore dell'inquinamento 
#jambord(3)
#suolo = suo
#g/m3 di piombo
suo <- c(100, 80, 50, 30, 10, 2)
suo
#[1] 100 80 50 30 10 23

#ora fare un plot e mettere in relazione le due variabili 
#sull'asse X = variabile indipendente = suo 
#sull'asse Y = variabile dipendente = mam
#fare il plot 
#plot generico 
#plottiamo tutti i punti in X e Y
#funzione = plot
#()
#argomento = tra parentesi (x, y,...)
#X = suo
#Y = mam
#senza spazi
plot(suo, mam)
#salvato il Rplot_suo_mam_RStudio 

#in R appare sopra al codice

#point character = ho tanti tipi di simbolo = pch

plot(suo, mam, pch = 19)
#salvato con Rplto_puntineri

#un altro parametro è il colore
#cambiare il colore = color in r 
#colori = palette di colori 
#evitare:
#1. che le persone che non vedono i colori non vedono 
#le nostre mappe (rosso e verde)
#2. il giallo l'occhio umnao è quello che percepisce di più
#= metterlo dove volete che l'attenzione cada di più 
#per esempio = sui valori massimi 

#articoli su Virtuale 
#articolo = Cranieri = colori
#in r vividis
#altro articolo = etichetta 
#ghiacciaio e trovato uomo di otzi 

#palet dei colori 
#in r = salvati con le "..."
#colore = col
plot(suo, mam, pch=19, col="blue")
#salvato in Rplot_blue

#per aumentare o diminuire la dimensione dei punti 
#cex = character esageration 
#3 volte più grandi rispetto ad ora 
plot(suo, mam, pch=19, col="blue", cex=3)
#salvato Rplot_cex
#o anche più piccoli 0.5 
plot(suo, mam, pch=19, col="blue", cex=0.5)
#salvato Rplot_0.5

#se non va il graffico mettere 
#dev.off()
#con un problema di grafica = ripulire tutto
