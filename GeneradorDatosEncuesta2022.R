rm(list=ls(all=TRUE))

# Ejecutar el programa linea a linea para entender cómo funciona
 
if (!require(sae)) install.packages("sae")
library(sae)
data(incomedata)

#.......................................................................

# Revisar los nombres y características de las variables
help("incomedata")

#.......................................................................

# Poner como semilla el NIU (solo números) particular de alguien del grupo

# Ejemplo
NIU = 100452943

set.seed(NIU)

cual = sample(1:17,1) 

# 1: Andalucia
# 2: Aragon
# 3: Asturias
# 4: Baleares
# 5: Canarias
# 6: Cantabria
# 7: CastillaLeon
# 8: CastillaLaMancha
# 9: Catalunya
# 10: ComValenciana
# 11: Extremadura
# 12: Galicia
# 13: ComMadrid
# 14: Murcia
# 15: Navarra 
# 16: PaisVasco
# 17: Rioja

#.......................................................................

datosECV = incomedata

# Seleccionamos los mayores de 16 años
datosECVmas16 = subset(datosECV, (datosECV$labor>0))

# Renumeramos los valores de la variable age
datosECVmas16$age = datosECVmas16$age - 1

nrows = dim(datosECVmas16)[[1]]

datosECVmas16$horas = round(rnorm(nrows,34,3), 1)
datosECVmas16$horas[(datosECVmas16$labor==2) | (datosECVmas16$labor == 3)] = 0

datosECVmas16$income = round(jitter(datosECVmas16$income),1)
datosECVmas16$income[datosECVmas16$labor==2] = datosECVmas16$income[datosECVmas16$labor==2]*0.7
datosECVmas16$income[datosECVmas16$labor==3] = 0

datosFinal = 
data.frame(ca=datosECVmas16$ac, prov=datosECVmas16$prov, 
provlab=datosECVmas16$provlab, gen=datosECVmas16$gen, 
edad=datosECVmas16$age, nac=datosECVmas16$nat, 
neduc=datosECVmas16$educ, sitemp=datosECVmas16$labor, 
ingnorm=datosECVmas16$income, horas=datosECVmas16$horas,
factorel=round(datosECVmas16$weight,1))

#...................................................................................

datos_Andalucia = datosFinal[datosFinal[,1]==1,]
datos_Aragon = datosFinal[datosFinal[,1]==2,]
datos_Asturias = datosFinal[datosFinal[,1]==3,]
datos_Baleares = datosFinal[datosFinal[,1]==4,]
datos_Canarias = datosFinal[datosFinal[,1]==5,]
datos_Cantabria = datosFinal[datosFinal[,1]==6,]
datos_CastillaLeon = datosFinal[datosFinal[,1]==7,]
datos_CastillaLaMancha = datosFinal[datosFinal[,1]==8,]
datos_Catalunya = datosFinal[datosFinal[,1]==9,]
datos_ComValenciana = datosFinal[datosFinal[,1]==10,]
datos_Extremadura = datosFinal[datosFinal[,1]==11,]
datos_Galicia = datosFinal[datosFinal[,1]==12,]
datos_ComMadrid = datosFinal[datosFinal[,1]==13,]
datos_RegMurcia = datosFinal[datosFinal[,1]==14,]
datos_ComForalNavarra = datosFinal[datosFinal[,1]==15,]
datos_PaisVasco = datosFinal[datosFinal[,1]==16,]
datos_Rioja = datosFinal[datosFinal[,1]==17,]
# datos_CeutaMelilla = datosFinal[datosFinal[,1]==18,]

#...................................................................................

if(cual == 1) {
    write.table(datos_Andalucia,"datos_Andalucia.txt",row.names=FALSE)
} else if(cual == 2) {
    write.table(datos_Aragon,"datos_Aragon.txt",row.names=FALSE)
} else if(cual == 3) {
    write.table(datos_Asturias,"datos_Asturias.txt",row.names=FALSE)
} else if(cual == 4) {
    write.table(datos_Baleares,"datos_Baleares.txt",row.names=FALSE)
} else if(cual == 5) {
    write.table(datos_Canarias,"datos_Canarias.txt",row.names=FALSE)
} else if(cual == 6) {
    write.table(datos_Cantabria,"datos_Cantabria.txt",row.names=FALSE)
} else if(cual == 7) {
    write.table(datos_CastillaLeon,"datos_CastillaLeon.txt",row.names=FALSE)
} else if(cual == 8) {
    write.table(datos_CastillaLaMancha,"datos_CastillaLaMancha.txt",row.names=FALSE)
} else if(cual == 9) {
    write.table(datos_Catalunya,"datos_Catalunya.txt",row.names=FALSE)
} else if(cual == 10) {
    write.table(datos_ComValenciana,"datos_ComValenciana.txt",row.names=FALSE)
} else if(cual == 11) {
    write.table(datos_Extremadura,"datos_Extremadura.txt",row.names=FALSE)
} else if(cual == 12) {
    write.table(datos_Galicia,"datos_Galicia.txt",row.names=FALSE)
} else if(cual == 13) {
    write.table(datos_ComMadrid,"datos_ComMadrid.txt",row.names=FALSE)
} else if(cual == 14) {
    write.table(datos_RegMurcia,"datos_RegMurcia.txt",row.names=FALSE)
} else if(cual == 15) {
    write.table(datos_ComForalNavarra,"datos_ComForalNavarra.txt",row.names=FALSE)
} else if(cual == 16) {
    write.table(datos_PaisVasco,"datos_PaisVasco.txt",row.names=FALSE)
} else {
    write.table(datos_Rioja,"datos_Rioja.txt",row.names=FALSE)
}
