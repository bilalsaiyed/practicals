diabetes_data <- read.csv("Diabetes-md.csv", na = "")

str(diabetes_data)
class(diabetes_data)
dim(diabetes_data)
row(diabetes_data)

diabetes_data[!complete.cases(diabetes_data),]

install.packages("mice")
library(mice)
md.pattern(diabetes_data)

library(VIM)
missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)

summary(missing_values)
