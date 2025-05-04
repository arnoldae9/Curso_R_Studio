# Hierarchical Clustering
library("ggplot2")
iris <- as.data.table(iris)

ggplot(data = irisDT,
       aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) +
  geom_point()

ggplot(data = irisDT,
       aes(x = Petal.Width, y = Petal.Length, colour = Species)) +
  geom_point()

iris.all <- irisDT[, !c("Species")]

# hacer set seed, definir el tama;o de la prueba
set.seed(123)

# crear las distancias
iris.dist <- dist(iris.all, method = "euclidean")

hc.iris <-  hclust(iris.dist, method = "complete")

# plot dendograa
plot(hc.iris)

# cortando el arbol con k = 3
cluster <- cutree(hc.iris, k = 3)

# asignar el cluster
iris.all[, cluster := cluster]
iris.all[, Species := irisDT$Species]

ggplot(data = irisDT,
       aes(x = Sepal.Width, y = Sepal.Length, colour = factor(cluster))) +
  geom_point()

ggplot(data = irisDT,
       aes(x = Petal.Width, y = Petal.Length, colour = factor(cluster))) +
  geom_point()

tbl <- table(iris.all$cluster, irisDT$Species)

accuracy <- (tbl[1,1] + tbl[3,2] + tbl[2,3]) / sum(tbl)

set.seed(123)
# K means clustering
kmean <-  kmeans(iris.all[,3:4], centers = 3)
kmean$cluster

iris.all[, cluster := kmean$cluster]

ggplot(data = iris.all,
       aes(x = Petal.Width, y = Petal.Length, colour = factor(cluster))) +
  geom_point()

tbl <- table(iris.all$cluster, iris.all$Species)

accuracy <- (tbl[2,1] + tbl[1,2] + tbl[3,3]) / sum(tbl)

# Eblow plot

library("purrr")
kmean$tot.withinss

# Calcular within sum of squares
tot.withinss <- map_dbl(1:10, function(k){
  model <- kmeans(iris.all[,3:4], centers = k)
  model$tot.withinss
})

codo <- data.table( k = 1:10,
                    tot.withinss = tot.withinss)

ggplot(codo, aes( x = k, y = tot.withinss)) + geom_line() + scale_x_continuous(breaks = 1:10)
