# Add Regression Line to ggplot2 Plot in R
# https://www.geeksforgeeks.org/add-regression-line-to-ggplot2-plot-in-r/

if(!require("ggplot2"))
  install.packages("ggplot2")
if(!require("dplyr"))
  install.packages("dplyr")
if(!require("caret"))
  install.packages("caret")

library("ggplot2") # 1. Install & load ggplot2  
library(dplyr) # 2. 
library(caret) # 2. createDataPartition

# 1. stat_smooth()

# Create example data
rm(list = ls())
set.seed(87)                             
x <- rnorm(250)
y <- rnorm(250) + 2 *x
data <- data.frame(x, y)

# Print first rows of data
head(data)                                 

# Create basic ggplot and Add regression line
ggp <- ggplot(data, aes(x, y)) +
  geom_point() 
ggp + 
  stat_smooth(method = "lm", formula = y ~ x, geom = "smooth")


# 2. geom_smooth()

# Load the data
data("Boston", package = "MASS")

# Split the data into training and test set
training.samples <- Boston$medv %>%
  createDataPartition(p = 0.85, list = FALSE)

#Create train and test data
train.data  <- Boston[training.samples, ]
test.data <- Boston[-training.samples, ]

# plotting the data
ggp<-ggplot(train.data, aes(lstat, medv) ) +
  geom_point() 

# adding the regression line to it
ggp+geom_smooth(method = "loess",
                formula = y ~ x)


# 3. geom_abline()

rm(list = ls())

# Install & load ggplot2
library("ggplot2")


set.seed(87) 

# Create example data
x <- rnorm(250)
y <- rnorm(250) + 2 *x
data <- data.frame(x, y)

reg<-lm(formula = y ~ x, data=data)                      

#get intercept and slope value
coeff<-coefficients(reg)          
intercept<-coeff[1]
slope<- coeff[2]

# Create basic ggplot
ggp <- ggplot(data, aes(x, y)) +   
  geom_point()

# add the regression line
ggp+geom_abline(intercept = intercept, slope = slope, color="red", 
                linetype="dashed", size=1.5)+
  ggtitle("geeksforgeeks") 