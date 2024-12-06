library(devtools)
library(greenR)
library(dplyr)
datoscalamocha<-get_osm_data("Calamocha,Jiloca,Teruel,Aragón,España")
indice_verde_calamocha<-calculate_green_index(datoscalamocha,4326,100)
str(indice_verde_calamocha)
typeof(indice_verde_calamocha)
dtcalamocha<-as.data.frame(indice_verde_calamocha)
calamocha<-summarise(.data=dtcalamocha,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(calamocha)
str(calamocha)