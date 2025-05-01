hoy <- Sys.Date()
hoy

class(hoy)

ahora <- Sys.time()
ahora

class(ahora)

#crear una fecha nueva
mifecha <- as.Date("2029-01-15")
mifecha

mifecha <- as.Date("2029-15-01", format = "%Y-%d-%m")
mifecha

#aritmetica de fechas

ayer <- Sys.Date()-1
ayer

install.packages("lubridate")
library(lubridate)
?difftime

difftime(hoy,ayer,units="mins")

as.integer(difftime(hoy,ayer,units="mins"))
#hay que usar difftime en aritmetica de fechas
