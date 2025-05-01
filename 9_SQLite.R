# Directorio de la base de datos
setwd("~/Documentos/GitHub/Curso_R_Studio")

# Instalar y cargar paquete RSQLite
install.packages("RSQLite", dependencies = T)
library("RSQLite")
library("data.table")

# Crear la conexion
db <- dbConnect(SQLite(), dbname = "Chinook_Sqlite.sqlite")
dbListTables(db)

# Descargando datos
tracks <- as.data.table(dbGetQuery(conn = db, "Select * from track"))

# Mandar query
dbSendQuery(conn = db, "Create Table test(test integer, test_dos text)")

# Descargar datos
test <- as.data.table(dbGetQuery(conn = db, "Select * from test"))

# Insertar datos manualmente
dbSendQuery(conn = db, "Insert into test
            VALUES(1, 'test')")

# cerrar la conexion
dbDisconnect(db)
