library(devtools)
library(greenR)
library(dplyr)
datoscuenca<-get_osm_data("Cuenca,Castilla-La Mancha,España")
indice_verde_cuenca<-calculate_green_index(datoscuenca,4326,100)
str(indice_verde_cuenca)
typeof(indice_verde_cuenca)
dtcuenca<-as.data.frame(indice_verde_cuenca)
cuenca<-summarise(.data=dtcuenca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(cuenca)
str(cuenca)