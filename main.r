

###  CARGA DE PAQUETES:
install.packages("pxR")
install.packages("tidyverse")
install.packages("rjson")
install.packages("tidyjson")
library(pxR)
library(tidyverse)
library(rjson)
library(tidyjson)


#CARGA DE DATOS DE CASOS DE PERSONAS QUE TOMAN ALCOHOL HABITUALMENTE POR COMUNIDADES:
casos_alcohol<-read.px("INPUT/DATA/CASOS_ALCOHOL/CasosAlcoholComunidades.px")
View(casos_alcohol)
dtalcohol<-as.data.frame(casos_alcohol)
dtalcohol
alcohol<-select(.data = dtalcohol,value,Consumo.de.bebidas.alcohólicas,Comunidad.autónoma)
if ("Sí ha consumido" %in% dtalcohol$Consumo.de.bebidas.alcohólicas) {
    dataalcohol <- dtalcohol %>%
    filter(Consumo.de.bebidas.alcohólicas == "Sí ha consumido") %>%
    select(value, Comunidad.autónoma)
}


dataalcohol

#if (presion_sistolica > 140) {
#print("El paciente tiene presión arterial alta.")
#}


#select(.data = starwars, hair_color, skin_color, eye_color)
str(dtalcohol)
view(dtalcohol)
#CARGA DE DATOS DE CASOS DE CANCER EN ESPAÑA POR COMUNIDADES:
library(tidyverse)
library(jsonlite)
library(json)
library(dplyr)
library(RJSONIO)
casos_cancer <- fromJSON(file = "INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer.json")
casos_cancer
head(casos_cancer)
#str(casos_cancer)
#listacancer<-as_tibble(casos_cancer$Respuesta$Datos$Metricas[[1]]$Datos)%>%
  #spread_all()
#cancer<-listacancer[,c("Parametro","Valor")]

#colnames(listacancer)
#resultadoscancer<-list()
#for (i in 1:length(listacancer)){
  #resultados[[i]]<-listacancer[[i]][,c("Parametro","Valor")]
#}
#dtcancer
#listacancer
#view(dtcancer)
#cancer<-as.data.frame(listacancer)
#cancer
#str(cancer)
#colnames(cancer)<-c("Año","Periodo","Comunidad","Nº casos","Estado","Notas")
#cancer
#cancer<-as.data.frame(casos_cancer$Respuesta$Datos$Metricas[[1]]$Datos)
#colnames(casos_cancer)<-c("Año","Periodo","Comunidad","Nº casos","Estado","Notas")
#cancer
#view(cancer)

#casos_cancer
#str(casos_cancer$Respuesta$Datos$Metricas[[1]]$Datos)
#view(cancer)


#CARGA DE DATOS DE ZONAS VERDES EN ESPAÑA POR COMUNIDADES:
load("Objetos.RData")
espana


#CARGA DE DATOS DE PERSONAS QUE REALIZAN EJERCICIO FISICO HABITUALMENTE POR COMUNIDADES:
actividadfisica<-"INPUT/DATA/EJERCICIO FISICo/Porcentaje actividad física por comunidad.px"
datosactividad<-read.px(actividadfisica)
datosactividad
dtactividad<-as.data.frame(datosactividad)
view(dtactividad)
dtactividad
actividad<-select(.data=dtactividad,Comunidades.y.Ciudades.Autónomas,value)
actividad

save.image("Objetos.RData")
load("Objetos.RData")