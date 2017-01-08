## Step 1 - Load the data into R
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Step 2 - Filter for the relevant data
mydata_subset <- subset(mydata, Date %in% c("1/2/2007","2/2/2007"))

## Step 3 - Convert column to working formats
mydata_subset$Gap <- as.numeric(as.character(mydata_subset$Global_active_power))

## Step 4 - Create PNG file with output
png("plot1.png", width = 480, height = 480)

## Step 5 - Plot histogram
hist(mydata_subset$Gap, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Last Step, close the device
dev.off()