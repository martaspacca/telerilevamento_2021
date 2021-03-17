# Il mio primo codice in R per il telerilevamento! 

setwd("C:/lab/")

# install.packages("raster")
library(raster)

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

plot(p224r63_2011)


#colour change
cl <- colorRampPalette(c("black","grey","light grey")) (100)
plot(p224r63_2011, col=cl)

#colour change -> new
cl <- colorRampPalette(c("red","green","blue","yellow")) (100)
plot(p224r63_2011, col=cl)

cl <- colorRampPalette(c("orange","green","purple","yellow")) (100)
plot(p224r63_2011, col=cl)
