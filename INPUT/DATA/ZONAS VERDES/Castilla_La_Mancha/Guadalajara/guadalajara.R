library(devtools)
library(greenR)
library(dplyr)
datosguadalajara<-get_osm_data("Guadalajara,Castilla-La Mancha,España")
indice_verde_guadalajara<-calculate_green_index(datosguadalajara,4326,100)
str(indice_verde_guadalajara)
typeof(indice_verde_guadalajara)
dtguadalajara<-as.data.frame(indice_verde_guadalajara)
guadalajara<-summarise(.data=dtguadalajara,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(guadalajara)
str(guadalajara)