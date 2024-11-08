library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datoselche<-get_osm_data("Elche,El Bajo Vinalopó,Alicante,Comunidad Valenciana,España")
indice_verde_elche<-calculate_green_index(datoselche,4326,100)
dtelche<-as.data.frame(indice_verde_elche)
elche<-summarise(.data=dtelche,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

