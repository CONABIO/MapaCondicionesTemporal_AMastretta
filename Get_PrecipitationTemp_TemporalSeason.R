## Obtain mean temp and precipitation during mexican temporal season (May-October)

# By Alicia Mastretta-Yanes


#### load data
# needed package
library(raster)

### Get data:
# Cuervo-Robayo, A.P., Téllez-Valdés, O., Gómez-Albores, M.A., Venegas-Barrera, C.S., Manjarrez, J. y Martínez-Meyer, E. (2013) An update of high-resolution monthly climate surfaces for Mexico. International Journal of Climatology. 10.1002/joc.3848.
# Available at: http://bioclimasneotropicales.org/descarga-mexico.html


### Get desired rasters for May-Oct

## Temp
#max
setwd("ASCII_TmaxMonths/")
Tmax<- list.files(pattern="tmax[56789].asc$|[0]+.asc$") 
Tmax<-stack(Tmax)

#min              
setwd("../ASCII_TminMonths/")                  
Tmin<- list.files(pattern="tmin[56789].asc$|[0]+.asc$") 
Tmin<-stack(Tmin)

#stack
TempS<-stack(Tmin, Tmax)
rm(Tmin,Tmax)

## Rain
setwd("../ASCII_PrecMonths/")
PrecS<- list.files(pattern="prec_[56789].asc$|[0]+.asc$") 
PrecS<-stack(PrecS)

### Obtain means and generate rasters

# Temp
Tmean<-mean(TempS)
writeRaster(Tmean, "../Tmean_MayOct.asc")

# Rain 
Pmean<-mean(PrecS)
writeRaster(Pmean,"../Precipmean_MayOct.asc")


### Plots
library(RColorBrewer)
plot(Tmean, col=rev(brewer.pal(11, "RdYlBu")), main="Mean Temperature May-Oct (°C)")
plot(Pmean, col=brewer.pal(11, "YlGn"), main="Mean rainfall May-Oct (mm)")




