elnino <- read.table("elnino")
elnino < as.data.frame(elnino)


names(elnino)[c(1, 2, 3, 4, 5, 6, 7, 8, 9)] <- c("day", "buoy", "latitude", "longitude", "zon.winds", "mer.winds", 
                                                 "huimidity", "air temp.", "s.s temp.")

print(str(elnino))


for(i in 4:ncol(elnino)){
  elnino[,i] <- as.numeric(elnino[, i])
}


print(str(elnino))


na_count <- sapply(elnino, function(y) sum(length(which(is.na(y)))))
na_count <- data.frame(na_count)


library(plyr)

cnt_of_notes <- count(elnino, "day")
print(cnt_of_notes)

cnt_of_notes <- table(cnt_of_notes)

barplot(cnt_of_notes, main = "Number of Notes", col=c("darkblue","red", "green"))

library(ggplot2)

boxplot(elnino$`air temp.`, data=elnino ,col = "green", horizontal = TRUE)


hist(elnino$`s.s temp.`, col = "blue")


elnino_2 <- elnino

for (i in 4:6){
  elnino_2[is.na(elnino_2[,i]), i] <- mean(elnino_2[,i], na.rm = TRUE)
}


for(i in 6:8){
  elnino_2[is.na(elnino_2[,i]), i] <- median(elnino_2[,i], na.rm = TRUE)
}

elnino_2 <- elnino_2[-c(9)]
print(summary(elnino_2))


elnino_1 <- na.omit(elnino)

plot(elnino_1$zon.winds, elnino_1$mer.winds, pch=19, 
     xlab = "Zonal winds", ylab = "Meridional winds", col=c("blue", "red"))


cor(elnino_1[3:9])


library(corrgram)
corrgram(elnino_1, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)


elnino_1$zon.winds_1 <- ifelse(elnino_1$zon.winds > 0, "East", "West")
elnino_1$mer.winds_1 <- ifelse(elnino_1$mer.winds > 0, "North", "South")

elnino_1 <- elnino_1[c(1, 2, 3, 4, 7, 8, 9, 10, 5, 11, 6)]
print(str(elnino_1))

elnino_1[, "zon.winds_1"] <- factor(elnino_1[, "zon.winds_1"])
elnino_1[, "mer.winds_1"] <- factor(elnino_1[, "mer.winds_1"])

print(str(elnino_1))

library(clusterSim)
library(arules)

elnino_1$huimidity <- data.Normalization(elnino_1$huimidity, type="n1")
elnino_1$`air temp.` <- data.Normalization(elnino_1$`air temp.`, type="n5")


elnino_1$`s.s.temp_1` <- discretize(elnino_1$`s.s temp.`, method="interval", breaks = 4)
print(elnino_1$s.s.temp_1)
print(count(elnino_1$s.s.temp_1))


elnino_1$s.s.temp_2 <-cut(elnino_1$`s.s temp.`, breaks = c(20,24,28,32))
print(elnino_1$s.s.temp_2)
print(count(elnino_1$s.s.temp_2))


elnino_1$s.s.temp_3 <- discretize(elnino_1$`s.s temp.`, method = "frequency", breaks = 5)
print(elnino_1$s.s.temp_3)
print(count(elnino_1$s.s.temp_3))

sample_data <- elnino_1[sample(nrow(elnino_1), 100), ]




