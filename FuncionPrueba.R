# # Funcion no corre con error
# FuncionPrueba <- function(x) {
#   log(x)
#   print("Devolucion funcion prueba")
# }
# 
# # Funcion corre con error
# FuncionPrueba <- function(x) {
#   try(log(x))
#   print("Devolucion funcion prueba")
# }

# Funcion con catch
FuncionPrueba <- function(x) {
  browser()
  tryCatch(log(x),
           error = function(x) print("error"),
           warning = function(x) print("warning"),
           message = function(x) print("message")
           )
  message("Esto es un mensaje")
  print("Devolucion funcion prueba")
}