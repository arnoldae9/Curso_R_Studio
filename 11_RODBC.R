# Instalano el paquete
install.packages("RODBC")
library(RODBC)

# Conectando
myServer <- "direccion del servidor"
myUser <-  "usuario"
myPassword <- "contrasena"
myDatabase <- "base de datos"
myDriver <- "ODBC Driver 13 for SQL Server"
# Tiene que corresponder a una de las entradas en tus drivers de "ODBC Data Sources

connectionString <-  paste0(
  "Driver=", myDriver,
  ";Server=", myServer,
  ";Database=" myDatabase,
  ";Uid=" myUser,
  ";Pwd=" myPassword
)

# Conectando
conn <- odbcDriverConnect(connectionString)

# Consulta
sqlQuery <- paste0("SELECT *
                   FROM Tabla
                   WHERE X = 'ALGO'")

# Corriendo la consulta
datos <-  as.data.table(sqlQuery(conn, sqlQuery))

