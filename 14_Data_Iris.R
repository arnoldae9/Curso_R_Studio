# Analisis descriptivo

library("data.table")
irisDT <- as.data.table(iris)

# Summary y str
summary(irisDT)
str(irisDT)

# Tabla de frecuencia
table(irisDT$Species)
prop.table(table(irisDT$Species))

# Tabla de frecuencias cruzadas
table(irisDT$Species,irisDT$Petal.Width)

absolutas <- table(irisDT$Species,irisDT$Petal.Width)
relativas <- prop.table(table(irisDT$Species,irisDT$Petal.Width))

# Barplot
barplot(absolutas, main = "Petal With por especie", legend = rownames(absolutas))

# Grafica de tarta
etiquetas <- paste0(names(table(irisDT$Species)), " - ", round(prop.table(table(irisDT$Species)),2))
pie(table(irisDT$Species), main = "Porcentaje de muestras por especie", labels = etiquetas)

# histograma
hist(irisDT$Petal.Length) # podemos usar breaks para manipular la cantidad de columnas

# Boxplot
boxplot(irisDT$Petal.Length ~ irisDT$Species, main = "Petal length por especie")
boxplot(irisDT$Petal.Width ~ irisDT$Species, main = "Petal length por especie")
boxplot(irisDT$Sepal.Length ~ irisDT$Species, main = "Petal length por especie")
boxplot(irisDT$Sepal.Width ~ irisDT$Species, main = "Petal length por especie")

minimo <- min(irisDT$Sepal.Length)
maximo <- max(irisDT$Sepal.Length)
quantile <- quantile(irisDT$Sepal.Length)
median <- mean(irisDT$Sepal.Length)
mediana <- median(irisDT$Sepal.Length)
varianza <- var(irisDT$Sepal.Length)
desv <- sd(irisDT$Sepal.Length)
IQR <- IQR(irisDT$Sepal.Length)

plot(irisDT$Petal.Width, irisDT$Petal.Length)
