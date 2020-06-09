# Q3 - Of the four types of sources indicated by type 
# (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases 
# in emissions from 1999-2008 for Baltimore City?

library(tidyverse)

# Loading the datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset to extract only Baltimore City data
baltimore_emissions <- NEI[NEI$fips == "24510",]

# Aggregate emissions by year and type
baltimore_type_year <- aggregate(Emissions ~ year + type, 
                                 data = baltimore_emissions, FUN = sum)

# Plotting line chart for total emissions by year in Baltimore City
png(filename='plot3.png', width=480, height=480, units='px')
options(scipen=10)

plot3 <- ggplot(data=baltimore_type_year, aes(x=year, y=Emissions)) + 
  geom_line() + facet_wrap(.~type, scales = "free_y") + 
  ggtitle("PM2.5 Emission by Type in Baltimore City") + 
  xlab("Year")

print(plot3)

# Saving the chart
dev.off()
