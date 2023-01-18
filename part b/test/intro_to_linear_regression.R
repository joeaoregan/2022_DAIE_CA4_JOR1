# Introduction to linear regression
# http://htmlpreview.github.io/?https://github.com/andrewpbray/oiLabs-base-R/blob/master/simple_regression/simple_regression.html

#cat("\014")

#if(!require("htmltools"))
#  install.packages("htmltools")
#library(htmltools)


download.file("http://www.openintro.org/stat/data/mlb11.RData", destfile = "mlb11.RData")
load("mlb11.RData")

colnames(mlb11)

par(mfrow=c(1,2)) 
qqnorm(mlb11$runs, main='Normal Runs')
qqline(mlb11$runs)

qqnorm(mlb11$at_bats, main='Normal At Bats')
qqline(mlb11$at_bats)

cor(mlb11$runs, mlb11$at_bats)

#plot_ss(x = mlb11$at_bats, y = mlb11$runs) # ok

# plot_ss(x = mlb11$at_bats, y = mlb11$runs)
# plot_ss(x = mlb11$at_bats, y = mlb11$runs, showSquares = TRUE)

# linear model
ml <- lm(runs ~ at_bats, data = mlb11)
summary(ml)

ml2 <- lm(runs ~ homeruns, data = mlb11)
summary(ml2)

# prediction and prediction errors
plot(mlb11$runs ~ mlb11$at_bats)
abline(ml)
  
# model diagnostics
plot(ml$residuals ~ mlb11$at_bats)
abline(h = 0, lty=3)

hist(ml$residuals)

qqnorm(ml$residuals)
qqline(ml$residuals)
