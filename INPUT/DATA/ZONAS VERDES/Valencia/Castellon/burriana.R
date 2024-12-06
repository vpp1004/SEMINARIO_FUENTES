library(devtools)
library(greenR)
library(dplyr)
datosburriana-get_osm_data("Burriana,Plana Baja,Castellón,Comunidad Valenciana,12530,España")
indice_verde_burriana<-calculate_green_index(datosburriana,4326,100)
dtburriana<-as.data.frame(indice_verde_burriana)
burriana<-summarise(.data=dtburriana,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))