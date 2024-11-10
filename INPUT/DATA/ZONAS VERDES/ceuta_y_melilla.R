library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")


datosceuta<-get_osm_data("Ceuta,España")
indice_verde_ceuta<-calculate_green_index(datosceuta,4326,100)
dtceuta<-as.data.frame(indice_verde_ceuta)
ceuta<-summarise(.data=dtceuta,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmelilla<-get_osm_data("Melilla,España")
indice_verde_melilla<-calculate_green_index(datosmelilla,4326,100)
dtmelilla<-as.data.frame(indice_verde_melilla)
melilla<-summarise(.data=dtmelilla,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listceuta<-list(
  Ceuta=ceuta
)

listaceuta<-bind_rows(listceuta, .id="Pueblo")

dtceuta=as.data.frame(listaceuta)
dtceuta
ceuta=summarise(.data=dtceuta,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
ceuta

listmelilla<-list(
  Melilla=melilla
)

listamelilla<-bind_rows(listmelilla, .id="Pueblo")

dtmelilla=as.data.frame(listaceuta)
dtmelilla
melilla=summarise(.data=dtceuta,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
melilla
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,andalucia,valencia,murcia,aragon,madrid,ceuta,melilla,file="Objetos.RData")


