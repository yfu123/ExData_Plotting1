## Step 1 - Load the data into R
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Step 2 - Filter for the relevant data
mydata_subset <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

## Step 3 - Convert column to working formats
mydata_subset$DateTime <- strptime(paste(mydata_subset$Date, mydata_subset$Time), "%d/%m/%Y %H:%M:%S")
mydata_subset$sm1 <- as.numeric(as.character(mydata_subset$Sub_metering_1))
mydata_subset$sm2 <- as.numeric(as.character(mydata_subset$Sub_metering_2))
mydata_subset$sm3 <- as.numeric(as.character(mydata_subset$Sub_metering_3))

## Step 4 - Create PNG file with output
png("plot3.png", width = 480, height = 480)

## Step 5 - Plot graph
plot(mydata_subset$DateTime, mydata_subset$sm1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(mydata_subset$DateTime, mydata_subset$sm2, col = "red")
lines(mydata_subset$DateTime, mydata_subset$sm3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))

## Last Step, close the device
dev.off()