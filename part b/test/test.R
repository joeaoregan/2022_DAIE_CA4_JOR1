
cat("\014") # clear screen
set.seed(0) # reproduce random values

#wd <- getwd()
#setwd("..")
#parent <- getwd()
#setwd(wd)

#dirname(getwd())
#setwd("D:/2022 DKIT/DA-CA4-Part1/2022_DAIE_CA4_JOR1")
#getwd()

setwd(Sys.getenv(c("DAIE_CA4_HOME"))) # created environment variable with path to ca4 repo
getwd() # shows current working directory


data <- readr::read_csv("part b/amalgamated_game_survey_250_2022.csv") # read data from csv
numeric_cols <- unlist(lapply(data, is.numeric))
numeric_data <- data[ , numeric_cols]
colnames(numeric_data)

hist(data$age)
hist(data$avg_monthly_hrs_gaming)
hist(data$avg_years_playing_games)
hist(data$avg_monthly_expenditure_dlc)

shapiro.test(data$age)
shapiro.test(data$avg_monthly_hrs_gaming)
shapiro.test(data$avg_years_playing_games)
shapiro.test(data$avg_monthly_expenditure_dlc)

par(mfrow=c(1,2)) # define plotting region

log_age <- log10(data$age) # log transformation
hist(data$age, col='steelblue', main='Original') # histogram for original distribution
hist(log_age, col='coral2', main='Log Transformed') # histogram for log-transformed distribution 

sqrt_age <- sqrt(data$age) # square root transformation
hist(data$age, col='steelblue', main='Original') # histogram for original distribution
hist(sqrt_age, col='coral2', main='Log Transformed') # histogram for square root-transformed distribution 

cube_age <- data$age^(1/3) # cube root transformation
hist(data$age, col='steelblue', main='Original') # histogram for original distribution
hist(cube_age, col='coral2', main='Log Transformed') # histogram for cube root-transformed distribution 

