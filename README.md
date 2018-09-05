# Mapa condiciones ambientales durante época temporal para México

Manipulación de los rasters de Cuervo-Robayo et al (2014) para extraer la temperatura y precipitación media durante los meses de temporal (Mayo-Octubre) y recortarlos al uso de suelo agrícola (según INEGI) para los muncipios que tienen datos de producción de maíz en el SIAP.

* `Get_PrecipitationTemp_TemporalSeason.R`: extrae tmp y precipitación durante los meses May-Oct.
* `GetEcologicalGroups_maize.R`: obtiene las condiciones de los grupos ecológicos de maíz conforme a Ruiz et al 2008 y los extrae de los rasters para los puntos de colecta del Proyecto Global de Maíces Nativos 
* `GetEnvConditions_MuncipiosMaiz.R` : recorta raster al uso de suelo agrícola (según INEGI) para los muncipios que tienen datos de producción de maíz en el SIAP. Producto final exportado a shapefile.

Cuervo-Robayo AP, Téllez-Valdés O, Gómez-Albores MA et al. (2014) An update of high-resolution monthly climate surfaces for Mexico. International Journal of Climatology, 34, 2427–2437. Data available at: http://idrisi.uaemex.mx/

Ruiz Corral, José Ariel, Noé Durán Puga, José de Jesús Sánchez González, José Ron Parra, Diego Raymundo González Eguiarte, J.B. Holland, y Guillermo Medina García. “Climatic Adaptation and Ecological Descriptors of 42 Mexican Maize Races”. Crop Science 4, núm. 4 (2008): 1502. doi:10.2135/cropsci2007.09.0518.

