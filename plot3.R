df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)


# converting date and time column to date and time object and sub metering to numeric


df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df <- cbind(df, Date_Time)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <-strptime(df$Time, format="%H:%M:%S")

# sub setting between date range 

sub_df <- subset(df, Date == "2007-02-01" | Date =="2007-02-02")

par(mfrow=c(1, 1))
plot(sub_df$Date_Time,sub_df$Sub_metering_1, xlab="Days", ylab="Energy Sub Metering", type = "l", col="black")
lines(sub_df$Date_Time, sub_df$Sub_metering_2, col="red", type = "l")
lines(sub_df$Date_Time, sub_df$Sub_metering_3, col="blue", type="l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                                col=c("black", "red", "blue"), lty = 1, lwd=2)

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()