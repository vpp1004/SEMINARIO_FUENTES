library(devtools)
library(greenR)
library(dplyr)
datosbarcelona<-get_osm_data("Barcelona,Cataluña,España")
indice_verde_barcelona<-calculate_green_index(datosbarcelona,4326,100)
str(indice_verde_barcelona)
typeof(indice_verde_barcelona)
dtbarcelona<-as.data.frame(indice_verde_barcelona)
barcelona<-summarise(.data=dtbarcelona,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(barcelona)
str(barcelona)