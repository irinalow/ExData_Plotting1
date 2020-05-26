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

par(mfcol=c(2,2))
#top left
plot(date_time, Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)")

#top right
plot(date_time, Voltage,
     ylab="Voltage")

#bottom left
plot(date_time, Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="l",
     col="black")
points(date_time, Sub_metering_2,col="red", type="l")
points(date_time, Sub_metering_3,col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#bottom right
plot(date_time, Global_reactive_power)

