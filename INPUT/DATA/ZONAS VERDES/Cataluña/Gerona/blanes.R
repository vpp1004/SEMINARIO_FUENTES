library(devtools)
library(greenR)
library(dplyr)
datosblanes<-get_osm_data("Blanes,la Selva,Gerona,Cataluña,17300,España")
indice_verde_blanes<-calculate_green_index(datosblanes,4326,100)
str(indice_verde_blanes)
typeof(indice_verde_blanes)
dtblanes<-as.data.frame(indice_verde_blanes)
blanes<-summarise(.data=dtblanes,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(blanes)
str(blanes)