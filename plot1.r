# read txt
setwd("/Users/Tzehong/Desktop/learning_folder/RDataScience/Course4")
list.files()

#read data
df_initial <- read.csv(file="household_power_consumption.txt", 
               sep=";", header=T, na.strings=c("?"),
               colClasses = c("character", "character", "numeric",
                              "numeric", "numeric", "numeric",
                              "numeric", "numeric", "numeric"))

library(lubridate)
#merging date and time into one column and convert to date class
df <- df_initial %>%
  mutate(date_time = paste(Date, Time)) %>%
  mutate(date_time = dmy_hms(date_time)) %>%
  filter(date_time >= ymd("2007-02-01") & date_time < ymd("2007-02-03"))

#examine how household energy usage varies over a 2-day period in February, 2007. 
attach(df)
hist(Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylim=c(0,1300),
     col="red")
