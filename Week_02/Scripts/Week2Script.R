### Learning how to use R studio and Github correctly. Practicing how to import data
### Created by: Ashley Carreiro
### Created on: 2025-09-04
### Updated on: 2025-09-05
########################################

### Load Libraries ######
library(tidyverse)
library(here)


### Read in Data #####
WeightData <- read_csv(here("Week_02", "Data", "weightdata.csv"))


### Data Analysis ####
head(WeightData) # Looks at the top 6 lines of the dataframe
tail(WeightData) # Looks at the bottom 6 lines of the dataframe
view(WeightData) #Get in the habit of viewing your data when you import it
