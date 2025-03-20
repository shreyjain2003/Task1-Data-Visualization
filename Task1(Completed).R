library(ggplot2)
library(dplyr)
# Manually choose the file
file_path <- file.choose()

# Load the dataset
df_population <- read.csv(file_path, skip=4)  # Skipping metadata rows

# View the structure of the dataset
head(df_population)

# Select only Country Name and 2023 Population data
df_latest <- df_population %>% select(Country.Name, X2023) %>% rename(Population = X2023)

# Remove missing values
df_latest <- na.omit(df_latest)

# View processed data
head(df_latest)

# Select top 10 most populated countries
top_10 <- df_latest %>% arrange(desc(Population)) %>% head(10)

# Create bar chart
ggplot(top_10, aes(x = reorder(Country.Name, Population), y = Population)) +
  geom_bar(stat = "identity", fill = "blue") +
  coord_flip() +
  labs(title = "Top 10 Most Populated Countries (2023)", x = "Country", y = "Population") +
  theme_minimal()

ggplot(df_latest, aes(x = Population)) +
  geom_histogram(bins = 30, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Country Populations (2023)", x = "Population", y = "Frequency") +
  theme_minimal()

