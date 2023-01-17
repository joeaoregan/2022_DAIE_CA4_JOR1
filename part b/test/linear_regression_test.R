# Linear Regression
# http://r-statistics.co/Linear-Regression.html

cat("\014")

if(!require("e1071"))
  install.packages("e1071")
if(!require("DAAG"))
  install.packages("DAAG")

head(cars)

scatter.smooth(x=cars$speed, y=cars$dist, main="Dist ~ Speed")  # scatterplot

# BOX PLOT
# Outlier: any datapoint outtside the 1.5 IQR

par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(cars$speed, main="Speed", sub=paste("Outlier rows: ", boxplot.stats(cars$speed)$out))  # box plot for 'speed'
boxplot(cars$dist, main="Distance", sub=paste("Outlier rows: ", boxplot.stats(cars$dist)$out))  # box plot for 'distance'


# DENSITY PLOT

library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
plot(density(cars$speed), main="Density Plot: Speed", ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(cars$speed), 2)))  # density plot for 'speed'
polygon(density(cars$speed), col="red")
plot(density(cars$dist), main="Density Plot: Distance", ylab="Frequency", 
     sub=paste("Skewness:", round(e1071::skewness(cars$dist), 2)))  # density plot for 'dist'
polygon(density(cars$dist), col="red")

# CORRELATION

cor(cars$speed, cars$dist) # calculate correlation between speed and distance


# LINEAR MODEL

linearMod <- lm(dist ~ speed, data=cars)  # build linear regression model on full data
print(linearMod)


# LINEAR REGRESSION DIAGNOSTICS

summary(linearMod)  # model summary


# P Value - Check for statistical significance

# Null and Alternate Hypothesis

# Null hypothesis: the coefficients associated with the variables is equal to zero
# Alternate hypothesis: the coefficients are not equal to zero (relationship exists between dependent and independent variables)

# t-value: the higher the better


modelSummary <- summary(linearMod)  # capture model summary as an object
modelCoeffs <- modelSummary$coefficients  # model coefficients
beta.estimate <- modelCoeffs["speed", "Estimate"]  # get beta estimate for speed
std.error <- modelCoeffs["speed", "Std. Error"]  # get std.error for speed
t_value <- beta.estimate/std.error  # calc t statistic
p_value <- 2*pt(-abs(t_value), df=nrow(cars)-ncol(cars))  # calc p Value
f_statistic <- linearMod$fstatistic[1]  # fstatistic
f <- summary(linearMod)$fstatistic  # parameters for model p-value calc
model_p <- pf(f[1], f[2], f[3], lower=F)

t_value
p_value
f_statistic
f
model_p


# R-SQUARED AND ADJ R-SQUARED

# AIC and BIC

AIC(linearMod)
BIC(linearMod)

# PREDICTING LINEAR MODELS

# Create Training and Test data -

# step 1
# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(cars), 0.8*nrow(cars))  # row indices for training data
trainingData <- cars[trainingRowIndex, ]  # model training data
testData  <- cars[-trainingRowIndex, ]   # test data


# step 2
# Build the model on training data -
lmMod <- lm(dist ~ speed, data=trainingData)  # build the model
distPred <- predict(lmMod, testData)  # predict distance

# step 3
summary(lmod) # model summary
AIC(lmod) # calculate akaike infomration criterion

# step 4
actuals_preds <- data.frame(cbind(actuals=testData$dist, predicteds=distPred))
correlation_accuracy <- cor(actuals_preds)
head(actuals_preds)

min_max_accuracy <-mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)
#mape


# k-Fold Cross Validation

#head(cars)

library(DAAG)
# cvResults <- suppressWarnings(CVlm(df=cars, form.lm=dist ~ speed, m=5, dots=FALSE,  seed=29, legend.pos="topleft",  printit=FALSE, main="Small symbols are predicted values while bigger ones are actuals."));
#attr(cvResults, 'ms')