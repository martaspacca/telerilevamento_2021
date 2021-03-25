## Giorno1_

#Il mio primo codice in R per il telerilevamento!

setwd("C:/lab/")

# install.packages("raster")
library(raster)

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

plot(p224r63_2011)

## Giorno2_17/03/21

#colour change
cl <- colorRampPalette(c("black","grey","light grey")) (100)
plot(p224r63_2011, col=cl)

#colour change -> new
cl <- colorRampPalette(c("red","green","blue","yellow")) (100)
plot(p224r63_2011, col=cl)

cl <- colorRampPalette(c("orange","green","purple","yellow")) (100)
plot(p224r63_2011, col=cl)

## Giorno3_24/03/21

# Bande Landsat
#B1_blu
#B2_verde
#B3_rosso
#B4_infrarosso vicino
#B5_infrarosso medio
#B6_infrarosso termico
#B7_infrarosso medio

# dev.off pulirà la scheda corrente 
dev.off()

#plot immagine$banda_1
plot(p224r63_2011$B1_sre)

# plot band 1 with a predefined colut ramp palette
cl <- colorRampPalette(c("dark magenta", "violet", "dark violet", "purple")) (200)
plot(p224r63_2011$B1_sre, col=cl)

#plot immagine$banda_2
plot(p224r63_2011$B2_sre)

#par: definire come vogliamo le immagini nel nostro software; modalità di plottaggio
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# plot the first four bands of Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#colorRampPalette per ogni banda
par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)

clg<- colorRampPalette(c("dark green","green", "light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
