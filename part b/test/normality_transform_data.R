# How to Transform Data in R (Log, Square Root, Cube Root)
# https://www.statology.org/transform-data-in-r/

df <- data.frame(y=c(1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 6, 7, 8),
                 x1=c(7, 7, 8, 3, 2, 4, 4, 6, 6, 7, 5, 3, 3, 5, 8),
                 x2=c(3, 3, 6, 6, 8, 9, 9, 8, 8, 7, 4, 3, 3, 2, 7))

## Shapiro-Wilk test
shapiro.test(df$y) # Test on original data - fails


# 1. Log Transformation in R
log_y <- log10(df$y) # log transformation

# Histograms
hist(df$y, col='steelblue', main='Original') # histogram for original distribution
hist(log_y, col='coral2', main='Log Transformed') # histogram for log-transformed distribution 

shapiro.test(log_y) # Shapiro test on log-transformed data - ok


# 2. Square Root Transformation in R
sqrt_y <- sqrt(df$y) # square root transformation

# Histograms
hist(df$y, col='steelblue', main='Original') # original distribution
hist(sqrt_y, col='coral2', main='Square Root Transformed') # square root-transformed distribution 

shapiro.test(sqrt_y) # Shapiro test on cube root-transformed data - ok


# 3. Cube Root Transformation in R
cube_y <- df$y^(1/3) # cube root transformation

# Histograms
hist(df$y, col='steelblue', main='Original') # original distribution
hist(cube_y, col='coral2', main='Cube Root Transformed') # cube root-transformed distribution 

shapiro.test(cube_y) # Shapiro test on cube root-transformed data - ok


shapiro.test(df$y)
shapiro.test(log_y)
shapiro.test(sqrt_y)
shapiro.test(cube_y)