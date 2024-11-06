library(devtools)
library(greenR)
library(dplyr)
datosutebo<-get_osm_data("Utebo,Zaragoza,Aragón,España")
indice_verde_utebo<-calculate_green_index(datosutebo,4326,100)
str(indice_verde_utebo)
typeof(indice_verde_utebo)
dtutebo<-as.data.frame(indice_verde_utebo)
utebo<-summarise(.data=dtutebo,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(utebo)
str(utebo)


datosejea<-get_osm_data("Ejea de los Caballeros,Cinco Villas,Zaragoza,Aragón,50600,España")
indice_verde_ejea<-calculate_green_index(datosejea,4326,100)
str(indice_verde_ejea)
typeof(indice_verde_ejea)
dtejea<-as.data.frame(indice_verde_ejea)
ejea<-summarise(.data=dtejea,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(ejea)
str(ejea)


datosbarbastro<-get_osm_data("Barbastro,Somontano de Barbastro,Huesca,Aragón,22300,España")
indice_verde_barbastro<-calculate_green_index(datosbarbastro,4326,100)
str(indice_verde_barbastro)
typeof(indice_verde_barbastro)
dtbarbastro<-as.data.frame(indice_verde_barbastro)
barbastro<-summarise(.data=dtbarbastro,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(barbastro)
str(barbastro)


datosmonzon<-get_osm_data("Monzón,Cinca Medio,Huesca,Aragón,España")
indice_verde_monzon<-calculate_green_index(datosmonzon,4326,100)
str(indice_verde_monzon)
typeof(indice_verde_monzon)
dtmonzon<-as.data.frame(indice_verde_monzon)
monzon<-summarise(.data=dtmonzon,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(monzon)
str(monzon)


datosalcaniz<-get_osm_data("Alcañiz,Bajo Aragón,Teruel,Aragón ,España")
indice_verde_alcaniz<-calculate_green_index(datosalcañiz,4326,100)
str(indice_verde_alcaniz)
typeof(indice_verde_alcaniz)
dtalcaniz<-as.data.frame(indice_verde_alcaniz)
alcaniz<-summarise(.data=dtalcaniz,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(alcaniz)
str(alcaniz)

datoscalamocha<-get_osm_data("Calamocha,Jiloca,Teruel,Aragón,España")
indice_verde_calamocha<-calculate_green_index(datoscalamocha,4326,100)
str(indice_verde_calamocha)
typeof(indice_verde_calamocha)
dtcalamocha<-as.data.frame(indice_verde_calamocha)
calamocha<-summarise(.data=dtcalamocha,areasverdes=mean(green_index_green_area,na.rm=TRUE),arboles=mean(green_index_tree,na.rm=TRUE),porcentajeverde=mean(green_index,na.rm=TRUE))
View(calamocha)
str(calamocha)


dtaragon<-data.frame(
  Utebo= utebo,
  Barbastro= barbastro,
  Monzon= monzon,
  Ejea= ejea,
  Alcaniz= alcaniz,
  Calamocha=calamocha
)

listapueblos<-list(
  Utebo= utebo,
  Barbastro= barbastro,
  Monzon= monzon,
  Ejea= ejea,
  Alcaniz= alcaniz,
  Calamocha=calamocha
)

str(listapueblos)
dtaragon<- 
  Areas_verdes=c[utebo]


aragon<- bind_rows(listapueblos,.id="Pueblo")
str(aragon)

aragon
save.image(file="Objetos.RData")
load("Objetos.RData")

View(dtaragon)
View(aragon)
dtaragon
df1 <- data.frame(
  Numeros = 1:5, 
  Letras = letters[1:5])

df1
typeof(df1)
attributes(df1)