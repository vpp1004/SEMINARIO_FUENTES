library(devtools)
library(greenR)
library(dplyr)
datosestella<-get_osm_data("Estella,Tierra Estella,Navarra,31200,España")
indice_verde_estella<-calculate_green_index(datosestella,4326,100)
str(indice_verde_estella)
typeof(indice_verde_estella)
dtestella<-as.data.frame(indice_verde_estella)
estella<-summarise(.data=dtestella,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(estella)
str(estella)