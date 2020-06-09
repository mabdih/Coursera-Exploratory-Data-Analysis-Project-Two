# Q2 - Have total emissions from PM2.5 decreased in the 
# Baltimore City, Maryland (fips == "24510") from 1999 to 2008?  

# Loading the datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset to extract only Baltimore City data
baltimore_emissions <- NEI[NEI$fips == "24510",]

# Aggregate emissions by year
balt_emissions_year <- aggregate(Emissions ~ year, 
                                  data = baltimore_emissions, FUN = sum)

# Plotting line chart for total emissions by year in Baltimore City
png(filename='plot2.png', width=480, height=480, units='px')
options(scipen=10)
plot(balt_emissions_year$year,
     balt_emissions_year$Emissions,
     type = "b", 
     xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total PM2.5 Emissions in Baltimore, US 1999 - 2008")

# Saving the chart
dev.off()
