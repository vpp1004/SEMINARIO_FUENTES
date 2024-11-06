library(devtools)
library(greenR)
library(dplyr)


pueblos<-c("Ibiza,Islas Baleares,España","Mallorca,Islas Baleares,España","Menorca,Islas Baleares,España")
indice_verde<-list()

for (i in 1:length(pueblos)){
  datos<- get_osm_data(pueblos[i])
  indice<-calculate_green_index(datos,4326,100)
  dtindice<-as.data.frame(indice)
  indice<-summarise(.data=dtindice,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
  indice_verde[[i]]<-indice
}
str(indice)
View(indice)
datosibiza<-get_osm_data("Ibiza,Islas Baleares,España")
indice_verde_ibiza<-calculate_green_index(datosibiza,4326,100)
dtibiza<-as.data.frame(indice_verde_ibiza)
ibiza<-summarise(.data=dtibiza,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmallorca<-get_osm_data("Mallorca,Islas Baleares,España")
indice_verde_mallorca<-calculate_green_index(datosmallorca,4326,100)
dtmallorca<-as.data.frame(indice_verde_mallorca)
mallorca<-summarise(.data=dtmallorca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmenorca<-get_osm_data("Menorca,Islas Baleares,España")
indice_verde_menorca<-calculate_green_index(datosmenorca,4326,100)
dtmenorca<-as.data.frame(indice_verde_menorca)
menorca<-summarise(.data=dtmenorca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

