library(devtools)
library(greenR)
library(dplyr)
load("objetos.RData")
datospinto<-get_osm_data("Pinto,Comunidad de Madrid,28320,España")
indice_verde_pinto<-calculate_green_index(datospinto,4326,100)
dtpinto<-as.data.frame(indice_verde_pinto)
pinto<-summarise(.data=dtpinto,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosboadilla<-get_osm_data("Boadilla del Monte,Comunidad de Madrid,España")
indice_verde_boadilla<-calculate_green_index(datosboadilla,4326,100)
dtboadilla<-as.data.frame(indice_verde_boadilla)
boadilla<-summarise(.data=dtboadilla,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listmadrid<-list(
  Pinto=pinto,
  Boadilla_del_monte=boadilla
)

listamadrid<-bind_rows(listmadrid, .id="Pueblo")

dtmadrid=as.data.frame(listamadrid)
dtmadrid
madrid=summarise(.data=dtmadrid,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
madrid
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,andalucia,valencia,murcia,aragon,madrid,file="Objetos.RData")

