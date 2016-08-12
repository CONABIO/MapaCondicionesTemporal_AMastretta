### Obtain conditions for maize ecological groups according to Ruiz et al 2008
### and extract this information for data Global maize project
### Script by Alicia Mastretta Yanes
### Ref: Ruiz Corral, José Ariel, Noé Durán Puga, José de Jesús Sánchez González, José Ron Parra, Diego Raymundo González Eguiarte, J.B. Holland, y Guillermo Medina García. “Climatic Adaptation and Ecological Descriptors of 42 Mexican Maize Races”. Crop Science 48, núm. 4 (2008): 1502. doi:10.2135/cropsci2007.09.0518.

## Needs
library(raster)
library(RColorBrewer)

### Load data

## ENV
# Get mean temp and rainfall for May-Oct. 
# This was extracted from Cuervo et al 2013 data 
# using the script Get_PrecipitationTemp_TemporalSeason.R

TmpPrec<-stack("Precipmean_MayOct.asc", "Tmean_MayOct.asc")

# Change projection
proj4string(TmpPrec) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")

# Maize
maizedb<-read.delim("BaseMaicesNativos.txt")

## Plot

plot(TmpPrec$Tmean_MayOct, col=rev(brewer.pal(11, "RdYlBu")), main="Mean Temperature May-Oct (°C)")
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)

plot(TmpPrec$Precipmean_MayOct, col=brewer.pal(9, "YlGn"), main="Mean rainfall May-Oct (mm)")
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)

