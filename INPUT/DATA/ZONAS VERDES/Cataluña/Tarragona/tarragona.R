library(devtools)
library(greenR)
library(dplyr)
datostarragona<-get_osm_data("Tarragona,Cataluña,España")
indice_verde_tarragona<-calculate_green_index(datostarragona,4326,100)
str(indice_verde_tarragona)
typeof(indice_verde_tarragona)
dttarragona<-as.data.frame(indice_verde_tarragona)
tarragona<-summarise(.data=dttarragona,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(tarragona)
str(tarragona)