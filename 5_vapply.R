ciudades <- list(ciudades = c("Barcelona", "Paris", "Roma"), capital = c("FALSE","TRUE","TRUE"))

for(ciudad in ciudades){
    print(class(ciudad))
}

for (ciudad in ciudades$ciudades) {
    print(nchar(ciudad))
}

vapply(ciudades,class,character(1))

for (ciudad in ciudades$ciudades) {
    print(nchar(ciudad))
}

#aplicando vapply
vapply(ciudades$ciudades,nchar,USE.NAMES = F, FUN.VALUE= integer(1))


