df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)


# converting date and time column to date and time object and Global active power to numeric


df$Global_active_power <- as.numeric(df$Global_active_power)
Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df <- cbind(df, Date_Time)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <-strptime(df$Time, format="%H:%M:%S")

# sub setting between date range 

sub_df <- subset(df, Date == "2007-02-01" | Date =="2007-02-02")


with(sub_df, plot(Date_Time, Global_active_power, type="l",xlab="Days", ylab="Global Active Power(kilowatts)"))

dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
