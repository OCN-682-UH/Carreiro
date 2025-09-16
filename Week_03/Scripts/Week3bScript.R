##Continuin Practice Ploting Penguin Data Using ggplot2 ###
#### Created by: Ashley Carreiro
### Updated: 2025-09-10

### Load Necessary Libraries ###
library(palmerpenguins)
library(tidyverse)
library(here)
library(devtools) #allows you to install packages directly from GitHub
#use install.github("username/packagename") i.e: devtools::install_github("dill/beyonce")
library(beyonce) #example of color palette package in github
library(ggthemes) # lots of packaged deal themes for your plots

### Load the Data ###
# The data is part of the package, no need to load but view
view(penguins)
glimpse(penguins)

#Plot Data
Plot1 <- ggplot(data = penguins, #assign it to a name
       aes(x = bill_depth_mm,
           y = bill_length_mm, 
           group = species,#Groups data by species
           color = species)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)+ #geom_smooth adds regression, you want to add it after geom_point, lm, makes it a linear model, SE = FALSE takes out the standard error on the lime
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)") +
#scale_color_viridis_d() +
  #scale_x_continuous() +#limits = c(0,25), #This changes your x scale limits, c is concatanate, make the x from 0 - 20
                    #breaks = c(14, 17, 21), # Changing breaks in the data
                   # labels=c("low","medium","high")) + #Changing the names of the breaks
#scale_y_continuous(limits =c(0,50)) #This changes your y scale limits
 # scale_color_manual(values=c("orange","purple","green")) #Manually changing the colors of the species
  scale_color_manual(values = beyonce_palette(20)) +#using a palette from a github repository
 #coord_flip() #flips the x and y axis, puts the x axis as the y axis
  coord_fixed(ratio = 1.5) +#fixes the axis exactly 1:1 ratio, can do ratio = to change the scale of that ratio
#cord_polar("x") #can change it to polar coordinates good for data on a compass
  theme_classic() + #removes everything in the bakcground
  theme(axis.title = element_text(size=20, #change the font size for the axis labels
                                  color = "red"),#change the color of axis labels to red
        panel.background = element_rect(fill = "gray")) #Fill in the background
Plot1
  
  ggsave(here("Week_03", "Output", "penguin.png"),
         width = 10, height = 5)#save your figure to your output folder, change height and width in inches
  #can change it as pdf etc. 
  
  
  ###We are going to play around with diamond data to see it more clearly






ggplot(diamonds, aes(carat, price)) + #Taking the log linearilizes the data
  geom_point() +
  coord_trans(x = "log10", y = "log10") #could just log the x or y axis to transform the data
 
