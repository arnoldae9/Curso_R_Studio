# Este script es para importar y separar los archivos de csv por pais
# Autor: Arnoldo Del Toro
# 28 de abril del 2025

# instalar paquete
install.packages("data.table")
# cargar paquete
library(data.table)

# importar csv
archivo.importado <- fread("Usuarios_pais.csv")

dir.create(file.path("~/Documentos/GitHub/Curso_R_Studio/paises"), showWarnings = FALSE)
setwd("~/Documentos/GitHub/Curso_R_Studio/paises")

#Bucle para separar y guardar archivos
for (i in unique(archivo.importado$Country)){
  pais.seleccionado <- archivo.importado[Country == i]
  fwrite(pais.seleccionado, paste0(i, ".csv"))
}
