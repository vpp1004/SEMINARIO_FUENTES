library(devtools)
library(greenR)
library(dplyr)
datoshuelva<-get_osm_data("Huelva,Andalucía,España")
indice_verde_huelva<-calculate_green_index(datoshuelva,4326,100)
str(indice_verde_huelva)
typeof(indice_verde_huelva)
dthuelva<-as.data.frame(indice_verde_huelva)
huelva<-summarise(.data=dthuelva,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(huelva)
str(huelva)