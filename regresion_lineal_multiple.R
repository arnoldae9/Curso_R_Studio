# Regresion Lineal
library(data.table)
library(ggplot2)

irisDT <- as.data.table(iris)

# Set seed
set.seed(123)

# prededcir Petal.Width usando Petal.Length 
lm.modelo <-  lm(Petal.Width ~ Petal.Length, data = irisDT)

# Summary
summary(lm.modelo)

# Coeficiente de correlacion
coef.cor <-  cor(irisDT$Petal.Width, irisDT$Petal.Length)
coef.cor^2

# Coeficientes
lm.modelo$coefficients

ggplot( data = irisDT,
        aes(x = Petal.Length, y = Petal.Width, colour = Species)) +
  geom_point() +
  geom_abline(intercept = lm.modelo$coefficients[1], slope = lm.modelo$coefficients[2])
# intercept lo sacamos de los coeficientes y slope igual en matematicas intercepcion y pendiente

# Predicciones
predicciones <- predict(lm.modelo)

# Asignar las predicciones a irisDT
irisDT[,pred := predicciones]

ggplot( data = irisDT,
        aes(x = Petal.Length, y = pred, colour = Species)) +
  geom_point() +
  geom_abline(intercept = lm.modelo$coefficients[1], slope = lm.modelo$coefficients[2])

# Calculando RMSE error
rmse <-  sqrt(mean((irisDT$Petal.Width - irisDT$pred)^2))
rmse

mae <- mean(abs(irisDT$Petal.Width - irisDT$pred))
mae
