setwd("~/Documentos/GitHub/Curso_R_Studio")
# Cargamos datos e importamos el csv
library(data.table)
countries <- fread("countries.csv")

# Iniciamos el csv para juntar despues
final.table <- data.table()

# Creamos un bucle por pais para rellenar al azar 10000 filas por pais
for (i in unique(countries$Country)){
  country.data <- data.table(Country = rep(i, 10000), User = sample(1000000:200000,10000))
  final.table <- rbind(final.table,country.data)
}

# Exportamos
fwrite(final.table, "Usuarios_pais.csv")

suma_por_pais <- final.table[, .(Suma = sum(User)), by = Country]

