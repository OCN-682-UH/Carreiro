#Ashley Carreiro
#Created 09-09-2025
#Updated 09-09-2025

# Week 3 ggplot 2
#Learning ggplot2 

# Load Libraries

library(palmerpenguins)
library(tidyverse)

#Data
glimpse(penguins)
head(penguins)
view(penguins)

#Visualize Data Using ggplot2

ggplot(data = penguins, 
  mapping = aes( x = bill_depth_mm,
                 y = bill_length_mm,
                 color = species,
                 shape = island,
                 size = body_mass_g, 
                 alpha = flipper_length_mm)) +
  geom_point() +
  labs(title = "Bill depth and length", 
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins", 
       x = "Bill Depth (mm)", y = "Bill Length (mm)", 
       color = "Species",#Changing the title of the legend
       caption = "Source: Palmer Station LTER / palmerpenguins package") +
  scale_color_viridis_d() #d stands for discrete because we have 3 discrete groups


#Example of setting 
#geom_point(size = 2, alpha = 0.5)

#Faceting the data
ggplot(penguins, 
       aes( x= bill_depth_mm,
            y = bill_length_mm)) +
  geom_point() +
  scale_color_viridis_d() +
  facet_wrap(~species) +
  guides( color = FALSE) #Would get rid of the color legend



# ggplot(data = [dataset], mapping = aes (x= [x-variable], y= [y-variable])) + geom_xxx() + 

