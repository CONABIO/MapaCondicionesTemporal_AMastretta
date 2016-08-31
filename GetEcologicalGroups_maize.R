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

#check
cellStats(TmpPrec, range)

# Change projection
proj4string(TmpPrec) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")

## Maize
maizedb<-read.delim("BaseMaicesNativos.txt")



## Range
plot(TmpPrec$Tmean_MayOct, col=rev(brewer.pal(11, "RdYlBu")), main="Mean Temperature May-Oct (°C)")
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)

plot(TmpPrec$Precipmean_MayOct, col=brewer.pal(9, "YlGn"), main="Mean rainfall May-Oct (mm)")
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)

## Categorical
# Temp
brk<-c(-2,11,14,17,20,23,25,27.5,30)
plot(TmpPrec$Tmean_MayOct, breaks=brk, col=c("white", rev(brewer.pal(7, "RdYlBu"))),
     legend=FALSE)
legend(x=-120, y=25.5, title ="Mean temperature \n May-Oct (°C)", bty="n", border="lightgrey",
       fill=c(brewer.pal(7, "RdYlBu"), "white"), cex=.9,
       legend=c("27.5-30", "25-27.5", "23-25", "20-23", "17-20", "14-17", "11-14","<11"))
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)
legend(x=-118, y=15, bty="n", legend="Maize landraces",
       pch=20, pt.cex=0.5, cex=.9)

# Precipit
plot(TmpPrec$Precipmean_MayOct,col=brewer.pal(9, "YlGnBu"), legend=FALSE)
legend(x=-121, y=25.5, title ="Mean precipitation \n May-Oct (mm)", bty="n", border="lightgrey",
       fill=rev(brewer.pal(7, "YlGnBu")), cex=.9,
       legend=rev(c("<100", "100-200", "200-300", "300-400", "400-500", "500-600", ">600")))
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)
legend(x=-118, y=16, bty="n", legend="Maize landraces",
       pch=20, pt.cex=0.5, cex=.9)


## Joint
par(mfrow=c(2,1), oma=c(0.2,0,0,0), mar=c(2, 4, 0, 2) + 0.1)

# Temp
brk<-c(-2,11,14,17,20,23,25,27.5,30)
plot(TmpPrec$Tmean_MayOct, breaks=brk, col=c("white", rev(brewer.pal(7, "RdYlBu"))),
     legend=FALSE, xaxt="n")
legend(x=-121, y=25.5, title ="Mean temperature \n May-Oct (°C)", bty="n", border="lightgrey",
       fill=c(brewer.pal(7, "RdYlBu"), "white"), cex=.9,
       legend=c("27.5-30", "25-27.5", "23-25", "20-23", "17-20", "14-17", "11-14","<11"))
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)


# Precipit
plot(TmpPrec$Precipmean_MayOct,col=brewer.pal(9, "YlGnBu"), legend=FALSE)
legend(x=-121, y=25.5, title ="Mean precipitation \n May-Oct (mm)", bty="n", border="lightgrey",
       fill=rev(brewer.pal(7, "YlGnBu")), cex=.9,
       legend=rev(c("<100", "100-200", "200-300", "300-400", "400-500", "500-600", ">600")))
points(maizedb$Longitud, maizedb$Latitud, cex=0.3, pch=20)

