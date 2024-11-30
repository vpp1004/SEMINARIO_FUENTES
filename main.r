###Instalación de paquetes 
install.packages("pxR")
install.packages("tidyverse")
install.packages("rjson")
install.packages("tidyjson")
install.packages("ggplot2")

###  CARGA DE PAQUETES:
library(pxR)
library(tidyverse)
library(rjson)
library(tidyjson)
library(jsonlite)
library(dplyr)
library(ggplot2)

####Carga de todos los datos necesarios para desarrollar el proyecto 
load("Objetos.RData")

### Datos de personas que toman alcohol por comunidades 
casos_alcohol<-read.px("INPUT/DATA/CASOS_ALCOHOL/CasosAlcoholComunidades.px")
dtalcohol<-as.data.frame(casos_alcohol)
dtalcohol
alcohol<-select(.data =dtalcohol,value,Consumo.de.bebidas.alcohólicas,Comunidad.autónoma) %>%
  filter(Consumo.de.bebidas.alcohólicas=="Sí ha consumido")
alcohol<-as.data.frame(alcohol)%>%
  select(Comunidad.autónoma,value)
alcohol <- alcohol[alcohol$Comunidad.autónoma != "Total Nacional", ]
alcohol[is.na(alcohol$Comunidad_autonoma) == FALSE, ]
alcohol

#CARGA DE DATOS DE CASOS DE CANCER EN ESPAÑA POR COMUNIDADES:
archivo <-fromJSON("INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer.json")
dtcancer<-as.data.frame(archivo$Respuesta$Datos$Metricas$Datos)
cancer<-select(.data=dtcancer,Parametro,Valor)
cancer

#CARGA DE DATOS DE ZONAS VERDES EN ESPAÑA POR COMUNIDADES:
####El código aquí presentado se obtiene directamente de un respositorio de github realizando diferentes operaciones
####Los datos finalmente se usan se cargan direcamente al cargar todos los datos al principio
load("Objetos.RData")

