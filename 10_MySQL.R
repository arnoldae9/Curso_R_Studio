# instalando y cargando paquete
install.packages("RMySQL")
library(RMySQL)

# Creando la conexion
con = dbConnect(MySQL(),
                user = 'usuario',
                password = 'contrasena'
                dbname = 'nombre_base_de_datos'
                host = 'host')

# Borrar tabla
dbSendQuery(con, 'drop table if exists tabla')

# Descargar datos de tabla
dbGetQuery(con, 'select * from tabla')