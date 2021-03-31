## my first code in R for remote sensing

# setwd(dir): set the directory of my work
setwd("C:/lab/")

# install.packages: download and install packages from CRAN-like repositories or from local files
## raster data are composed of arrays of pixels (or cells), each containing a value that represents the conditions of the area covered by the cell

# install.packages("raster")
library(raster)

# brick : import data from outside R
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

## we are studying is the indigenous reserve of Parakanã in the state of Pará, northern region of Brazil

# plot: generic function for plotting of R objects
plot(p224r63_2011)

#colorRampPalette: establish color variation
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

# dev.off: close a graphic device
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

## Giorno4_24/03/21

# Visualizing data by RGB plotting
# plotRGB: Red-Green-Blue plot of a multi-layered Raster object
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# mount a 2x2 multiframe
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# PDF Graphics Device
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

pdf("naturalcolours_flase colours_falsecolours_withhistogramstretching.pdf")
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#Multitemporal set
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988
plot(p224r63_1988)

plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(p224r63_1988)
plotRGB(p224r63_2011)

#prova par
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")

pdf("multitemporal_set_ 1988_2011.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")

#creare un unico pdf dei file su lab
