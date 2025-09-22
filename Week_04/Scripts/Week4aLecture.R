##Class today we are learning more about dplyr and how to organizae data###
## Created by: Ashley Carreiro
## Updated on: 2025-09-26

### Load Libraries ###
library(palmerpenguins)
library(tidyverse)
library(here)

##Data
view(penguins)

##Practice Filtering the data##

##Penguins Filtered in year 2008
 filter(penguins, year == 2008 )

#Penguins that have a body mass greater than 5000

filter(penguins, body_mass_g > 5000)

#FIlter Penguins that were collected in either 2008 or 2009

filter(penguins, year == 2008 | year == 2009)
filter(penguins, year %in% c(2008,2009)) #Another way of filtering parameters like above

#Penguins that are not from the island dream

filter(penguins, island != "Dream")

#Penguins in the species Adelie and Gentoo

filter(penguins, species %in% c("Adelie", "Gentoo"))

#Mutate to create new column to add flipper length and body mass together

data2 <- mutate(penguins, length_body_mass = body_mass_g + flipper_length_mm)

#Use mutate ifelse to create a new column where body mass grater than 4000 is labeled as big and everything else is small

data2 <- mutate(penguins, 
                big_small = ifelse(body_mass_g > 4000, "big", "small"))
view(data2)
