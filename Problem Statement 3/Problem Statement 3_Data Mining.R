# Clear all existing variables
rm(list=ls())

# Load necessary libraries
library(readxl)
library(dplyr)
library(tidyr)
library(cluster)
library(factoextra)

# Read the dataset
data <- read_excel("C:\\Users\\Aaron\\OneDrive\\Desktop\\MA4892 Project V2\\cleaned_dataset.xlsx")

# Convert 'LikenessFactor' to a numeric scale
likeliness_levels <- c("Not likely", "Likely", "Very likely")
data$LikelinessNumeric <- as.numeric(factor(data$LikenessFactor, levels = likeliness_levels))

# Create dummy variables for 'IntComponents'
data <- data %>%
  mutate(IntComponents = strsplit(as.character(IntComponents), ";")) %>%
  unnest(IntComponents) %>%
  mutate(IntDummy = 1) %>%
  pivot_wider(names_from = IntComponents, values_from = IntDummy, values_fill = list(IntDummy = 0))

# Select the demographic columns and the newly created dummies for 'IntComponents'
data_selected <- data %>%
  select(AgeGroup, Gender, LikelinessNumeric, starts_with("IntComponents_"))

# Assuming 'AgeGroup' and 'Gender' need to be converted to numeric for clustering
data_selected <- data_selected %>%
  mutate(AgeGroup = as.numeric(as.factor(AgeGroup)),
         Gender = as.numeric(as.factor(Gender)))

# Scale and center the numerical data
data_scaled_selected <- scale(data_selected[, sapply(data_selected, is.numeric)])

# Perform K-means clustering
set.seed(123) # Set a random seed for reproducibility
k <- 4 # Number of clusters, this should be chosen based on methods like the elbow method
km_results <- kmeans(data_scaled_selected, centers = k, nstart = 25)



# Add cluster assignments to the original data
data$Cluster <- km_results$cluster

# Analyse the composition of each cluster
cluster_summary_selected <- aggregate(data_scaled_selected, by = list(Cluster = data$Cluster), FUN = mean)

# Print the summary for the selected columns
print(cluster_summary_selected)

# Visualise the clusters
fviz_cluster(km_results, data = data_scaled_selected)
