###Week 4a Homework ###

### 2. ilters out (i.e. excludes) male penguins, then calculates the log body mass, 
#then selects only the columns for species, island, sex, and log body mass, 
#then use these data to make any plot. Make sure the plot has clean and clear labels and follows best practices.
#Save the plot in the correct output folder.

###Created by: Ashley Carreiro ####
#### Updated: 2025-16-09 ###

###Load Libraries###
library(palmerpenguins)
library(tidyverse)
library(here)

### Data###
view(penguins)

## 1. calculates the mean and variance of body mass by species, island, and sex without any NAs

penguins %>% #Knows to use penguin data
  drop_na(sex) %>% #Drops all the rows that are missing data on sex
  group_by(species, island, sex) %>% #Groups by species, island, and sex
  summarise(mean_body_mass = mean(body_mass_g, na.rm = TRUE), # finds the mean of the body mass in the grouped data above
            variance_body_mass = var(body_mass_g, na.rm = TRUE)) #finds the variance of the body mass in the grouped data above

## 2. filters out (i.e. excludes) male penguins, then calculates the log body mass, 
#then selects only the columns for species, island, sex, and log body mass, 
#then use these data to make any plot. Make sure the plot has clean and clear labels and follows best practices.

PenguinsLog <- penguins %>% #Use Penguin dataframe and rename new data with columsn PenguinsLog
  filter (sex != "male") %>% #Removes male penguins
  mutate(log_body_mass = log(body_mass_g)) %>%#Adds a column for the log body mass
select(species, island, sex, log_body_mass) #creates a dataframe with only these columns

view(PenguinsLog)

## Create a plot using the dataframe "PenguinsLog"



