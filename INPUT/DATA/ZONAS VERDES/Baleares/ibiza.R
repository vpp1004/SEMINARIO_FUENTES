library(devtools)
library(greenR)
library(dplyr)
datosibiza<-get_osm_data("Ibiza,Islas Baleares,España")
indice_verde_ibiza<-calculate_green_index(datosibiza,4326,100)
str(indice_verde_ibiza)
typeof(indice_verde_ibiza)
dtibiza<-as.data.frame(indice_verde_ibiza)
ibiza<-summarise(.data=dtibiza,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(ibiza)
str(ibiza)