# Q4 - Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?

# Loading the datasets into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset to extract only data for coal related sources
sources <- SCC[grep('coal', SCC$Short.Name, ignore.case = T), ]
NEI2 <- NEI[NEI$SCC %in% sources$SCC,]
  
# Aggregate emissions from coal combustion by year
coal_year <- aggregate(Emissions ~ year, 
                                 data = NEI2, FUN = sum)

# Plotting total emissions from coal combustion sources
png(filename='plot4.png', width=480, height=480, units='px')
options(scipen=10)

plot(coal_year$year,
     coal_year$Emissions,
     type = "b", 
     xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)",
     main = "Total PM2.5 Emissions From Coal Combustions")

# Saving the chart
dev.off()
