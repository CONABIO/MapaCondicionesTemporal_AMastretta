## 

# By Alicia Mastretta-Yanes


#### load data
# needed package
library(raster)
library(maptools)
library(RColorBrewer)
library(sp)

Envdata<-stack(c("Precipmean_MayOct.asc", "Tmean_MayOct.asc") )


# Change projection
proj4string(TmpPrec) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0")

# Read shapefile with municipios cropped to agriculture area
MuniMaizAgro<-readShapePoly("MuncipiosMaiz_sueloagricola/Rend_Maiz_Mun_2010_USV_s5_Tem_Sel")


## Easy plot 
plot(Envdata[[1]])
plot(MuniMaizAgro, add=TRUE)


## Crop

Envdata_crop<-crop(Envdata, extent(MuniMaizAgro))
Envdata_crop<-mask(Envdata_crop, MuniMaizAgro)

# plot
plot(Envdata_crop[[1]])

# save raster
writeRaster(Envdata_crop[[1]], "Precipmean_MayOct_cropbyMunipMaiz.asc")
writeRaster(Envdata_crop[[2]], "Tmean_MayOct_cropbyMunipMaiz.asc")

## Extract mean value of each municipio

munivals<-extract(Envdata_crop, MuniMaizAgro, fun= mean)
head(munivals)

## Add to shape file
MuniMaizAgro$Precipmean_MayOct<-munivals[,1]
MuniMaizAgro$Tmean_MayOct<-munivals[,2]

## Plot
spplot(MuniMaizAgro, "Precipmean_MayOct", col="transparent", 
       col.regions = brewer.pal(9, "YlGnBu"), cuts=9)











