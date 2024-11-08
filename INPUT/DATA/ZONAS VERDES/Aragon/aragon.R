library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datosutebo<-get_osm_data("Utebo,Zaragoza,Aragón,España")
indice_verde_utebo<-calculate_green_index(datosutebo,4326,100)
dtutebo<-as.data.frame(indice_verde_utebo)
utebo<-summarise(.data=dtutebo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosejea<-get_osm_data("Ejea de los Caballeros,Cinco Villas,Zaragoza,Aragón,50600,España")
indice_verde_ejea<-calculate_green_index(datosejea,4326,100)
dtejea<-as.data.frame(indice_verde_ejea)
ejea<-summarise(.data=dtejea,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosbarbastro<-get_osm_data("Barbastro,Somontano de Barbastro,Huesca,Aragón,22300,España")
indice_verde_barbastro<-calculate_green_index(datosbarbastro,4326,100)
dtbarbastro<-as.data.frame(indice_verde_barbastro)
barbastro<-summarise(.data=dtbarbastro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosmonzon<-get_osm_data("Monzón,Cinca Medio,Huesca,Aragón,España")
indice_verde_monzon<-calculate_green_index(datosmonzon,4326,100)
dtmonzon<-as.data.frame(indice_verde_monzon)
monzon<-summarise(.data=dtmonzon,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosalcaniz<-get_osm_data("Alcañiz,Bajo Aragón,Teruel,Aragón ,España")
indice_verde_alcaniz<-calculate_green_index(datosalcaniz,4326,100)
dtalcaniz<-as.data.frame(indice_verde_alcaniz)
alcaniz<-summarise(.data=dtalcaniz,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datoscalamocha<-get_osm_data("Calamocha,Jiloca,Teruel,Aragón,España")
indice_verde_calamocha<-calculate_green_index(datoscalamocha,4326,100)
dtcalamocha<-as.data.frame(indice_verde_calamocha)
calamocha<-summarise(.data=dtcalamocha,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listaragon<-list(
  Utebo= utebo,
  Barbastro= barbastro,
  Monzon= monzon,
  Ejea= ejea,
  Alcaniz= alcaniz,
  Calamocha=calamocha
)



listaaragon<-bind_rows(listaragon, .id="Pueblo")

dtaragon=as.data.frame(listaaragon)
dtaragon
aragon=summarise(.data=dtaragon,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
aragon
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,andalucia,valencia,murcia,aragon,file="Objetos.RData")


