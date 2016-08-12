## Obtain mean temp and precipitation during mexican temporal season (May-October)

# By Alicia Mastretta-Yanes


#### load data
# needed package
library(raster)

### Get data:
# Cuervo-Robayo, A.P., Téllez-Valdés, O., Gómez-Albores, M.A., Venegas-Barrera, C.S., Manjarrez, J. y Martínez-Meyer, E. (2013) An update of high-resolution monthly climate surfaces for Mexico. International Journal of Climatology. 10.1002/joc.3848.
# Available at: http://bioclimasneotropicales.org/descarga-mexico.html


### Get desired rasters for May-Oct

## Tempmax
for(i in 5:10) { 
  namvar<-paste0(i, "Tmax")
  assign(namvar, raster(paste0("ASCII_TmaxMonths/tmax", i, ".asc")))
  }

## Tempmin
for(i in 5:10) { 
  namvar<-paste0(i, "Tmin")
  assign(namvar, raster(paste0("ASCII_TminMonths/tmin", i, ".asc")))
}


## Rainfall
for(i in 5:10) { 
  namvar<-paste0(i, "Prec")
  assign(namvar, raster(paste0("ASCII_PrecMonths/prec_", i, ".asc")))
}


## Obtain mean




