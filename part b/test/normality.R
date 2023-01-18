# normality
# https://www.statology.org/test-for-normality-in-r/

cat("\014")

# Method 1: Create a Histogram

#make this example reproducible
set.seed(0)

#create data that follows a normal distribution
normal_data <- rnorm(200)

#create data that follows an exponential distribution
non_normal_data <- rexp(200, rate=3)

#define plotting region
par(mfrow=c(1,2)) 

#create histogram for both datasets
hist(normal_data, col='steelblue', main='Normal')
hist(non_normal_data, col='steelblue', main='Non-normal')


# Method 2: Create a Q-Q plot

#make this example reproducible
set.seed(0)

#create data that follows a normal distribution
normal_data <- rnorm(200)

#create data that follows an exponential distribution
non_normal_data <- rexp(200, rate=3)

#define plotting region
par(mfrow=c(1,2)) 


#create Q-Q plot for both datasets
qqnorm(normal_data, main='Normal')
qqline(normal_data)

qqnorm(non_normal_data, main='Non-normal')
qqline(non_normal_data)


# Method 3: Perform a Shapiro-Wilk Test

#make this example reproducible
set.seed(0)

#create data that follows a normal distribution
normal_data <- rnorm(200)

#perform shapiro-wilk test
shapiro.test(normal_data)

#create data that follows an exponential distribution
non_normal_data <- rexp(200, rate=3)

#perform shapiro-wilk test
shapiro.test(non_normal_data)


# Method 4: Perform a Kolmogorov-Smirnov Test

#make this example reproducible
set.seed(0)

#create data that follows a normal distribution
normal_data <- rnorm(200)

#perform kolmogorov-smirnov test
ks.test(normal_data, 'pnorm')

#create data that follows an exponential distribution
non_normal_data <- rexp(200, rate=3)

#perform kolmogorov-smirnov test
ks.test(non_normal_data, 'pnorm') 
