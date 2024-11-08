library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datosibiza<-get_osm_data("Ibiza,Islas Baleares,España")
indice_verde_ibiza<-calculate_green_index(datosibiza,4326,100)
dtibiza<-as.data.frame(indice_verde_ibiza)
ibiza<-summarise(.data=dtibiza,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmenorca<-get_osm_data("Menorca,Islas Baleares,España")
indice_verde_menorca<-calculate_green_index(datosmenorca,4326,100)
dtmenorca<-as.data.frame(indice_verde_menorca)
menorca<-summarise(.data=dtmenorca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listabaleares<-list(
  Ibiza=ibiza,
  Menorca=menorca
)
listbaleares<-bind_rows(listabaleares, .id="Pueblo")

dtbaleares=as.data.frame(listbaleares)

baleares=summarise(.data=dtbaleares,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
baleares
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,file="Objetos.RData")
