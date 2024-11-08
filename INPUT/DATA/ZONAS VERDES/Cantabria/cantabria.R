library(devtools)
library(greenR)
library(dplyr)

datoscastro<-get_osm_data("Castro-Urdiales,Cantabria,España")
indice_verde_castro<-calculate_green_index(datoscastro,4326,100)
dtcastro<-as.data.frame(indice_verde_castro)
castro<-summarise(.data=dtcastro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostorrelavega<-get_osm_data("Torrelavega,Cantabria,España")
indice_verde_torrelavega<-calculate_green_index(datostorrelavega,4326,100)
dttorrelavega<-as.data.frame(indice_verde_torrelavega)
torrelavega<-summarise(.data=dttorrelavega,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listacantabria<-list(
  Castro_urdiales= castro,
  Torrelavega= torrelavega
)

listcantabria<-bind_rows(listacantabria, .id="Pueblo")
  
dtcantabria=as.data.frame(listcantabria)
 
dtcantabria 
cantabria=summarise(.data=dtcantabria,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

cantabria
save(cantabria,file="Objetos.RData")
load("Objetos.RData")
