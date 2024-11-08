library(devtools)
library(greenR)
library(dplyr)
datosnajera<-get_osm_data("Nájera,La Rioja,26300,España")
indice_verde_najera<-calculate_green_index(datosnajera,4326,100
dtnajera<-as.data.frame(indice_verde_najera)
najera<-summarise(.data=dtnajera,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
