
dfsolutions <- read.csv(file="C:\\projects\\Rdu1\\solutions.csv", header=TRUE, sep=",")


dfsolutions <- as.data.frame(dfsolutions)


time <- dfsolutions[,6]
head(dfsolutions, n=10)


print(str(dfsolutions))


dfsolutions <- na.omit(dfsolutions)


dfsolutions[, 'subject_id'] <- factor(dfsolutions[,'subject_id'])


dfsolutions$stop[6]


print(dfsolutions[4,6])


nums <- unlist(lapply(dfsolutions, is.numeric))
dfsolutions_numeric = dfsolutions[, nums]
dfsolutions_numeric <- as.data.frame(dfsolutions_numeric)


lapply(dfsolutions_numeric, mean)


dfsolutions$time <- ifelse(dfsolutions$time_left > 2200, TRUE, FALSE)


dfsolutions_1 <- dfsolutions[dfsolutions$problem_id > 200, ]
dfsolutions_1 <- as.data.frame(dfsolutions_1)


dfsolutions_2 <- dfsolutions[order(dfsolutions$subject_id),]
dfsolutions_2 <- as.data.frame(dfsolutions_2)


print(summary(dfsolutions$time_left))


boxplot(dfsolutions$time_left~dfsolutions$answer,col="red")


hstr <- dfsolutions$time_left[dfsolutions$subject_id == 23]
hist(hstr, col = "green")
abline(h=5, col="orange", lty=2, lwd=3)


library(lattice)
xyplot(dfsolutions$start ~ dfsolutions$stop | dfsolutions$answer, data=dfsolutions)


library(ggplot2)
qplot(x=dfsolutions$start, y=dfsolutions$stop, data = dfsolutions)+
facet_wrap(~time)


funkcia <- function(c, n, d){
  f = seq(1, n, by=0.5)
  
  for(val in f){
    if(val == c){
      val <- "A"
      print(val)
    }else if(val == d){
      val <- "B"
      print(val)
    }else{
      print(val)
    }
  }
  
}

funkcia(2, 5, 3)

attach(mtcars)
par(mfrow=c(3,1))
hist(quakes$mag, main="Histogram of quake magnitudes", xlab="Magnitude of quakes",
     ylab="Number of quakes", 
     col = "blue", breaks = 15)
abline(v=4.8, col="red", lwd=3, lty=2)
boxplot(quakes$depth, main="Depth of quakes", ylab="Depth")
abline(h=400, col="yellow", lwd=5)
plot(y=quakes$lat, x=quakes$long, main="Positions of quakes", xlab="Longitude", 
     ylab="Lattitude", pch=17, col="red")
rect(172, -20, 182, -30, density=5, col="blue")




