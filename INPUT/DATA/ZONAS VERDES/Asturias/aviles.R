library(devtools)
library(greenR)
library(dplyr)
datosaviles<-get_osm_data(("Avilés,Asturias,España"))
indice_verde_aviles<-calculate_green_index(datosaviles,4326,100)
str(indice_verde_aviles)
dtaviles<-as.data.frame(indice_verde_aviles)
aviles<-summarise(.data=dtaviles,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
str(aviles)


