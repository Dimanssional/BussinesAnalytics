

mtcars1 <- as.data.frame(mtcars) 

mtcars1 <- mtcars[, 4:5] 

kmeans.result1 <- kmeans(mtcars1, 2)
table(mtcars$vs, kmeans.result1$cluster)

plot(mtcars1, col = kmeans.result1$cluster, pch=20)
points(kmeans.result1$centers, col= 1:2, pch=11)


library(dplyr)
mtcars2 <- select(mtcars, mpg, qsec)

hc2 <- hclust(dist(mtcars2), method = "ave")
plot(hc2)
rect.hclust(hc2, k = 3) 
groups <- cutree(hc2 , k = 3) 

mtcars$groups <- groups

library(arules)
data("AdultUCI")

AdultUCI1 <- select_if(AdultUCI, is.factor)
rules1 <- apriori(AdultUCI1,parameter = list(minlen=4, supp=0.01, conf=0.68), appearance =
                    list(rhs=c("income=small","income=large")))

rules1 <- sort(rules1, by="lift")
rules1 <- rules1[!is.redundant(rules1)]


