library(devtools)
library(greenR)
library(dplyr)

datosferrol<-get_osm_data("Ferrol,La Coruña,España")
indice_verde_ferrol<-calculate_green_index(datosferrol,4326,100)
dtferrol<-as.data.frame(indice_verde_ferrol)
ferrol<-summarise(.data=dtferrol,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoscoruna<-get_osm_data("La Coruña,Galicia,España")
indice_verde_coruna<-calculate_green_index(datoscoruna,4326,100)
dtcoruna<-as.data.frame(indice_verde_coruna)
coruna<-summarise(.data=dtcoruna,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmonforte<-get_osm_data("Monforte de Lemos,Tierra de Lemos,Lugo,Galicia,España")
indice_verde_monforte<-calculate_green_index(datosmonforte,4326,100)
dtmonforte<-as.data.frame(indice_verde_monforte)
monforte<-summarise(.data=dtmonforte,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosvivero<-get_osm_data("Vivero,Mariña Occidental,Lugo,Galicia,España")
indice_verde_vivero<-calculate_green_index(datosvivero,4326,100)
dtvivero<-as.data.frame(indice_verde_vivero)
vivero<-summarise(.data=dtvivero,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoscarballino<-get_osm_data("O Carballiño,Orense,Galicia,España")
indice_verde_carballino<-calculate_green_index(datoscarballino,4326,100)
dtcarballino<-as.data.frame(indice_verde_carballino)
carballino<-summarise(.data=dtcarballino,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosverin<-get_osm_data("Verin,Orense,Galicia,España")
indice_verde_verin<-calculate_green_index(datosverin,4326,100)
dtverin<-as.data.frame(indice_verde_verin)
verin<-summarise(.data=dtverin,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossangenjo<-get_osm_data("Sangenjo,Salnés,Pontevedra,Galicia,España")
indice_verde_sangenjo<-calculate_green_index(datossangenjo,4326,100)
dtsangenjo<-as.data.frame(indice_verde_sangenjo)
sangenjo<-summarise(.data=dtsangenjo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosvigo<-get_osm_data("Vigo,Pontevedra,Galicia,España")
indice_verde_vigo<-calculate_green_index(datosvigo,4326,100)
dtvigo<-as.data.frame(indice_verde_vigo)
vigo<-summarise(.data=dtvigo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listagalicia<-list(
  Coruna=coruna,
  Verin= verin,
  Vigo = vigo,
  Sangenjo = sangenjo,
  Carballino = carballino,
  Ferrol= ferrol,
  Monforte = monforte, 
  Vivero = vivero
)
listgalicia<-bind_rows(listagalicia, .id="Pueblo")
dtgalicia=as.data.frame(listgalicia)
galicia=summarise(.data=dtgalicia,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
