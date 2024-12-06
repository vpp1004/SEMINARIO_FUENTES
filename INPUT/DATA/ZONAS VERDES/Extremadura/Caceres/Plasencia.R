library(devtools)
library(greenR)
library(dplyr)
datosplasencia<-get_osm_data(("Plasencia,Caceres,Extremadura.España"))
indice_verde_plasencia<-calculate_green_index(datosplasencia,4326,100)
str(indice_verde_plasencia)
dtplasencia<-as.data.frame(indice_verde_plasencia)
plasencia<-summarise(.data=dtplasencia,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
str(plasencia)