df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)


# converting date and time column to date and time object and other columns to numeric


df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df <- cbind(df, Date_Time)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <-strptime(df$Time, format="%H:%M:%S")


# plotting the data

par(mfrow=c(2, 2))

with(sub_df, plot(Date_Time, Global_active_power, type="l",xlab="Days", ylab="Global Active Power(kilowatts)"))

with(sub_df, plot(Date_Time, Voltage, type="l", ylab = "Voltage", xlab="Days"))

with(sub_df, plot(Date_Time,Sub_metering_1, xlab="Days", ylab="Energy Sub Metering", type = "l", col="black"))
lines(sub_df$Date_Time, sub_df$Sub_metering_2, col="red", type = "l")
lines(sub_df$Date_Time, sub_df$Sub_metering_3, col="blue", type="l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = 1, lwd=2, cex = 0.75)

with(sub_df, plot(Date_Time, Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="Days"))

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()