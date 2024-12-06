library(devtools)
library(greenR)
library(dplyr)
datosnavalmoral<-get_osm_data(("Navalmoral de la Mata,Caceres,Extremadura.España"))
indice_verde_navalmoral<-calculate_green_index(datosnavalmoral,4326,100)
str(indice_verde_navalmoral)
dtnavalmoral<-as.data.frame(indice_verde_navalmoral)
navalmoral<-summarise(.data=dtnavalmoral,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
str(navalmoral)