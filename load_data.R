# function for loading and formatting data
# source of raw data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

if (!file.exists("./data/PowerConsumption.csv")) {
  # reading raw data to a data frame
  # missing values are coded as ?
  data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
  attach(data)
  
  # using data of 2007-02-01 and 2007-02-02
  data <- data[(Date == "1/2/2007" | Date == "2/2/2007"), ]
  attach(data)
  
  # converting the Date and Time variables
  data$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  rownames(data) <- 1 : nrow(data)
  attach(data)
  
  
  data <- cbind(data[, 10], data[, 3:9])
  colname <- colnames(data)
  colname[1] <- "Date_time"
  colnames(data) <- colname
  attach(data)
  
  # writing final data
  write.csv(data, file = "./data/PowerConsumption.csv", row.names = FALSE)
} else {
  
    # reading clean data to a data frame
  data <- read.csv(file = "./data/PowerConsumption.csv", header = TRUE)
  attach(data)
}

