# energy_use <- read.csv("data/household_power_consumption.txt", colClasses = c("Date", "character", 
#                                                                               "factor", "numeric", "numeric"))

setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

energy_use <- read.csv("data/household_power_consumption_short.txt", 
                       sep=";", colClasses= c("myDate", "character", "numeric",
                                              "numeric","numeric","numeric",
                                              "numeric","numeric","numeric"))


energy_use_subset <- energy_use[energy_use$Date == as.Date("2007-02-01") |
                                energy_use$Date == as.Date("2007-02-02")  ,]


hist(energy_use_subset$Global_active_power, main='Global Active Power', col='red',
     xlab='Global Active Power (kilowatts)')

#  Now copy the histogram to a png file
dev.copy(png, file='plot1.png', width = 480, height = 480 )
dev.off()
