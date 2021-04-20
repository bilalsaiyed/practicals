diabetes_data <- read.csv("diabetes.csv", na = "")
str(diabetes_data)

incomplete_data <- diabetes_data[!complete.cases(diabetes_data),]

install.packages("mice")
library(mice)
md.pattern(diabetes_data)

library(VIM)
missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)

#Summary
summary(missing_values)

diabetes_data$Date <- paste(diabetes_data$Month, diabetes_data$Year, sep='/')
str(diabetes_data)

diabetes_data$Date <- paste(diabetes_data$Month, diabetes_data$Year, "01", sep='/')

diabetes_data$Date <- as.Date(diabetes_data$Date, format ="%m/%Y/%d")
str(diabetes_data)

# Plot the status variable using the plot() function
# Convert to a factor first
plot(diabetes_data$Status)
diabetes_data$Status <- factor(diabetes_data$Status)
str(diabetes_data)
plot(diabetes_data$Status)
summary(diabetes_data)

# Add titles to the chart that are relevant
attach(diabetes_data)
display_settings <- par(no.readonly = TRUE)
plot(Status, main = "No. of Patient recoveries", xlab= "Diabetes status", ylab= "No of patients")

# Save the modified diabetes data frame
write.csv(diabetes_data, file = "diabetes-dta-modified.csv")




