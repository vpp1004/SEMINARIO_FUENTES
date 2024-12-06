library(devtools)
library(greenR)
library(dplyr)
datosburgos<-get_osm_data(("Burgos,Castilla y León,España"))
indice_verde_burgos<-calculate_green_index(datosburgos,4326,100)
str(indice_verde_burgos)
dtburgos<-as.data.frame(indice_verde_burgos)
burgos<-summarise(.data=dtburgos,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
str(burgos)