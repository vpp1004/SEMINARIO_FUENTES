library(devtools)
library(greenR)
library(dplyr)

load("Objetos.RData")
datosestella<-get_osm_data("Estella,Tierra Estella,Navarra,31200,España")
indice_verde_estella<-calculate_green_index(datosestella,4326,100)
dtestella<-as.data.frame(indice_verde_estella)
estella<-summarise(.data=dtestella,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostudela<-get_osm_data("Tudela,Ribera,Navarra,31500,España")
indice_verde_tudela<-calculate_green_index(datostudela,4326,100)
dttudela<-as.data.frame(indice_verde_tudela)
tudela<-summarise(.data=dttudela,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listanavarra<-list(
  Estella=estella,
  Tudela=tudela
)

listnavarra<-bind_rows(listanavarra, .id="Pueblo")
dtnavarra=as.data.frame(listnavarra)
dtnavarra
navarra=summarise(.data=dtnavarra,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))


save(cantabria,asturias,navarra,file="Objetos.RData")
