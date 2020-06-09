# Q6 - Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in 
# Los Angeles County, California (fips == "06037").

# Loading the datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset to extract data motor vehicle sources & Baltimore plus Los Angeles
balt_los_motors <- NEI[NEI$type == 'ON-ROAD' & (NEI$fips == '24510' | NEI$fips == '06037'), ]

# Aggregate emissions from motor vehicle sources by year and city
bl_motor_year <- aggregate(Emissions ~ year + fips, 
                        data = balt_los_motors, FUN = sum)

bl_motor_year$city <- ifelse(bl_motor_year$fips == "24510", 
                             "Baltimore", "Los Angeles")

# Plotting total emissions from motor vehicle sources
png(filename='plot6.png', width=780, height=400, units='px')
options(scipen=10)

plot6 <- ggplot(data=bl_motor_year, aes(x=year, y=Emissions)) + 
  geom_line() + facet_wrap(.~city, scales = "free_y") + 
  ggtitle("PM2.5 Emission - Los Angeles vs Baltimore City") + 
  xlab("Year") + ylab("Total PM2.5 Emissions (Tons)")

print(plot6)

# Saving the chart
dev.off()
