

###  CARGA DE PAQUETES:
install.packages("pxR")
install.packages("tidyverse")
install.packages("rjson")
library(pxR)
<<<<<<< HEAD
install.packages("tidyverse")
install.packages("json")
install.packages("jsonlite")
=======
library(tidyverse)
library(rjson)


>>>>>>> f087bfae15f3c16f400560cdbc4bc34b346e772a
#CARGA DE DATOS DE CASOS DE PERSONAS QUE TOMAN ALCOHOL HABITUALMENTE POR COMUNIDADES:
casos_alcohol<-read.px("INPUT/DATA/CASOS_ALCOHOL/CasosAlcoholComunidades.px")
dtalcohol<-as.data.frame(casos_alcohol)
str(dtalcohol)

#CARGA DE DATOS DE CASOS DE CANCER EN ESPAÑA POR COMUNIDADES:
library(tidyverse)
library(jsonlite)
library(json)
library(dplyr)
library(RJSONIO)
casos_cancer <- fromJSON(file = "INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer.json")

#CARGA DE DATOS DE ZONAS VERDES EN ESPAÑA POR COMUNIDADES:

#CARGA DE DATOS DE PERSONAS QUE REALIZAN EJERCICIO FISICO HABITUALMENTE POR COMUNIDADES:




