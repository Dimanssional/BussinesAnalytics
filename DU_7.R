
poc_rokov <- c(3, 8, 9, 13, 3, 6, 11, 21, 1, 16)
prijem <- c(30, 57, 64, 72, 36, 43, 59, 90, 20, 83)

pr <- data.frame(poc_rokov, prijem)

model <- lm(prijem~poc_rokov)

predicted <- predict(model)

pr$predicted <- predicted

library(compare)
compare(pr$prijem, pr$predicted)

poc_rokov <- c(10, 15, 20)
pr1 <- data.frame(poc_rokov)

prijem <- predict(model, pr1)
pr1$prijem <- prijem


state <- as.data.frame(state.x77)
model1 <- lm(state$Murder ~ state$Illiteracy+state$`Life Exp`)

Murder_predict <- predict(model1, newdata = data.frame(state$Murder))
state$Murder_predict <- Murder_predict

library(ggplot2)
ggplot(state, aes(seq_along(Murder))) +                    
  geom_point(aes(y=Murder), colour="blue") +  
  geom_point(aes(y=Murder_predict), colour="red")+
  geom_line(aes(y=Murder_predict), colour="red")


print(model1)
print(summary(model1))


CO2 <- as.data.frame(CO2)

CO2 <- CO2[-c(1)]
set.seed(8)

ind<-sample(2, nrow(CO2), replace = TRUE, prob= c(0.7, 0.3))
train.data<-CO2[ind== 1, ]
test.data<-CO2[ind== 2, ]

library(party)

myFormula <- Treatment ~ conc + uptake + Type
co2_ctree <- ctree(myFormula, data = train.data)

table(predict(co2_ctree), train.data)
print(co2_ctree)

plot(co2_ctree)

testPred <- predict(co2_ctree, newdata = test.data)

library(caret)
tbl <- confusionMatrix(test.data$Treatment, testPred)
print(tbl)


library(e1071)
classifier <- naiveBayes(train.data[, 3:4], train.data[, 2])

pred <- predict(classifier , newdata=test.data)
tbl1 <- table(predict(classifier, test.data[, 3:4]), test.data[, 2])
confusionMatrix(predict(classifier, test.data[, 3:4]), test.data[, 2])

num_i = sum(tbl1)
num_class = nrow(tbl1)
diag = diag(tbl1) 
num_in = apply(tbl1, 1, sum) 
num_p = apply(tbl1, 2, sum)


accuracy = sum(diag) / num_i
print(accuracy)

precision = diag / num_p 
print(precision)

recall = diag / num_in 
print(recall)

F1 = 2 * precision * recall / (precision + recall) 
print(F1)


library(arules)

train.data[, 4] <- discretize(train.data[, 4], method="interval",breaks = 2)
train.data[, 3] <- discretize(train.data[, 3], method="interval",breaks = 2)

classifier_1 <- naiveBayes(train.data[, 3:4], train.data[, 1])
tbl2 <- table(predict(classifier_1 , train.data[, 3:4]), train.data[, 1])
confusionMatrix(predict(classifier_1 , test.data[, 3:4]), test.data[, 1])

num_i = sum(tbl2)
num_class = nrow(tbl2)
diag = diag(tbl2) 
num_in = apply(tbl2, 1, sum) 
num_p = apply(tbl2, 2, sum)


accuracy = sum(diag) / num_i
print(accuracy)

precision = diag / num_p 
print(precision)

recall = diag / num_in 
print(recall)

F1 = 2 * precision * recall / (precision + recall) 
print(F1)


ind<-sample(2, nrow(CO2), replace = TRUE, prob= c(0.8, 0.2))
co2.training<-CO2[ind== 1, 3:4]
co2.test<-CO2[ind== 2,3:4 ]
co2.trainLabels<-CO2[ind== 1, 2]
co2.testLabels<-CO2[ind== 2, 2]

library(class)
co2_pred = knn(co2.training, co2.test, co2.trainLabels, k=2)

comparing <- table(co2.testLabels, co2_pred)
print(comparing)

num_i = sum(comparing)
num_class = nrow(comparing)
diag = diag(comparing) 
num_in = apply(comparing, 1, sum) 
num_p = apply(comparing, 2, sum)


accuracy = sum(diag) / num_i
print(accuracy)

precision = diag / num_p 
print(precision)

recall = diag / num_in 
print(recall)

F1 = 2 * precision * recall / (precision + recall) 
print(F1)
