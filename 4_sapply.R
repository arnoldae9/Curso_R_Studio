fiudades <- list(ciudades = c("Barcelona", "Paris", "Roma"), capital = c("FALSE","TRUE","TRUE"))

for(ciudad in ciudades){
    print(class(ciudad))
}

sapply(ciudades,class)

for (ciudad in ciudades$ciudades) {
    print(nchar(ciudad))
}

#aplicando el sapply
sapply(ciudades$ciudades,nchar,USE.NAMES = F)

