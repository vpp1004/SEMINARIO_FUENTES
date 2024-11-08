library(devtools)
library(greenR)
library(dplyr)

load("Objetos.RData")
datosnbadajoz<-get_osm_data(("Badajoz,Extremadura.España"))
indice_verde_badajoz<-calculate_green_index(datosbadajoz,4326,100)
str(indice_verde_badajoz)
dtbadajoz<-as.data.frame(indice_verde_badajoz)
badajoz<-summarise(.data=dtbadajoz,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
str(badajoz)



datosjerez_caballeros<-get_osm_data(("Jerez de los Caballeros,Sierra Suroeste,Badajoz,Extremadura,España"))
indice_verde_jerez_caballeros<-calculate_green_index(datosjerez_caballeros,4326,100)
dtjerez_caballeros<-as.data.frame(indice_verde_jerez_caballeros)
jerez_caballeros<-summarise(.data=dtjerez_caballeros,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))



datosmerida<-get_osm_data(("Mérida,Badajoz,Extremadura,España"))
indice_verde_merida<-calculate_green_index(datosmerida,4326,100)
dtmerida<-as.data.frame(indice_verde_merida)
merida<-summarise(.data=dtmerida,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
 
datosnavalmoral<-get_osm_data(("Navalmoral de la Mata,Caceres,Extremadura.España"))
indice_verde_navalmoral<-calculate_green_index(datosnavalmoral,4326,100)
dtnavalmoral<-as.data.frame(indice_verde_navalmoral)
navalmoral<-summarise(.data=dtnavalmoral,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosplasencia<-get_osm_data(("Plasencia,Caceres,Extremadura.España"))
indice_verde_plasencia<-calculate_green_index(datosplasencia,4326,100)
dtplasencia<-as.data.frame(indice_verde_plasencia)
plasencia<-summarise(.data=dtplasencia,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listaextremadura<-list(
  Jerez_de_los_caballeros= jerez_caballeros,
  Merida=merida,
  Navalmoral_de_la_Mata=navalmoral,
  Plasencia=plasencia
)

listextremadura<-bind_rows(listaextremadura, .id="Pueblo")

dtextremadura=as.data.frame(listextremadura)

extremadura=summarise(.data=dtextremadura,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

extremadura
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,file="Objetos.RData")
