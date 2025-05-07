setwd("~/Documentos/GitHub/Curso_R_Studio")
library(readxl)
library(data.table)

# Crear data table de los contratos digitales
contratos <-read_excel("2024 CONTRATOS COBRADOS SANDRA.xlsx")
contratosDT <- as.data.table(contratos)
# Cambiar a formato de fecha de R en envio
contratosDT[, ENVÍO := as.Date(as.numeric(ENVÍO), origin = "1899-12-30")]
# Dar formato 01-ene
contratosDT[, ENVÍO := format(ENVÍO, "%d-%b")]
# Crear el data table de los contratos fisicos, se importaran de un csv en un futuro
contratos.fisicosDT <- data.table(
  cliente = c("ROBLEDO RIVAS GERARDO",
              "ROSALES MEDELLIN JULIO CESAR",
              "MARTINEZ MARTINEZ OLIVER NEFTALI"),
  encontrado = c("NO","NO","NO"),
  asesor = c("NO ENCONTRADO", "NO ENCONTRADO", "NO ENCONTRADO")
)
# Definir la columna a buscar
setkey(contratosDT,CLIENTE)
# La relacion de los nombres de las columnas es de izq a der
contratos.fisicosDT[contratosDT, ':=' (asesor = i.ASESOR, 
                                       encontrado = "SI", 
                                       gerente = i.GERENTE
                                       ),
                    on = .(cliente = CLIENTE)]
# Crear y setear columna encontrado
contratosDT$encontrado = "NO"
# Configurar la columna encontrado en contratosDT
contratosDT <- contratosDT[contratos.fisicosDT,
                             ':='(
                               encontrado = "SI",
                               CONTRATO = "PAGADO"
                             ),
                             on = .(CLIENTE = cliente)]
# Filtrar por SI en la colmna encontrado
contratosDT[encontrado == "SI"]
