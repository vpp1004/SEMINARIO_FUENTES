library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datossanjavier<-get_osm_data("San Javier,Campo de Cartagena y Mar Menor, Región de Murcia, España")
indice_verde_sanjavier<-calculate_green_index(datossanjavier,4326,100)
dtsanjavier<-as.data.frame(indice_verde_sanjavier)
sanjavier<-summarise(.data=dtsanjavier,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listmurcia<-list(
  San_javier=sanjavier
)
listamurcia<-bind_rows(listmurcia, .id="Pueblo")

dtmurcia=as.data.frame(listamurcia)
dtmurcia
murcia=summarise(.data=dtmurcia,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
murcia
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,andalucia,valencia,murcia,file="Objetos.RData")

