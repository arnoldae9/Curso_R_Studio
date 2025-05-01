dias <- c("Lunes.","Martes.","Miercoles","Jueves","Viernes","Sabado","Domingo")

#Te indicca si el patro existe
grepl("a",dias)
dias[grepl("a",dias)]
#para buscar los que empiezan por un patron
grepl("^L",dias)
dias[grepl("^L",dias)]
#terminan en un patron
grepl("s$",dias)
dias[grepl("s$",dias)]

#Te devuelve la posicion del patron del vector
grep("a",dias)
grep("^S",dias)
grep("s$",dias)
grep("s$",dias,invert=T)

#Reemplazar una vez
sub("a","o",dias)

#Reemplazar todas las veces
gsub("a","o",dias)
#eliminar todos los puntos
gsub("\\.","",dias)

#.* cualquier caracter que coincida una o dos veces
#\\s un espacio
#[0-9]+ numeros del 0 al 9 al menos una vez
#[A-Z]+ Mayusculas de A a la Z al menos una vez

