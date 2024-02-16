# Install required packages
install.packages("arules")
install.packages("readxl")

# Load required packages
library(arules)
library(readxl)

# Read data from excel
car_data <- read_excel("C:/Users/Jin Hao/Documents/MI assignment/SURVEY_RESULTS_2024.xlsx")

# Rename Columns, define a vector 'headers' with new column names
headers <- c("age_group", "gender", "background", "rs_status", "buyer_factor", "custom_car_likelihood",
             "ext_components", "int_components", "customisation_spending", "custom_car_interest", 
             "price_willingness", "design_exp", "design_ideas")
# Set the column names to the new names 
colnames(car_data) <- headers

car_data$background <- ifelse(car_data$background == "Do not own a car, but planning to purchase in future", "No car", car_data$background)
car_data$design_exp <- ifelse(car_data$design_exp == "No, I would need a designer to model my sketch", "No, I need designer", car_data$design_exp)

# Data Exploration, View the first 6 rows of the dataframe
head(car_data)

dim(car_data) # Dimensions

names(car_data) # Get column names

summary(car_data) # Generate statistical summary

class(car_data) # Get the class/type of the 'car_data' object

# Association Rule Mining, perform association rule mining on 'car_data'
Epub_rule <- apriori(data= car_data, parameter = list(support = 0.5, confidence = 0.2, minlen = 2))

summary(Epub_rule) # Generate summary of the association rules

inspect(Epub_rule[1:10]) # View the first 10 rules

inspect(sort(Epub_rule, by = "lift")[1:10]) # Sort the rules and view the first 10

# Detach and unload the 'arules' package from the R session
detach("package:arules", unload = TRUE)  # For arules
detach("package:readxl", unload = TRUE)

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L