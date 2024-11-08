library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datosblanes<-get_osm_data("Blanes,la Selva,Gerona,Cataluña,17300,España")
indice_verde_blanes<-calculate_green_index(datosblanes,4326,100)
dtblanes<-as.data.frame(indice_verde_blanes)
blanes<-summarise(.data=dtblanes,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosfigueras<-get_osm_data("Figueras,Alto Ampurdán,Gerona,Cataluña,España")
indice_verde_figueras<-calculate_green_index(datosfigueras,4326,100)
dtfigueras<-as.data.frame(indice_verde_figueras)
figueras<-summarise(.data=dtfigueras,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosbalaguer<-get_osm_data("Balaguer,Noguera,Lérida,Cataluña,25600,España")
indice_verde_balaguer<-calculate_green_index(datosbalaguer,4326,100)
dtbalaguer<-as.data.frame(indice_verde_balaguer)
balaguer<-summarise(.data=dtbalaguer,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datostarrega<-get_osm_data("Tarrega,Urgel,Lérida,Cataluña,España")
indice_verde_tarrega<-calculate_green_index(datostarrega,4326,100)
dttarrega<-as.data.frame(indice_verde_tarrega)
tarrega<-summarise(.data=dttarrega,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosreus<-get_osm_data("Reus,Bajo Campo,Tarragona, Cataluña,España")
indice_verde_reus<-calculate_green_index(datosreus,4326,100)
dtreus<-as.data.frame(indice_verde_reus)
reus<-summarise(.data=dtreus,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossalou<-get_osm_data("Salou,Tarragonés,Tarragona,Cataluña,43840,España")
indice_verde_salou<-calculate_green_index(datossalou,4326,100)
dtsalou<-as.data.frame(indice_verde_salou)
salou<-summarise(.data=dtsalou,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listacataluna<-list(
  Figueras=figueras,
  Salou=salou,
  Reus=reus,
  Tarrega=tarrega,
  Balaguer=balaguer,
  Blanes=blanes
)

listcataluna<-bind_rows(listacataluna, .id="Pueblo")

dtcataluna=as.data.frame(listcataluna)

cataluna=summarise(.data=dtcataluna,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

cataluna
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,file="Objetos.RData")
