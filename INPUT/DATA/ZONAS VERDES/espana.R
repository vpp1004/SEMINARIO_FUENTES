library(devtools)
library(greenR)
library(dplyr)
load("Objetos.RData")


listespana=list(
  Andalucia=andalucia,
  Aragon=aragon,
  Asturias=asturias,
  Islas_baleares=baleares,
  Islas_canarias=canarias,
  Cantabria=cantabria,
  Castilla_y_Leon=castilla,
  Castilla_LaMancha=mancha,
  Cataluna=cataluna,
  Extremadura=extremadura,
  Galicia=galicia,
  Comunidad_de_Madrid=madrid,
  Murcia=murcia,
  Navarra=navarra,
  Pais_Vasco=paisvasco,
  La_Rioja=rioja,
  Comunidad_valenciana=valencia,
  Ceuta= ceuta,
  Melilla=melilla
)

listaespana<-bind_rows(listespana, .id="Pueblo")

espana=as.data.frame(listaespana)
dtespana
save.image(file="Objetos.RData")
load("Objetos.RData")
espana
 