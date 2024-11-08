library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datostalavera<-get_osm_data("Talavera de la Reina,Toledo,Castilla-La Mancha,España")
indice_verde_talavera<-calculate_green_index(datostalavera,4326,100)
dttalavera<-as.data.frame(indice_verde_talavera)
talavera<-summarise(.data=dttalavera,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosoropesa<-get_osm_data("Oropesa,Toledo,Castilla-La Mancha,España")
indice_verde_oropesa<-calculate_green_index(datosoropesa,4326,100)
dtoropesa<-as.data.frame(indice_verde_oropesa)
oropesa<-summarise(.data=dtoropesa,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datoscabanillas<-get_osm_data("Cabanillas del Campo,Guadalajara,Castilla-La Mancha,19171,España")
indice_verde_cabanillas<-calculate_green_index(datoscabanillas,4326,100)
dtcabanillas<-as.data.frame(indice_verde_cabanillas)
cabanillas<-summarise(.data=dtcabanillas,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosazuqueca<-get_osm_data("Azuqueca de Henares,Guadalajara,Castilla-La Mancha,19200,España")
indice_verde_azuqueca<-calculate_green_index(datosazuqueca,4326,100)
dtazuqueca<-as.data.frame(indice_verde_azuqueca)
azuqueca<-summarise(.data=dtazuqueca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosvillanueva<-get_osm_data("Villanueva de la Jara,Cuenca,Castilla-La Mancha,16230,España")
indice_verde_villanueva<-calculate_green_index(datosvillanueva,4326,100)
dtvillanueva<-as.data.frame(indice_verde_villanueva)
villanueva<-summarise(.data=dtvillanueva,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datostarancon<-get_osm_data("Tarancón,Cuenca,Castilla-La Mancha,16400,España")
indice_verde_tarancon<-calculate_green_index(datostarancon,4326,100)
dttarancon<-as.data.frame(indice_verde_tarancon)
tarancon<-summarise(.data=dttarancon,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datostomelloso<-get_osm_data("Tomelloso,Ciudad Real,Castilla-La Mancha,13700,España")
indice_verde_tomelloso<-calculate_green_index(datostomelloso,4326,100)
dttomelloso<-as.data.frame(indice_verde_tomelloso)
tomelloso<-summarise(.data=dttomelloso,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosalcazar<-get_osm_data("Alcázar de San Juan,Ciudad Real,Castilla-La Mancha 13600,España")
indice_verde_alcazar<-calculate_green_index(datosalcazar,4326,100)
dtalcazar<-as.data.frame(indice_verde_alcazar)
alcazar<-summarise(.data=dtalcazar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalmansa<-get_osm_data("Almansa,Albacete,Castilla- La Mancha,España")
indice_verde_almansa<-calculate_green_index(datosalmansa,4326,100)
dtalmansa<-as.data.frame(indice_verde_almansa)
almansa<-summarise(.data=dtalmansa,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))




listamancha<-list(
  Talavera=talavera,
  Oropesa=oropesa,
  Tarancon=tarancon,
  Alcazar=alcazar,
  Almansa=almansa,
  Tomelloso=tomelloso,
  Villanueva=villanueva,
  Azuqueca=azuqueca,
  Cabanillas=cabanillas
)
listmancha<-bind_rows(listamancha, .id="Pueblo")

dtmancha=as.data.frame(listmancha)

dtmancha
mancha=summarise(.data=dtmancha,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
mancha
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,file="Objetos.RData")
