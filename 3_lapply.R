ciudades <- list(ciudades = c("Barcelona", "Paris", "Roma"), capital = c("FALSE", "TRUE", "TRUE"))

for(ciudad in ciudades){
    print(class(ciudad))
}

unlist(lapply(ciudades,class))

for (ciudad in ciudades$ciudades) {
    print(nchar(ciudad))
}

# como hacerlo con un lapply
unlist(lapply(ciudades$ciudades, nchar))

precios <- list(2,4,8,5,6,9)

multiplica <- function(x,factor){
    x*factor
}

unlist(lapply(precios,multiplica,factor=2))


