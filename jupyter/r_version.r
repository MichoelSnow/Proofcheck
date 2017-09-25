library(tidyverse)
movdt <- read_csv('C:/GitHub/Proofcheck/jupyter/movie_metadata.csv')
movdt2 <- select_if(movdt,is.numeric)
movdt2 <- movdt2 %>% mutate(profit=gross>budget) %>% select(-c(gross,budget))
movdt2 <- movdt2[complete.cases(movdt2),]

fit <- glm(profit~.,data=movdt2,family='binomial')
summary(fit)
