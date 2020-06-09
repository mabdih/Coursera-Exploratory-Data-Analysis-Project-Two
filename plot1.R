# Q1 - Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? 

# Loading the datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate emissions by year
total_emissions_year <- aggregate(Emissions ~ year, 
                                  data = NEI, FUN = sum)

# Plotting line chart of emissions by year
png(filename='plot1.png', width=480, height=480, units='px')
options(scipen=10)
plot(total_emissions_year$year,
     total_emissions_year$Emissions,
     type = "b", 
     xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total PM2.5 Emissions in the US 1999 - 2008")

# Saving the chart
dev.off()
