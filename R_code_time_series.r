# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma 

# install.packages("raster")
library(raster)

setwd("C:/lab/greenland")

#importiamo il primo dataset
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

#plot dataset
plot(lst_2000) 
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#par(mfrow=c(2,2))
par(mfrow=c(2,2))
plot(lst_2000) 
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#list.files: creaiamo la lista di files a cui apllicare Lapply
#pattern: i files devono avere un nome in comune, an optional regular expression
rlist <- list.files(pattern="lst")
rlist

#lapply: apply a Function over a List or Vector
lapply(rlist,raster)
import<-lapply(rlist,raster)

#stack: impacchettiamo i nostri files raster
TGr<-stack(import)

plot(Tgr)
plotRGB(TGr, 1, 2, 3, stretch="Lin")

