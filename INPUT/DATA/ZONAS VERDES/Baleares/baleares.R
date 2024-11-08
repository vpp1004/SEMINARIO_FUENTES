library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")
datosarevalo<-get_osm_data("Arévalo,Ávila,Castilla y León,05200,España")
indice_verde_arevalo<-calculate_green_index(datosarevalo,4326,100)
dtarevalo<-as.data.frame(indice_verde_arevalo)
arevalo<-summarise(.data=dtarevalo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosarenas<-get_osm_data("Arenas de San Pedro,Ávila,Castilla y León,España")
indice_verde_arenas<-calculate_green_index(datosarenas,4326,100)
dtarenas<-as.data.frame(indice_verde_arenas)
arenas<-summarise(.data=dtarenas,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosaranda<-get_osm_data(("Aranda de Duero,Burgos,Castilla y León,España"))
indice_verde_aranda<-calculate_green_index(datosaranda,4326,100)
dtaranda<-as.data.frame(indice_verde_aranda)
aranda<-summarise(.data=dtaranda,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosmiranda<-get_osm_data(("Miranda de Ebro,Burgos,Castilla y León,España"))
indice_verde_miranda<-calculate_green_index(datosmiranda,4326,100)
dtmiranda<-as.data.frame(indice_verde_miranda)
miranda<-summarise(.data=dtmiranda,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosponferrada<-get_osm_data(("Ponferrada,El Bierzo,León,Castilla y León,España"))
indice_verde_ponferrada<-calculate_green_index(datosponferrada,4326,100)
dtponferrada<-as.data.frame(indice_verde_ponferrada)
ponferrada<-summarise(.data=dtponferrada,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossanandres<-get_osm_data(("San Andrés de Montejos,Ponferrada,El Bierzo,León,Castilla y León ,España"))
indice_verde_sanandres<-calculate_green_index(datossanandres,4326,100)
dtsanandres<-as.data.frame(indice_verde_sanandres)
sanandres<-summarise(.data=dtsanandres,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosaguilar<-get_osm_data(("Aguilar de Campoo,Palencia,Castilla y León,34800,España"))
indice_verde_aguilar<-calculate_green_index(datosaguilar,4326,100)
dtaguilar<-as.data.frame(indice_verde_aguilar)
aguilar<-summarise(.data=dtaguilar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosguardo<-get_osm_data(("Guardo,Palencia,Castilla y León,34800,España"))
indice_verde_guardo<-calculate_green_index(datosguardo,4326,100)
dtguardo<-as.data.frame(indice_verde_guardo)
guardo<-summarise(.data=dtguardo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datosbejar<-get_osm_data(("Bejar,Salamanca,Castilla y León,37700,España"))
indice_verde_bejar<-calculate_green_index(datosbejar,4326,100)
dtbejar<-as.data.frame(indice_verde_bejar)
bejar<-summarise(.data=dtbejar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossantamarta<-get_osm_data(("Santa Marta de Tormes,Salamanca,Castilla y León,España"))
indice_verde_santamarta<-calculate_green_index(datossantamarta,4326,100)
dtsantamarta<-as.data.frame(indice_verde_santamarta)
santamarta<-summarise(.data=dtsantamarta,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datoscuellar<-get_osm_data(("Cuéllar,Castilla y León,40200,España"))
indice_verde_cuellar<-calculate_green_index(datoscuellar,4326,100)
dtcuellar<-as.data.frame(indice_verde_cuellar)
cuellar<-summarise(.data=dtcuellar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalmazan<-get_osm_data("Almazán,Soria,Castilla y León España")
indice_verde_almazan<-calculate_green_index(datosalmazan,4326,100)
dtalmazan<-as.data.frame(indice_verde_almazan)
almazan<-summarise(.data=dtalmazan,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datoselburgo<-get_osm_data("El Burgo de Osma,Soria,Castilla y León,España")
indice_verde_elburgo<-calculate_green_index(datoselburgo,4326,100)
dtelburgo<-as.data.frame(indice_verde_elburgo)
elburgo<-summarise(.data=dtelburgo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


datoslaguna<-get_osm_data(("Laguna de Duero,Valladolid,Castilla y León,47140,España"))
indice_verde_laguna<-calculate_green_index(datoslaguna,4326,100)
dtlaguna<-as.data.frame(indice_verde_laguna)
laguna<-summarise(.data=dtlaguna,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosbenavente<-get_osm_data(("Benavente,Zamora,Castilla y León,49600,España"))
indice_verde_benavente<-calculate_green_index(datosbenavente,4326,100)
dtbenavente<-as.data.frame(indice_verde_benavente)
benavente<-summarise(.data=dtbenavente,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostoro<-get_osm_data(("Toro,Zamora,Castilla y León,49800,España"))
indice_verde_toro<-calculate_green_index(datostoro,4326,100)
dttoro<-as.data.frame(indice_verde_toro)
toro<-summarise(.data=dttoro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))


listacastilla<-list(
  Arevalo=arevalo,
  Arenas_de_San_Pedro=arenas,
  Benavente=benavente,
  Toro=toro,
  Cuellar=cuellar,
  La_laguna=laguna,
  Ponferrada=ponferrada,
  San_Andres=sanandres,
  Santa_Marta=santamarta,
  Bejar=bejar,
  Aguilar_de_Campoo=aguilar,
  Guardo=guardo,
  Aranda_de_Duero=aranda,
  Miranda_de_Ebro=miranda,
  Burgo_de_Osma=elburgo,
  Almazan=almazan
)
listcastilla<-bind_rows(listacastilla, .id="Pueblo")

dtcastilla=as.data.frame(listcastilla)

dtcastilla
castilla=summarise(.data=dtcastilla,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))
castilla
save(cantabria,asturias,rioja,paisvasco,navarra,extremadura,canarias,cataluna,galicia,baleares,castilla,file="Objetos.RData")

load("Objetos.RData")
