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



ggplot(data = PenguinsLog, #assign it to a name
               aes(x = species,
                   y = log_body_mass)) + 
  geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
  geom_jitter(aes(color = species), alpha = 0.5, show.legend = FALSE) +
  scale_color_viridis_d() +
  facet_wrap(~island) +
 
  labs(x = "Penguin Species", 
       y = "Log Scale of Penguin Body Mass (g)") +
  theme_bw() +
  theme(text = element_text(face = "bold"))

ggsave(here("Week_04", "Output", "FemalePenguinMass_4aHomeworkPlot.png"), 
       width = 12, height = 8)


