library(devtools)
library(greenR)
library(dplyr)
datosmarbella<-get_osm_data("Marbella,Costa del Sol Occidental,Málaga,Andalucía,España")
indice_verde_marbella<-calculate_green_index(datosmarbella,4326,100)
str(indice_verde_marbella)
typeof(indice_verde_marbella)
dtmarbella<-as.data.frame(indice_verde_marbella)
marbella<-summarise(.data=dtmarbella,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(marbella)
str(marbella)

