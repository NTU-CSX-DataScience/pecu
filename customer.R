rm(list=ls(all=TRUE))
data <- read.csv("customer.csv", header=T, sep=",")
summary(data)
data$region = factor(data$region)
data$gender = factor(data$gender)
data$edcat = factor(data$edcat)
data$age = factor(data$age)
table(data$gender, data$region)

# Question 1
Q1 = select(data, region, card2spent) %>%
  group_by(region) %>%
  summarise(card2spent = mean(card2spent))
Result1 = Q1$region[which(Q1$card2spent == max(Q1$card2spent))]

# Question 2
data$spentRate = (1+data$card2spent) / data$cardspent
Q2 = select(data, region, spentRate, gender, edcat, age) %>%
  group_by(region, gender, edcat) %>%
  summarise(spentRate = mean(spentRate))
Result2 = Q2[which(Q2$spentRate == min(Q2$spentRate)),]

  