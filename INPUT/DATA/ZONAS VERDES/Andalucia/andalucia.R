library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datostomares<-get_osm_data("Tomares,Sevilla,Andalucía,41940,España")
indice_verde_tomares<-calculate_green_index(datostomares,4326,100)
dttomares<-as.data.frame(indice_verde_tomares)
tomares<-summarise(.data=dttomares,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoscamas<-get_osm_data("Camas,Sevilla,Andalucía,España")
indice_verde_camas<-calculate_green_index(datoscamas,4326,100)
dtcamas<-as.data.frame(indice_verde_camas)
camas<-summarise(.data=dtcamas,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmijas<-get_osm_data("Mijas,Costa del Sol Occidental,Málaga,Andalucía,España")
indice_verde_mijas<-calculate_green_index(datosmijas,4326,100)
dtmijas<-as.data.frame(indice_verde_mijas)
mijas<-summarise(.data=dtmijas,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosmarbella<-get_osm_data("Marbella,Costa del Sol Occidental,Málaga,Andalucía,España")
indice_verde_marbella<-calculate_green_index(datosmarbella,4326,100)
dtmarbella<-as.data.frame(indice_verde_marbella)
marbella<-summarise(.data=dtmarbella,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoslinares<-get_osm_data("Linares,Jaén,Andalucía,23700,España")
indice_verde_linares<-calculate_green_index(datoslinares,4326,100)
dtlinares<-as.data.frame(indice_verde_linares)
linares<-summarise(.data=dtlinares,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosandujar<-get_osm_data("Andújar,Jaén,Andalucía,España")
indice_verde_andujar<-calculate_green_index(datosandujar,4326,100)
dtandujar<-as.data.frame(indice_verde_andujar)
andujar<-summarise(.data=dtandujar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalmonte<-get_osm_data("Almonte,El Condado,Huelva, Andalucía,España")
indice_verde_almonte<-calculate_green_index(datosalmonte,4326,100)
dtalmonte<-as.data.frame(indice_verde_almonte)
almonte<-summarise(.data=dtalmonte,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmotril<-get_osm_data("Motril,Comarca de la Costa Granadina,Granada,Andalucía,España")
indice_verde_motril<-calculate_green_index(datosmotril,4326,100)
dtmotril<-as.data.frame(indice_verde_motril)
motril<-summarise(.data=dtmotril,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalmunecar<-get_osm_data("Almuñecar,Comarca de la Costa Granadina,Granada,Andalucía,18690,España")
indice_verde_almunecar<-calculate_green_index(datosalmunecar,4326,100)
dtalmunecar<-as.data.frame(indice_verde_almunecar)
almunecar<-summarise(.data=dtalmunecar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datospuente_genil<-get_osm_data("Puente Genil,Córdoba,Andalucía, 14500,España")
indice_verde_puente_genil<-calculate_green_index(datospuente_genil,4326,100)
dtpuente_genil<-as.data.frame(indice_verde_puente_genil)
puente_genil<-summarise(.data=dtpuente_genil,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoslucena<-get_osm_data("Lucena,Córdoba,Andalucía,14900,España")
indice_verde_lucena<-calculate_green_index(datoslucena,4326,100)
dtlucena<-as.data.frame(indice_verde_lucena)
lucena<-summarise(.data=dtlucena,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosalgeciras<-get_osm_data("Algeciras,Campo de Gibraltar,Cádiz,Andalucía,España")
indice_verde_algeciras<-calculate_green_index(datosalgeciras,4326,100)
dtalgeciras<-as.data.frame(indice_verde_algeciras)
algeciras<-summarise(.data=dtalgeciras,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosroquetas<-get_osm_data("Roquetas de Mar,Almería,Andalucía,España")
indice_verde_roquetas<-calculate_green_index(datosroquetas,4326,100)
dtroquetas<-as.data.frame(indice_verde_roquetas)
roquetas<-summarise(.data=dtroquetas,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoselejido<-get_osm_data("El Ejido,Almería,Andalucía,España")
indice_verde_elejido<-calculate_green_index(datoselejido,4326,100)
dtelejido<-as.data.frame(indice_verde_elejido)
elejido<-summarise(.data=dtelejido,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listandalucia<-list(
  Lucena=lucena,
  Linares=linares,
  Roquetas=roquetas,
  Algeciras=algeciras,
  Almonte=almonte,
  Andujar=andujar,
  Almunecar=almunecar,
  El_Ejido=elejido,
  Camas=camas,
  Puente_genil=puente_genil,
  Motril=motril,
  Mijas=mijas,
  Marbella=marbella,
  Tomares=tomares
  
)
listaandalucia<-bind_rows(listandalucia, .id="Pueblo")

dtandalucia=as.data.frame(listaandalucia)
dtandalucia
andalucia=summarise(.data=dtandalucia,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
andalucia
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,mancha,andalucia,file="Objetos.RData")
