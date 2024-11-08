library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datoslanzarote<-get_osm_data("Lanzarote,Las Palmas,Canarias,España")
indice_verde_lanzarote<-calculate_green_index(datoslanzarote,4326,100)
dtlanzarote<-as.data.frame(indice_verde_lanzarote)
lanzarote<-summarise(.data=dtlanzarote,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosfuerteventura<-get_osm_data("Fuerteventura,Canarias,España")
indice_verde_fuerteventura<-calculate_green_index(datosfuerteventura,4326,100)
dtfuerteventura<-as.data.frame(indice_verde_fuerteventura)
fuerteventura<-summarise(.data=dtfuerteventura,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossancristobal<-get_osm_data("San Cristobal de La Laguna,Santa Cruz de Tenerife, Canarias ,España")
indice_verde_san_critobal<-calculate_green_index(datossancristobal,4326,100)
dtsancristobal<-as.data.frame(indice_verde_san_critobal)
san_cristobal<-summarise(.data=dtsancristobal,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosvalverde<-get_osm_data("Valverde,Santa Cruz de Tenerife,Canarias,España")
indice_verde_valverde<-calculate_green_index(datosvalverde,4326,100)
dtvalverde<-as.data.frame(indice_verde_valverde)
valverde<-summarise(.data=dtvalverde,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listacanarias<-list(
  Lanzarote= lanzarote,
  Fuerteventura=fuerteventura,
  San_Cristobal=san_cristobal,
  Valverde=valverde
)

listcanarias<-bind_rows(listacanarias, .id="Pueblo")

dtcanarias=as.data.frame(listcanarias)

canarias=summarise(.data=dtcanarias,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

canarias
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,file="Objetos.RData")
