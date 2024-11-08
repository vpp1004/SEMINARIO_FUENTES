library(devtools)
library(greenR)
library(dplyr)

load("Objetos.RData")
datosalfaro<-get_osm_data("Alfaro,La Rioja,26540,España")
indice_verde_alfaro<-calculate_green_index(datosalfaro,4326,100)
dtalfaro<-as.data.frame(indice_verde_alfaro)
alfaro<-summarise(.data=dtalfaro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosnajera<-get_osm_data("Nájera,La Rioja,26300,España")
indice_verde_najera<-calculate_green_index(datosnajera,4326,100)
dtnajera<-as.data.frame(indice_verde_najera)
najera<-summarise(.data=dtnajera,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listrioja<-list(
  Alfaro=alfaro,
  Najera=najera
)

listarioja<-bind_rows(listrioja, .id="Pueblo")
dtrioja=as.data.frame(listarioja)
dtrioja
rioja=summarise(.data=dtrioja,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))


save(cantabria,asturias,navarra,rioja,file="Objetos.RData")

