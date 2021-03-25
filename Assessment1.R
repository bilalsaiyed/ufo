# Question 1
# File downloaded from Blackboard and inserted into data frame 
# Replaced the missing content with NA
ufo_data <- read.csv("ufo.csv", na = "")

# Question 2
# View the structure of the data frame
str(ufo_data)
# Display first 15 rows of data within the data frame
head(ufo_data, 15)
# Display the number of rows within the UFO data frame
nrow(ufo_data)

# Question 3
# Convert date to a date variable
# It is currently in mm/dd/yyyy
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%Y")
converted_date
str(converted_date)

# Question 4
# Replace the datetime field in the data frame
ufo_data$datetime <- converted_date
# View the structure of the updated data frame
str(ufo_data)

# Question 5
# Display the names of the UFO data frame
names(ufo_data)

# Change the variable titles to make them more readable
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"

# Displaying the names of the updated UFO data frame
names(ufo_data)

# Question 6
# Convert latitude variable to numeric
ufo_data$latitude <- as.numeric(ufo_data$latitude)
str(ufo_data)

# Question 7
# Install and use the mice package to show missing vars in the ufo data frame
install.packages("mice")
library(mice)
md.pattern(ufo_data)

# From the plot, 69528 records have no missing content
# From the plot, 196 variables have all data variables missing


# Question 8
# Sort by shape and then city within UFO data frame
# Store in data frame called sorted_ufo_data
attach(ufo_data)
sorted_data <- ufo_data[order(shape, city),]
sorted_data

# Drop attributes (var) from data
# Shows where specific var names are
include_list <- names(sorted_data) %in% c("datetime", "city","country","shape")
include_list

# This data frame only contains datetime, city, country, shape
sorted_ufo_data <- sorted_data[(include_list)]

# Display the first 15 rows of data in this new data frame
head(sorted_ufo_data, 15)

# Question 9
# Using the subset function to extract all records where country = gb and shape = disk
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk",)
ufo_gb_disk

# Question 10
# saving the data frames to a csv file
write.csv(ufo_data, file = "modified_ufo.csv")
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
write.csv(sorted_ufo_data, file = "sorted_ufo.csv")
















