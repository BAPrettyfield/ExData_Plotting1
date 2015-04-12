# energy_use <- read.csv("data/household_power_consumption.txt", colClasses = c("Date", "character", 
#                                                                               "factor", "numeric", "numeric"))

energy_use <- read.csv("data/household_power_consumption_short.txt", 
                       sep=";", colClasses= c("character", "character", "numeric",
                                              "numeric","numeric","numeric",
                                              "numeric","numeric","numeric"))


energy_use_subset <- energy_use[energy_use$Date == "1/2/2007" |
                                energy_use$Date == "2/2/2007"  ,]

#  Concatenate the date and time and convert to a vector of date objects.
#  Then add the vector to the data.frame
date_part <- energy_use_subset[, 'Date']
time_part <- energy_use_subset[, 'Time']
date_time_str <- paste(date_part, time_part, sep=' ')
dt <- strptime(date_time_str, format="%d/%m/%Y %H:%M:%S", tz="")
energy_use_subset$date_time <- dt

#  Generate the plot
plot(energy_use_subset$date_time, energy_use_subset$Sub_metering_1, type="l",
     xlab='', ylab='Energy sub metering')
lines(energy_use_subset$date_time, energy_use_subset$Sub_metering_2, col='red')
lines(energy_use_subset$date_time, energy_use_subset$Sub_metering_3, col='blue')

#  Create the legend
legend(x='topright', legend=c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), 
       col=c('black', 'red', 'blue'), lty=c(1,1,1), cex=0.5 )

#  Now copy the line plot to a png file
dev.copy(png, file='plot3.png', width = 480, height = 480 )
dev.off()