###Proceso para la creación de diferentes comunidades autónoma 
######Se producirá el proceso de creación de diferentes municipios que crearan la comunidad autónoma y por último toda la tabla 
####Andalucía 
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
andalucia=summarise(.data=dtandalucia,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

####Asturias 
#####Aragón 
datosutebo<-get_osm_data("Utebo,Zaragoza,Aragón,España")
indice_verde_utebo<-calculate_green_index(datosutebo,4326,100)
dtutebo<-as.data.frame(indice_verde_utebo)
utebo<-summarise(.data=dtutebo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosejea<-get_osm_data("Ejea de los Caballeros,Cinco Villas,Zaragoza,Aragón,50600,España")
indice_verde_ejea<-calculate_green_index(datosejea,4326,100)
dtejea<-as.data.frame(indice_verde_ejea)
ejea<-summarise(.data=dtejea,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosbarbastro<-get_osm_data("Barbastro,Somontano de Barbastro,Huesca,Aragón,22300,España")
indice_verde_barbastro<-calculate_green_index(datosbarbastro,4326,100)
dtbarbastro<-as.data.frame(indice_verde_barbastro)
barbastro<-summarise(.data=dtbarbastro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmonzon<-get_osm_data("Monzón,Cinca Medio,Huesca,Aragón,España")
indice_verde_monzon<-calculate_green_index(datosmonzon,4326,100)
dtmonzon<-as.data.frame(indice_verde_monzon)
monzon<-summarise(.data=dtmonzon,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalcaniz<-get_osm_data("Alcañiz,Bajo Aragón,Teruel,Aragón ,España")
indice_verde_alcaniz<-calculate_green_index(datosalcaniz,4326,100)
dtalcaniz<-as.data.frame(indice_verde_alcaniz)
alcaniz<-summarise(.data=dtalcaniz,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoscalamocha<-get_osm_data("Calamocha,Jiloca,Teruel,Aragón,España")
indice_verde_calamocha<-calculate_green_index(datoscalamocha,4326,100)
dtcalamocha<-as.data.frame(indice_verde_calamocha)
calamocha<-summarise(.data=dtcalamocha,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listaragon<-list(
  Utebo= utebo,
  Barbastro= barbastro,
  Monzon= monzon,
  Ejea= ejea,
  Alcaniz= alcaniz,
  Calamocha=calamocha
)

listaaragon<-bind_rows(listaragon, .id="Pueblo")
dtaragon=as.data.frame(listaaragon)
aragon=summarise(.data=dtaragon,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

##### Baleares 
load("Objetos.RData")
datosibiza<-get_osm_data("Ibiza,Islas Baleares,España")
indice_verde_ibiza<-calculate_green_index(datosibiza,4326,100)
dtibiza<-as.data.frame(indice_verde_ibiza)
ibiza<-summarise(.data=dtibiza,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmenorca<-get_osm_data("Menorca,Islas Baleares,España")
indice_verde_menorca<-calculate_green_index(datosmenorca,4326,100)
dtmenorca<-as.data.frame(indice_verde_menorca)
menorca<-summarise(.data=dtmenorca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listabaleares<-list(
  Ibiza=ibiza,
  Menorca=menorca
)
listbaleares<-bind_rows(listabaleares, .id="Pueblo")
dtbaleares=as.data.frame(listbaleares)
baleares=summarise(.data=dtbaleares,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

##### Canarias 
datoslanzarote<-get_osm_data("Lanzarote,Las Palmas,Canarias,España")
indice_verde_lanzarote<-calculate_green_index(datoslanzarote,4326,100)
dtlanzarote<-as.data.frame(indice_verde_lanzarote)
lanzarote<-summarise(.data=dtlanzarote,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosfuerteventura<-get_osm_data("Fuerteventura,Canarias,España")
indice_verde_fuerteventura<-calculate_green_index(datosfuerteventura,4326,100)
dtfuerteventura<-as.data.frame(indice_verde_fuerteventura)
fuerteventura<-summarise(.data=dtfuerteventura,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossancristobal<-get_osm_data("San Cristobal de La Laguna,Santa Cruz de Tenerife, Canarias ,España")
indice_verde_san_critobal<-calculate_green_index(datossancristobal,4326,100)
dtsancristobal<-as.data.frame(indice_verde_san_critobal)
san_cristobal<-summarise(.data=dtsancristobal,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosvalverde<-get_osm_data("Valverde,Santa Cruz de Tenerife,Canarias,España")
indice_verde_valverde<-calculate_green_index(datosvalverde,4326,100)
dtvalverde<-as.data.frame(indice_verde_valverde)
valverde<-summarise(.data=dtvalverde,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listacanarias<-list(
  Lanzarote= lanzarote,
  Fuerteventura=fuerteventura,
  San_Cristobal=san_cristobal,
  Valverde=valverde
)

listcanarias<-bind_rows(listacanarias, .id="Pueblo")
dtcanarias=as.data.frame(listcanarias)
canarias=summarise(.data=dtcanarias,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))


##### Cantabria 
datoscastro<-get_osm_data("Castro-Urdiales,Cantabria,España")
indice_verde_castro<-calculate_green_index(datoscastro,4326,100)
dtcastro<-as.data.frame(indice_verde_castro)
castro<-summarise(.data=dtcastro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostorrelavega<-get_osm_data("Torrelavega,Cantabria,España")
indice_verde_torrelavega<-calculate_green_index(datostorrelavega,4326,100)
dttorrelavega<-as.data.frame(indice_verde_torrelavega)
torrelavega<-summarise(.data=dttorrelavega,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listacantabria<-list(
  Castro_urdiales= castro,
  Torrelavega= torrelavega
)

listcantabria<-bind_rows(listacantabria, .id="Pueblo")
dtcantabria=as.data.frame(listcantabria)
cantabria=summarise(.data=dtcantabria,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))


#### #Castilla y León 
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
castilla=summarise(.data=dtcastilla,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

#####Castilla - La Mancha 
datostalavera<-get_osm_data("Talavera de la Reina,Toledo,Castilla-La Mancha,España")
indice_verde_talavera<-calculate_green_index(datostalavera,4326,100)
dttalavera<-as.data.frame(indice_verde_talavera)
talavera<-summarise(.data=dttalavera,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosoropesa<-get_osm_data("Oropesa,Toledo,Castilla-La Mancha,España")
indice_verde_oropesa<-calculate_green_index(datosoropesa,4326,100)
dtoropesa<-as.data.frame(indice_verde_oropesa)
oropesa<-summarise(.data=dtoropesa,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datoscabanillas<-get_osm_data("Cabanillas del Campo,Guadalajara,Castilla-La Mancha,19171,España")
indice_verde_cabanillas<-calculate_green_index(datoscabanillas,4326,100)
dtcabanillas<-as.data.frame(indice_verde_cabanillas)
cabanillas<-summarise(.data=dtcabanillas,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosazuqueca<-get_osm_data("Azuqueca de Henares,Guadalajara,Castilla-La Mancha,19200,España")
indice_verde_azuqueca<-calculate_green_index(datosazuqueca,4326,100)
dtazuqueca<-as.data.frame(indice_verde_azuqueca)
azuqueca<-summarise(.data=dtazuqueca,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosvillanueva<-get_osm_data("Villanueva de la Jara,Cuenca,Castilla-La Mancha,16230,España")
indice_verde_villanueva<-calculate_green_index(datosvillanueva,4326,100)
dtvillanueva<-as.data.frame(indice_verde_villanueva)
villanueva<-summarise(.data=dtvillanueva,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostarancon<-get_osm_data("Tarancón,Cuenca,Castilla-La Mancha,16400,España")
indice_verde_tarancon<-calculate_green_index(datostarancon,4326,100)
dttarancon<-as.data.frame(indice_verde_tarancon)
tarancon<-summarise(.data=dttarancon,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostomelloso<-get_osm_data("Tomelloso,Ciudad Real,Castilla-La Mancha,13700,España")
indice_verde_tomelloso<-calculate_green_index(datostomelloso,4326,100)
dttomelloso<-as.data.frame(indice_verde_tomelloso)
tomelloso<-summarise(.data=dttomelloso,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalcazar<-get_osm_data("Alcázar de San Juan,Ciudad Real,Castilla-La Mancha 13600,España")
indice_verde_alcazar<-calculate_green_index(datosalcazar,4326,100)
dtalcazar<-as.data.frame(indice_verde_alcazar)
alcazar<-summarise(.data=dtalcazar,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosalmansa<-get_osm_data("Almansa,Albacete,Castilla- La Mancha,España")
indice_verde_almansa<-calculate_green_index(datosalmansa,4326,100)
dtalmansa<-as.data.frame(indice_verde_almansa)
almansa<-summarise(.data=dtalmansa,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listamancha<-list(
  Talavera=talavera,
  Oropesa=oropesa,
  Tarancon=tarancon,
  Alcazar=alcazar,
  Almansa=almansa,
  Tomelloso=tomelloso,
  Villanueva=villanueva,
  Azuqueca=azuqueca,
  Cabanillas=cabanillas
)
listmancha<-bind_rows(listamancha, .id="Pueblo")
dtmancha=as.data.frame(listmancha)
mancha=summarise(.data=dtmancha,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

##### Cataluña 
datosblanes<-get_osm_data("Blanes,la Selva,Gerona,Cataluña,17300,España")
indice_verde_blanes<-calculate_green_index(datosblanes,4326,100)
dtblanes<-as.data.frame(indice_verde_blanes)
blanes<-summarise(.data=dtblanes,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosfigueras<-get_osm_data("Figueras,Alto Ampurdán,Gerona,Cataluña,España")
indice_verde_figueras<-calculate_green_index(datosfigueras,4326,100)
dtfigueras<-as.data.frame(indice_verde_figueras)
figueras<-summarise(.data=dtfigueras,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosbalaguer<-get_osm_data("Balaguer,Noguera,Lérida,Cataluña,25600,España")
indice_verde_balaguer<-calculate_green_index(datosbalaguer,4326,100)
dtbalaguer<-as.data.frame(indice_verde_balaguer)
balaguer<-summarise(.data=dtbalaguer,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datostarrega<-get_osm_data("Tarrega,Urgel,Lérida,Cataluña,España")
indice_verde_tarrega<-calculate_green_index(datostarrega,4326,100)
dttarrega<-as.data.frame(indice_verde_tarrega)
tarrega<-summarise(.data=dttarrega,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosreus<-get_osm_data("Reus,Bajo Campo,Tarragona, Cataluña,España")
indice_verde_reus<-calculate_green_index(datosreus,4326,100)
dtreus<-as.data.frame(indice_verde_reus)
reus<-summarise(.data=dtreus,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datossalou<-get_osm_data("Salou,Tarragonés,Tarragona,Cataluña,43840,España")
indice_verde_salou<-calculate_green_index(datossalou,4326,100)
dtsalou<-as.data.frame(indice_verde_salou)
salou<-summarise(.data=dtsalou,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listacataluna<-list(
  Figueras=figueras,
  Salou=salou,
  Reus=reus,
  Tarrega=tarrega,
  Balaguer=balaguer,
  Blanes=blanes
)

listcataluna<-bind_rows(listacataluna, .id="Pueblo")
dtcataluna=as.data.frame(listcataluna)
cataluna=summarise(.data=dtcataluna,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

##### Ceuta
datosceuta<-get_osm_data("Ceuta,España")
indice_verde_ceuta<-calculate_green_index(datosceuta,4326,100)
dtceuta<-as.data.frame(indice_verde_ceuta)
ceuta<-summarise(.data=dtceuta,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listceuta<-list(
  Ceuta=ceuta
)

listaceuta<-bind_rows(listceuta, .id="Pueblo")
dtceuta=as.data.frame(listaceuta)
ceuta=summarise(.data=dtceuta,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))


##### Melilla 
datosmelilla<-get_osm_data("Melilla,España")
indice_verde_melilla<-calculate_green_index(datosmelilla,4326,100)
dtmelilla<-as.data.frame(indice_verde_melilla)
melilla<-summarise(.data=dtmelilla,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listmelilla<-list(
  Melilla=melilla
)

listamelilla<-bind_rows(listmelilla, .id="Pueblo")
dtmelilla=as.data.frame(listaceuta)
melilla=summarise(.data=dtceuta,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

##### Extremadura 

datosjerez_caballeros<-get_osm_data(("Jerez de los Caballeros,Sierra Suroeste,Badajoz,Extremadura,España"))
indice_verde_jerez_caballeros<-calculate_green_index(datosjerez_caballeros,4326,100)
dtjerez_caballeros<-as.data.frame(indice_verde_jerez_caballeros)
jerez_caballeros<-summarise(.data=dtjerez_caballeros,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosmerida<-get_osm_data(("Mérida,Badajoz,Extremadura,España"))
indice_verde_merida<-calculate_green_index(datosmerida,4326,100)
dtmerida<-as.data.frame(indice_verde_merida)
merida<-summarise(.data=dtmerida,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosnavalmoral<-get_osm_data(("Navalmoral de la Mata,Caceres,Extremadura.España"))
indice_verde_navalmoral<-calculate_green_index(datosnavalmoral,4326,100)
dtnavalmoral<-as.data.frame(indice_verde_navalmoral)
navalmoral<-summarise(.data=dtnavalmoral,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

datosplasencia<-get_osm_data(("Plasencia,Caceres,Extremadura.España"))
indice_verde_plasencia<-calculate_green_index(datosplasencia,4326,100)
dtplasencia<-as.data.frame(indice_verde_plasencia)
plasencia<-summarise(.data=dtplasencia,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))

listaextremadura<-list(
  Jerez_de_los_caballeros= jerez_caballeros,
  Merida=merida,
  Navalmoral_de_la_Mata=navalmoral,
  Plasencia=plasencia
)

listextremadura<-bind_rows(listaextremadura, .id="Pueblo")
dtextremadura=as.data.frame(listextremadura)
extremadura=summarise(.data=dtextremadura,areasverdes=mean(areasverdes,na.rm=TRUE),arboles=mean(arboles,na.rm=TRUE),porcentajeverde=mean(porcentajeverde,na.rm=TRUE))

##### Galicia 



#CARGA DE DATOS DE PERSONAS QUE REALIZAN EJERCICIO FISICO HABITUALMENTE POR COMUNIDADES:
actividadfisica<-"INPUT/DATA/EJERCICIO FISICo/Porcentaje actividad física por comunidad.px"
datosactividad<-read.px(actividadfisica)
dtactividad<-as.data.frame(datosactividad)
actividad<-select(.data=dtactividad,Comunidades.y.Ciudades.Autónomas,value)
actividad <- actividad[actividad$Comunidades.y.Ciudades.Autónomas != "Total Nacional", ]
actividad


load("Objetos.RData")
####Case_when comunidades 
cancer
cancer<-cancer%>%
        mutate(.data = cancer,Comunidad_autonoma = case_when(Parametro=="Castilla-La Mancha" ~ 'Castilla_LaMancha',
                                                             Parametro=="Madrid" ~ 'Madrid',
                                                             Parametro=="Extremadura"~"Extremadura",
                                                             Parametro=="Ceuta"~"Ceuta",
                                                             Parametro=="Melilla"~"Melilla",
                                                             Parametro=="Islas Baleares"~"Islas_Baleares",
                                                             Parametro=="Murcia"~"Murcia",
                                                             Parametro=="Navarra"~"Navarra",
                                                             Parametro=="Comunidad Valenciana"~"Comunidad_Valenciana",
                                                             Parametro=="Galicia"~"Galicia",
                                                             Parametro=="Castilla y León"~"Castilla_y_Leon",
                                                             Parametro=="Cataluña"~"Cataluna",
                                                             Parametro=="Cantabria"~"Cantabria",
                                                             Parametro=="Canarias"~"Islas_Canarias",
                                                             Parametro=="Andalucía"~"Andalucia",
                                                             Parametro=="Aragón"~"Aragon",
                                                             Parametro=="Asturias"~"Asturias",
                                                             Parametro=="La Rioja"~"Rioja",
                                                             Parametro=="País Vasco"~"Pais_Vasco"
                                                             ))%>%
  select(Comunidad_autonoma,Valor)
cancer
 #Case_when alcohol 
alcohol
alcohol<-alcohol%>%
  mutate(.data = alcohol,Comunidad_autonoma = case_when(Comunidad.autónoma=="08 Castilla - La Mancha" ~ 'Castilla_LaMancha',
                                                       Comunidad.autónoma=="13 Madrid, Comunidad de" ~ 'Madrid',
                                                       Comunidad.autónoma=="11 Extremadura"~"Extremadura",
                                                       Comunidad.autónoma=="18 Ceuta"~"Ceuta",
                                                       Comunidad.autónoma=="19 Melilla"~"Melilla",
                                                       Comunidad.autónoma=="04 Balears, Illes"~"Islas_Baleares",
                                                       Comunidad.autónoma=="14 Murcia, Región de"~"Murcia",
                                                       Comunidad.autónoma=="15 Navarra, Comunidad Foral de"~"Navarra",
                                                       Comunidad.autónoma=="10 Comunitat Valenciana"~"Comunidad_Valenciana",
                                                       Comunidad.autónoma=="12 Galicia"~"Galicia",
                                                       Comunidad.autónoma=="07 Castilla y León"~"Castilla_y_Leon",
                                                       Comunidad.autónoma=="09 Cataluña"~"Cataluna",
                                                       Comunidad.autónoma=="06 Cantabria"~"Cantabria",
                                                       Comunidad.autónoma=="05 Canarias"~"Islas_Canarias",
                                                       Comunidad.autónoma=="01 Andalucía"~"Andalucia",
                                                       Comunidad.autónoma=="02 Aragón"~"Aragon",
                                                       Comunidad.autónoma=="03 Asturias, Principado de"~"Asturias",
                                                       Comunidad.autónoma=="17 Rioja, La"~"Rioja",
                                                       Comunidad.autónoma=="16 País Vasco"~"Pais_Vasco"
  ))%>%
  select(Comunidad_autonoma,value)
alcohol  

###Case_when actividad 

actividad<-actividad%>%
  mutate(.data = actividad,Comunidad_autonoma = case_when(Comunidades.y.Ciudades.Autónomas=="Castilla_La Mancha" ~ 'Castilla_LaMancha',
                                                       Comunidades.y.Ciudades.Autónomas=="Madrid" ~ 'Madrid',
                                                       Comunidades.y.Ciudades.Autónomas=="Extremadura"~"Extremadura",
                                                       Comunidades.y.Ciudades.Autónomas=="Ceuta"~"Ceuta",
                                                       Comunidades.y.Ciudades.Autónomas=="Melilla"~"Melilla",
                                                       Comunidades.y.Ciudades.Autónomas=="Islas Baleares"~"Islas_Baleares",
                                                       Comunidades.y.Ciudades.Autónomas=="Murcia"~"Murcia",
                                                       Comunidades.y.Ciudades.Autónomas=="Navarra"~"Navarra",
                                                       Comunidades.y.Ciudades.Autónomas=="Comunidad Valenciana"~"Comunidad_Valenciana",
                                                       Comunidades.y.Ciudades.Autónomas=="Galicia"~"Galicia",
                                                       Comunidades.y.Ciudades.Autónomas=="Castilla y León"~"Castilla_y_Leon",
                                                       Comunidades.y.Ciudades.Autónomas=="Cataluña"~"Cataluna",
                                                       Comunidades.y.Ciudades.Autónomas=="Cantabria"~"Cantabria",
                                                       Comunidades.y.Ciudades.Autónomas=="Canarias"~"Islas_Canarias",
                                                       Comunidades.y.Ciudades.Autónomas=="Andalucía"~"Andalucia",
                                                       Comunidades.y.Ciudades.Autónomas=="Aragón"~"Aragon",
                                                       Comunidades.y.Ciudades.Autónomas=="Asturias"~"Asturias",
                                                       Comunidades.y.Ciudades.Autónomas=="La Rioja"~"Rioja",
                                                       Comunidades.y.Ciudades.Autónomas=="País Vasco"~"Pais_Vasco"
  ))%>%
  select(Comunidad_autonoma,value)
actividad
###Case_when zonas verdes
zonas_verdes<-zonas_verdes%>%
  mutate(.data = zonas_verdes,Comunidad_autonoma = case_when(Pueblo=="Castilla_LaMancha" ~ 'Castilla_LaMancha',
                                                       Pueblo=="Comunidad_de_Madrid" ~ 'Madrid',
                                                       Pueblo=="Extremadura"~"Extremadura",
                                                       Pueblo=="Ceuta"~"Ceuta",
                                                       Pueblo=="Melilla"~"Melilla",
                                                       Pueblo=="Islas_baleares"~"Islas_Baleares",
                                                       Pueblo=="Murcia"~"Murcia",
                                                       Pueblo=="Navarra"~"Navarra",
                                                       Pueblo=="Comunidad_valenciana"~"Comunidad_Valenciana",
                                                       Pueblo=="Galicia"~"Galicia",
                                                       Pueblo=="Castilla_y_Leon"~"Castilla_y_Leon",
                                                       Pueblo=="Cataluna"~"Cataluna",
                                                       Pueblo=="Cantabria"~"Cantabria",
                                                       Pueblo=="Islas_canarias"~"Islas_Canarias",
                                                       Pueblo=="Andalucia"~"Andalucia",
                                                       Pueblo=="Aragon"~"Aragon",
                                                       Pueblo=="Asturias"~"Asturias",
                                                       Pueblo=="La_Rioja"~"Rioja",
                                                       Pueblo=="Pais_Vasco"~"Pais_Vasco"
  ))
zonas_verdes<-select(.data=zonas_verdes,Comunidad_autonoma,porcentajeverde)
zonas_verdes

#CASOS DE CANCER INFLUIDOS POR EJERCICIO FISICO 
actividad_cancer<- full_join(x=actividad,y=cancer,by=c("Comunidad_autonoma"))%>%
                  rename(actividad=value,casos_cancer=Valor)
actividad_cancer <- actividad_cancer[is.na(actividad_cancer$Comunidad_autonoma) == FALSE, ]
actividad_cancer


#CASOS DE CANCER RELACIONADOS CON ZONAS VERDES 
zonasverdes_cancer<- full_join(x=zonas_verdes,y=cancer,by=c("Comunidad_autonoma"))%>%
  rename(casos_cancer=Valor)
zonasverdes_cancer <- zonasverdes_cancer[is.na(zonasverdes_cancer$Comunidad_autonoma) == FALSE, ]
zonasverdes_cancer


#CASOS DE CANCER INFLUIDOS POR EL PORCENTAJE DE ALCOHOL QUE SE TOMA 
alcohol_cancer<-full_join(x=alcohol,y=cancer,by=c("Comunidad_autonoma"))%>%
  rename(casos_alcohol=value,casos_cancer=Valor)
alcohol_cancer <- alcohol_cancer[is.na(alcohol_cancer$Comunidad_autonoma) == FALSE, ]
alcohol_cancer


#CASOS DE CANCER RELACIONADOS CON LAS VARIABLES BUENAS 
variables_buenas<-full_join(actividad,cancer,by=c("Comunidad_autonoma"))%>%
                  full_join(zonas_verdes,cancer,by=c("Comunidad_autonoma"))%>%
                  rename(actividad=value,casos_cancer=Valor)
variables_buenas


#CASOS DE CANCER RELACIONADOS CON TODAS LAS VARIABLES
cancer_completo<-full_join(variables_buenas,alcohol,by=c("Comunidad_autonoma"))%>%
  rename(casos_alcohol=value)

#View(cancer_completo)
###Guardado y carga de todos los objetos que queremos (se esta al final pues necesitamos tener creado el objeto para guardarlo)
save(object=zonas_verdes,alcohol,actividad,cancer,alcohol_cancer,actividad_cancer,zonasverdes_cancer,variables_buenas,cancer_completo,file = "Objetos.RData")
load("Objetos.RData")




#CREACIÓN DE GRÁFICAS 


#===========================================================================================================
#GRÁFICOS


#GRÁFICOS DE BARRAS DE CADA VARIABLE A ESTUDIAR


#Gráfico casos cancer
grafico_cancer <- ggplot(cancer, aes(x =reorder(Comunidad_autonoma,-Valor), y = Valor, fill = Valor)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "paleturquoise", high = "royalblue") +
  labs(
    title = "Casos de Cáncer por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "Casos cáncer",
    fill = "Casos"
  ) +
  theme_minimal()+
  theme(axis.text.x =element_text(angle = 90, hjust = 1))
grafico_cancer

#Gráfico casos alcohol
grafico_alcohol <- ggplot(alcohol, aes(x = reorder(Comunidad_autonoma,-value), y = value, fill = value)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "pink", high = "purple") +
  labs(
    title = "Personas que toman alcohol por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "Casos alcohol",
    fill = "Casos"
  ) +
  theme_minimal()+
  theme(axis.text.x =element_text(angle = 90, hjust = 1))
grafico_alcohol

#Gráfico zonas verdes
zonas_verdes

grafico_zonas_verdes <- ggplot(zonas_verdes, aes(reorder(Comunidad_autonoma,-porcentajeverde), y = porcentajeverde, fill = porcentajeverde)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "lightgreen", high = "turquoise") +
  labs(
    title = "Porcentaje de Zonas Verdes por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "% Zonas verdes",
    fill = "%"
  ) +
  theme_minimal()+
  theme(axis.text.x =element_text(angle = 90, hjust = 1))

grafico_zonas_verdes

#Gráfico actividad física
actividad<-na.omit(actividad)
grafico_actividad_fisica <- ggplot(actividad, aes(x =reorder(Comunidad_autonoma,-value), y = value, fill = value)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "aquamarine", high = "pink") +
  labs(
    title = "Porcentaje de Actividad Física por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "% Actividad Física",
    fill = "%"
  ) +
  theme_minimal()+
  theme(axis.text.x =element_text(angle = 90, hjust = 1))
grafico_actividad_fisica



#GRÁFICOS DE PUNTOS DE VARIABLES RELACIONADAS

#Gráfico Cáncer - Actividad Física
actividad_cancer<- na.omit(actividad_cancer)
gráfico_ejercicio_cancer <- ggplot(actividad_cancer, aes(x = actividad, y = casos_cancer)) +
  geom_point() +
  labs(
    title = "Relación entre Ejercicio y Casos de Cáncer por Comunidades",
    x = "% Ejercicio físico",
    y = "Casos de Cáncer"
  ) +
  geom_smooth(method = "loess", formula = y ~ x, color = "purple", fill = "aquamarine", alpha = 0.3)+
  theme_minimal()
gráfico_ejercicio_cancer

#Gráfico Cáncer - Zonas Verdes
zonasverdes_cancer
grafico_zonas_verdes_cancer <- ggplot(zonasverdes_cancer, aes(x = porcentajeverde, y = casos_cancer)) +
  geom_point() +
  labs(
    title = "Relación entre Zonas Verdes y Casos de Cáncer por Comunidades",
    x = "% Zonas Verdes",
    y = "Casos de Cáncer"
  ) +
  geom_smooth(method = "loess", formula = y ~ x, color = "darkgreen", fill = "lightgreen", alpha = 0.3)+
  theme_minimal()
grafico_zonas_verdes_cancer

#Gráfico Cáncer - Alcohol
grafico_alcohol_cancer <- ggplot(alcohol_cancer, aes(x = casos_alcohol, y = casos_cancer)) +
  geom_point() +
  labs(
    title = "Relación entre Alcohol y Casos de Cáncer por Comunidades",
    x = "Casos Alcohol",
    y = "Casos de Cáncer"
  ) +
  geom_smooth(method = "loess", formula = y ~ x, color = "purple", fill = "pink", alpha = 0.3)+
  xlim(0, 1000) +
  ylim(0, 10000) +
  theme_minimal()
grafico_alcohol_cancer

#Gráfico Cáncer - Variables buenas (Zonas verdes y ejercicio)
grafico_variables_buenas <- ggplot(variables_buenas, aes(x = Comunidad_autonoma, y = casos_cancer)) +
  geom_point(aes(shape = actividad, color = porcentajeverde), size = 4) +
  scale_shape_manual(values = c(16, 17)) +
  scale_color_gradient(low = "green", high = "red") +
  labs(
    title = "Casos de Cáncer por Comunidad Autónoma",
    x = "Comunidad Autónoma",
    y = "Casos de Cáncer",
    shape = "Actividad",
    color = "Porcentaje Verde"
  ) +
  theme_minimal()
grafico_variables_buenas

#Gráfico Cáncer - Todas las Variables


