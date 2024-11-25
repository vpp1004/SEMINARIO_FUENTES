###Instalación de paquetes 
install.packages("pxR")
install.packages("tidyverse")
install.packages("rjson")
install.packages("tidyjson")

###  CARGA DE PAQUETES:
library(pxR)
library(tidyverse)
library(rjson)
library(tidyjson)

### Datos de personas que toman alcohol por comunidades 
casos_alcohol<-read.px("INPUT/DATA/CASOS_ALCOHOL/CasosAlcoholComunidades.px")
View(casos_alcohol)
str(casos_alcohol)
dtalcohol<-as.data.frame(casos_alcohol)

alcohol<-select(.data = dtalcohol,value,Consumo.de.bebidas.alcohólicas,Comunidad.autónoma)
dataalcohol<-alcohol %>%
  filter(Consumo.de.bebidas.alcohólicas=="Sí ha consumido")
dataalcohol<-select(.data = dataalcohol,value,Comunidad.autónoma)

save(object=dataalcohol,file="Objetos.RData")
load("Objetos.RData")
#CARGA DE DATOS DE CASOS DE CANCER EN ESPAÑA POR COMUNIDADES:
library(tidyverse)
library(jsonlite)
library(json)
library(dplyr)
library(RJSONIO)
casos_cancer <- fromJSON(file = "INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer.json")
casos_cancer
head(casos_cancer)


archivo <-fromJSON("INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer.json")
print(archivo)
typeof(archivo)
View(archivo)
casos_cancer$Respuesta$Datos$Metricas[[1]]$Datos
cancer<-as.data.frame(archivo$Respuesta$Datos$Metricas$Datos)
cancer
str(dtcancer)

cancer<-select(.data=cancer,Parametro,Valor)
cancer



#CARGA DE DATOS DE ZONAS VERDES EN ESPAÑA POR COMUNIDADES:
load("Objetos.RData")
espana
save(object=espana,file="Objetos.RData")

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



#Inserccion de datos cancer 
library(tidyverse)
library(jsonlite)
library(json)
library(dplyr)
library(RJSONIO)
casos_cancer<-fromJSON(file = "INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer_por_comunidad.json")




#CASOS DE CANCER INFLUIDOS POR ALCOHHOL
dataalcohol
dtcancer_largo
alcohol <- dataalcohol %>%
  mutate(Comunidad.autónoma = str_remove(Comunidad.autónoma, "^\\d+\\s+")) %>%
  mutate(Comunidad.autónoma = str_replace(Comunidad.autónoma, ",.*", "")) %>% 
  mutate(Comunidad.autónoma = str_trim(Comunidad.autónoma))
alcohol_cancer<-left_join(x=alcohol,y=dtcancer_largo,by=c("Comunidad.autónoma"="Parametro"))
alcohol_cancer
cancer_alcohol<-dplyr::rename(alcohol_cancer,casos_cancer=Valor,casos_alcohol=value)
colnames(cancer_alcohol)  
cancer_alcohol


#CASOS DE CANCER INFLUIDOS POR EJERCICIO FISICO 
actividad
dtcancer_largo
cancer_actividad<-dplyr::rename(alcohol_cancer,casos_cancer=Valor,porcentaje_actividad=value)
comunidad<-c(
  "01 Andalucía"="Andalucía",
  "02 Aragón" ="Aragón",
  "03 Asturias, Principado de"="Asturias",
  "04 Balears, Illes"="Islas Baleares",
  "05 Canarias"="Canarias",
  "06 Cantabria"="Cantabria",
  "07 Castilla y León"="Castilla y León",
  "08 Castilla - La Mancha"="Castilla_La Mancha",
  "09 Cataluña"="Cataluña",
  "10 Comunitat Valenciana"="Comunidad Valenciana",
  "11 Extremadura"="Extremadura",
  "12 Galicia"="Galicia",
  "13 Madrid, Comunidad de"="Madrid",
  "14 Murcia, Región de"="Murcia",
  "15 Navarra, Comunidad Foral de"="Navarra",
  "16 País Vasco"="País Vasco",
  "17 Rioja, La"="La Rioja",
  "18 Ceuta"="Ceuta",
  "19 Melilla"="Melilla"
  
  
)

actividad$Comunidades.y.Ciudades.Autónomas<-recode(actividad$Comunidades.y.Ciudades.Autónomas,!!!comunidad)
cancer_actividad<-left_join(x=actividad,y=dtcancer_largo,by=c("Comunidades.y.Ciudades.Autónomas"="Parametro"))
cancer_actividad
actividad_cancer<-dplyr::rename(cancer,actividad_fisica=valor.x,casos_cancer=Valor.y)
zonasverdes_cancer

#CASOS DE CANCER RELACIONADOS CON ZONAS VERDES 
espana
dtcancer_largo

zonasverdes <-dplyr::rename(.data=espana,Comunidad.autonoma=Pueblo)
 
zonasverdes


comunidades<-c(
  Islas_baleares="Islas Baleares",
  Islas_canarias="Canarias",
  Castilla_y_Leon="Castilla y León",
  Castilla_LaMancha="Castilla-La Mancha",
  Cataluna="Cataluña",
  Comunidad_de_Madrid="Madrid",
  Comunidad_valenciana="Comunidad Valenciana",
  Pais_Vasco="País Vasco",
  La_Rioja="La Rioja"
)

zonasverdes$Comunidad.autonoma<-recode(zonasverdes$Comunidad.autonoma,!!!comunidades)
cancer_zonasverdes<-left_join(x=zonasverdes,y=dtcancer_largo,by=c("Comunidad.autonoma"="Parametro"))
cancer_zonasverdes
zonasverdes_cancer<-dplyr::rename(cancer_zonasverdes,casos_cancer=Valor)
zonasverdes_cancer


save(object=espana,dataalcohol,actividad,cancer,file = "Objetos.RData")
load("Objetos.RData")
