##Plotting Penguin Data ###
#### Created by: Ashley Carreiro
### Updated: 2025-09-15

### Load Necessary Libraries ###
library(palmerpenguins)
library(tidyverse)
library(here)
library(ggthemes)

###Data###
view(penguins)

###Plotting Penguin Data####
#Going to look at Flipper length

ggplot(data = penguins, 
       aes(x = species,
           y = body_mass_g, 
           color = species)) + 
        
  geom_violin(width = 1.0) +
  geom_boxplot(width = 0.5) +
  geom_jitter(alpha=0.5,width = 0.2)+
  facet_wrap(~year) +
  labs(x = "Year", 
       y = "Body Mass (g)") +
  scale_color_viridis_d() +
 
  
  theme_stata() +
  theme(legend.position = "none",
        axis.title = element_text(size = 20),
        axis.text.x = element_text(size = 12, angle = 90))  


