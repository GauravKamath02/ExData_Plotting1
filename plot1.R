df <- read.table("household_power_consumption.txt", sep=";", header = TRUE)


# converting date and time column to date and time object and Global active power to numeric

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <-strptime(df$Time, format="%H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)

# sub setting between date range 

sub_df <- subset(df, Date == "2007-02-01" | Date =="2007-02-02")

# plotting

hist(sub_df$Global_active_power, col="red", xlab="Global Active Power(kilowatts)",
     main = "Global Active Power")

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
