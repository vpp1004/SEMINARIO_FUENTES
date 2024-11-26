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
alcohol<-as.data.frame(alcohol)
alcohol<-select(.data=alcohol,Comunidad.autónoma,value)
alcohol <- alcohol[alcohol$Comunidad.autónoma != "Total Nacional", ]
alcohol

#CARGA DE DATOS DE CASOS DE CANCER EN ESPAÑA POR COMUNIDADES:
archivo <-fromJSON("INPUT/DATA/CASOS_CANCER/casos_nuevos_de_cancer.json")
dtcancer<-as.data.frame(archivo$Respuesta$Datos$Metricas$Datos)
cancer<-select(.data=dtcancer,Parametro,Valor)
cancer

#CARGA DE DATOS DE ZONAS VERDES EN ESPAÑA POR COMUNIDADES:
####El código aquí presentado se obtiene directamente de un respositorio de github realizando diferentes operaciones
###Proceso para la creación de diferentes comunidades autónoma 


load("Objetos.RData")


#CARGA DE DATOS DE PERSONAS QUE REALIZAN EJERCICIO FISICO HABITUALMENTE POR COMUNIDADES:
actividadfisica<-"INPUT/DATA/EJERCICIO FISICo/Porcentaje actividad física por comunidad.px"
datosactividad<-read.px(actividadfisica)
dtactividad<-as.data.frame(datosactividad)
actividad<-select(.data=dtactividad,Comunidades.y.Ciudades.Autónomas,value)
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
dataalcohol
alcohol<-dataalcohol%>%
  mutate(.data = dataalcohol,Comunidad_autonoma = case_when(Comunidad.autónoma=="08 Castilla - La Mancha" ~ 'Castilla_LaMancha',
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
###Case_when zonas verdes
espana
zonas_verdes<-espana%>%
  mutate(.data = espana,Comunidad_autonoma = case_when(Pueblo=="Castilla_LaMancha" ~ 'Castilla_LaMancha',
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
  ))%>%
  select(Comunidad_autonoma,areasverdes,arboles,porcentajeverde)


#CASOS DE CANCER INFLUIDOS POR EJERCICIO FISICO 
actividad_cancer<- full_join(x=actividad,y=cancer,by=c("Comunidad_autonoma"))%>%
                  rename(actividad=value,casos_cancer=Valor)

actividad_cancer
#CASOS DE CANCER RELACIONADOS CON ZONAS VERDES 
zonasverdes_cancer<- full_join(x=zonas_verdes,y=cancer,by=c("Comunidad_autonoma"))%>%
  rename(casos_cancer=Valor)

#CASOS DE CANCER INFLUIDOS POR EL PORCENTAJE DE ALCOHOL QUE SE TOMA 
alcohol_cancer<-full_join(x=alcohol,y=cancer,by=c("Comunidad_autonoma"))%>%
  rename(casos_alcohol=value,casos_cancer=Valor)
alcohol_cancer


#CASOS DE CANCER RELACIONADOS CON LAS VARIABLES BUENAS 
variables_buenas<-full_join(actividad,cancer,by=c("Comunidad_autonoma"))%>%
                  full_join(zonas_verdes,cancer,by=c("Comunidad_autonoma"))%>%
                  rename(actividad=value,casos_cancer=Valor)
variables_buenas


#CASOS DE CANCER RELACIONADOS CON TODAS LAS VARIABLES
cancer_completo<-full_join(variables_buenas,alcohol,by=c("Comunidad_autonoma"))%>%
  rename(casos_alcohol=value)


###Guardado y carga de todos los objetos que queremos (se esta al final pues necesitamos tener creado el objeto para guardarlo)
save(object=zonas_verdes,alcohol,actividad,cancer,alcohol_cancer,actividad_cancer,zonasverdes_cancer,variables_buenas,cancer_completo,file = "Objetos.RData")
load("Objetos.RData")




#CREACIÓN DE GRÁFICAS 


#GRÁFICOS

#Gráfico casos cancer
grafico_cancer <- ggplot(cancer, aes(x = Comunidad_autonoma, y = Valor, fill = Valor)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(
    title = "Casos de Cáncer por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "Número de Casos"
  ) +
  theme_minimal()
grafico_cancer

#Gráfico casos alcohol
grafico_alcohol <- ggplot(alcohol, aes(x = Comunidad.autónoma, y = value, fill = value)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "pink", high = "purple") +
  labs(
    title = "Personas que toman alcohol por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "Casos alcohol"
  ) +
  theme_minimal()
grafico_alcohol

#Gráfico zonas verdes
grafico_zonas_verdes <- ggplot(zonas_verdes, aes(x = Comunidad_autonoma, y = porcentajeverde, fill = porcentajeverde)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
  labs(
    title = "Porcentaje de Zonas Verdes por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "% Zonas verdes"
  ) +
  theme_minimal()
grafico_zonas_verdes

#Gráfico actividad física
grafico_actividad_fisica <- ggplot(actividad, aes(x = Comunidad_autonoma, y = value, fill = value)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_gradient(low = "yellow", high = "red") +
  labs(
    title = "Porcentaje de Actividad Física por Comunidad en España",
    x = "Comunidades Autónomas",
    y = "% Actividad Física"
  ) +
  theme_minimal()
grafico_actividad_fisica

