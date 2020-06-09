# Q5 - How have emissions from motor vehicle sources 
# changed from 1999-2008 in Baltimore City?

# Loading the datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset to extract data for motor vehicle sources & Baltimore
motor_sources <- NEI[NEI$type == 'ON-ROAD' & NEI$fips == '24510', ]

# Aggregate emissions from motor vehicle sources by year
motor_year <- aggregate(Emissions ~ year, 
                       data = motor_sources, FUN = sum)

# Plotting total emissions from motor vehicle sources
png(filename='plot5.png', width=480, height=480, units='px')
options(scipen=10)

barplot(
     motor_year$Emissions,
     names.arg = motor_year$year,
     xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total PM2.5 Emissions From Motor Vehicles in Baltimore")

# Saving the chart
dev.off()
