library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")

datosgandia<-get_osm_data("Gandía,La Safor,Valencia,Comunidad Valenciana,España")
indice_verde_gandia<-calculate_green_index(datosgandia,4326,100)
dtgandia<-as.data.frame(indice_verde_gandia)
gandia<-summarise(.data=dtgandia,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosburriana<-get_osm_data("Burriana,Plana Baja,Castellón,Comunidad Valenciana,12530,España")
indice_verde_burriana<-calculate_green_index(datosburriana,4326,100)
dtburriana<-as.data.frame(indice_verde_burriana)
burriana<-summarise(.data=dtburriana,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosvillareal<-get_osm_data("Villareal,Plana Baja,Castellón,Comunidad Valenciana,12450,España")
indice_verde_villareal<-calculate_green_index(datosvillareal,4326,100)
dtvillareal<-as.data.frame(indice_verde_villareal)
villareal<-summarise(.data=dtvillareal,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosbenidorm<-get_osm_data("Benidorm,La Marina Baja,Alicante,Comunidad Valenciana,España")
indice_verde_benidorm<-calculate_green_index(datosbenidorm,4326,100)
dtbenidorm<-as.data.frame(indice_verde_benidorm)
benidorm<-summarise(.data=dtbenidorm,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listvalencia<-list(
  Benidorm=benidorm,
  Villareal=villareal,
  Burriana=burriana,
  Gandia=gandia
  
)
listavalencia<-bind_rows(listvalencia, .id="Pueblo")

dtvalencia=as.data.frame(listavalencia)
dtvalencia
valencia=summarise(.data=dtvalencia,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
valencia
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,andalucia,valencia,file="Objetos.RData")

