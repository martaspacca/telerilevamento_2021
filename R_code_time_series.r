# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma 

# install.packages("raster")
library(raster)
#install.packages(rasterVis):  metodo di visualizzazione dei dati raster
library(rasterVis)

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

levelplot(TGr)

levelplot(TGr$lst_2000)

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)

levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

meltlist <- list.files(pattern="melt")
meltlist

#lapply(meltlist,raster)
melt_import<-lapply(meltlist,raster)
melt_import
melt<-stack(melt_import)
levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)

#install.packages("knitr")
