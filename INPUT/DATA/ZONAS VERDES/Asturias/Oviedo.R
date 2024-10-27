library(devtools)
library(greenR)
library(dplyr)
datosoviedo<-get_osm_data("Oviedo,Asturias,España")
indice_verde_oviedo<-calculate_green_index(datosoviedo,4326,100)
str(indice_verde_oviedo)
typeof(indice_verde_oviedo)
dtoviedo<-as.data.frame(indice_verde_oviedo)
oviedo<-summarise(.data=dtoviedo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
oviedo
View(oviedo)
View(dtoviedo)
typeof(oviedo)
str(oviedo)


