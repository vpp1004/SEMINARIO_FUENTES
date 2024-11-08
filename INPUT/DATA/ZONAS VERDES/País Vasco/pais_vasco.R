library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datosalegria<-get_osm_data("Alegría,Llanada Alavesa,Álava,País Vasco,España")
indice_verde_alegria<-calculate_green_index(datosalegria,4326,100)
dtalegria<-as.data.frame(indice_verde_alegria)
alegria<-summarise(.data=dtalegria,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosiruna<-get_osm_data("Iruña de Oca,Cuadrilla de Añaña,Álava,País Vasco,01230,España")
indice_verde_iruna<-calculate_green_index(datosiruna,4326,100)
dtiruna<-as.data.frame(indice_verde_iruna)
iruna<-summarise(.data=dtiruna,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datoguetaria<-get_osm_data("Guetaria,Urola Costa,Guipúzcoa,País Vasco,España")
indice_verde_guetaria<-calculate_green_index(datoguetaria,4326,100)
dtguetaria<-as.data.frame(indice_verde_guetaria)
guetaria<-summarise(.data=dtguetaria,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosirun<-get_osm_data("Irún,Bajo Bidasoa,Guipúzcoa,País Vasco,España")
indice_verde_irun<-calculate_green_index(datosirun,4326,100)
dtirun<-as.data.frame(indice_verde_irun)
irun<-summarise(.data=dtirun,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))



datosbaracaldo<-get_osm_data("Baracaldo,Vizcaya,País Vasco,España")
indice_verde_baracaldo<-calculate_green_index(datosbaracaldo,4326,100)
dtbaracaldo<-as.data.frame(indice_verde_baracaldo)
baracaldo<-summarise(.data=dtbaracaldo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosgetxo<-get_osm_data("Guecho,Vizcaya,País Vasco,España")
indice_verde_getxo<-calculate_green_index(datosgetxo,4326,100)
dtgetxo<-as.data.frame(indice_verde_getxo)
getxo<-summarise(.data=dtgetxo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))



listpaisvasco<-list(
  Alegria=alegria,
  Iruna_de_oca=iruna,
  Guetaria=guetaria,
  Irun=irun,
  Baracaldo=baracaldo,
  Getxo=getxo

)

listapaisvasco<-bind_rows(listpaisvasco, .id="Pueblo")
dtpaisvasco=as.data.frame(listapaisvasco)
dtpaisvasco
paisvasco=summarise(.data=dtpaisvasco,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

save(cantabria,asturias,navarra,rioja,paisvasco,file="Objetos.RData")
