library(devtools)
library(greenR)
library(dplyr)
datospuente_genil<-get_osm_data("Puente Genil,Córdoba,Andalucía, 14500,España")
indice_verde_puente_genil<-calculate_green_index(datospuente_genil,4326,100)
str(indice_verde_puente_genil)
typeof(indice_verde_puente_genil)
dtpuente_genil<-as.data.frame(indice_verde_puente_genil)
puente_genil<-summarise(.data=dtpuente_genil,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(puente_genil)
str(puente_genil)