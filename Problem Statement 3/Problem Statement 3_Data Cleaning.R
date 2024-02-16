rm(list=ls())
# Load the necessary library
library(readxl) 
library(writexl)
library(dplyr)   

# Import the dataset
dataset <- read_excel("C:\\Users\\Aaron\\OneDrive\\Desktop\\MA4892 Project V2\\dataset.xlsx")

# Inspect the dataset
head(dataset)  # View the first few rows
str(dataset)   # Check the structure and data types
summary(dataset)  # Summary statistics for initial inspection

## General Data Cleaning ##

# Shorten column headers
colnames(dataset)

# Define new column names
new_names <- c("AgeGroup", "Gender", "CarCat", "MartialStatus", "PurchaseFactor",
               "LikenessFactor", "ExtComponents", "IntComponents", "SpendChargedAmount",
               "SelfDesignFactor", "SpendAmount", "DesignExp", "DesignOpenIdea")

# Name the columns in dataset
colnames(dataset) <- new_names

# Save the Cleaned Dataset
write_xlsx(dataset, "C:\\Users\\Aaron\\OneDrive\\Desktop\\MA4892 Project V2\\cleaned_dataset.xlsx")

# Save the Cleaned Dataset
write_xlsx(dataset, "C:\\Users\\Aaron\\OneDrive\\Desktop\\MA4892 Project V2\\cleaned_dataset.xlsx")

# Read the Cleaned Dataset 
dataset_cleanedv2 <- read_excel("C:\\Users\\Aaron\\OneDrive\\Desktop\\MA4892 Project V2\\cleaned_dataset.xlsx")
