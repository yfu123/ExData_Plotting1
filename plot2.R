## Step 1 - Load the data into R
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Step 2 - Filter for the relevant data
mydata_subset <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

## Step 3 - Convert column to working formats
mydata_subset$DateTime <- strptime(paste(mydata_subset$Date, mydata_subset$Time), "%d/%m/%Y %H:%M:%S")
mydata_subset$Gap <- as.numeric(as.character(mydata_subset$Global_active_power))

## Step 4 - Create PNG file with output
png("plot2.png", width = 480, height = 480)
par(mfrow = c(1,1), mar = c(4, 4, 4, 2))

## Step 5 - Plot line graph
plot(mydata_subset$DateTime, mydata_subset$Gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Last Step, close the device
dev.off()