brexit_data <- read.csv("data_brexit_referendum.csv", na = "")
str(brexit_data)
class(brexit_data)
head(brexit_data, 5)

sum(brexit_data$Leave[brexit_data$Leave == -1])

brexit_data$Leave[brexit_data$Leave == -1] <- NA
sum(brexit_data$Leave[brexit_data$Leave == -1])

na_records <- brexit_data[!complete.cases(brexit_data),]

nrow(na_records)

library(mice)
md.pattern(brexit_data)

library(VIM)
missing_values <- aggr(brexit_data, prop = FALSE, numbers = TRUE)
summary(missing_values)

brexit_data$Proportion <- brexit_data$Leave / brexit_data$NVotes

brexit_data$Vote[brexit_data$Proportion <= 0.5] <- "Remain"
brexit_data$Vote[brexit_data$Proportion > 0.5] <- "Leave"

str(brexit_data)

attach(brexit_data)
brexit_data$RegionName[RegionName == "London"] <- "L"
brexit_data$RegionName[RegionName == "North West"] <- "NW"
brexit_data$RegionName[RegionName == "North East"] <- "NE"
brexit_data$RegionName[RegionName == "South West"] <- "SW"
brexit_data$RegionName[RegionName == "South East"] <- "SE"
brexit_data$RegionName[RegionName == "East Midlands"] <- "EM"
brexit_data$RegionName[RegionName == "West Midlands"] <- "WM"
brexit_data$RegionName[RegionName == "East of England" ] <- "EE"
brexit_data$RegionName[RegionName == "Yorkshire and the Humber"] <- "Y"

summary(brexit_data)

is.numeric(Proportion)
is.numeric(RegionName)

numeric_variable_list <- sapply(brexit_data, is.numeric)
class(numeric_variable_list)
numeric_variable_list

numerical_data <- brexit_data[numeric_variable_list]
head(numerical_data, 5)

numeric_variable_list["ID"] <- FALSE

numerical_data <- brexit_data[numeric_variable_list]
head(numerical_data, 5)

lapply(numerical_data, summary)

names(brexit_data)


