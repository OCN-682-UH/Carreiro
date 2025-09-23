### Week 4b Homework ###
### Created by: Ashley Carreiro ###
### Updated on: 2025-09-22

## Load Libraries ##
library(tidyverse)
library(here)
## Load Data ###
ChemData <- read_csv(here("Week_04", "Data", "chemicaldata_maunalua.csv"))
view(ChemData)
#Remove all NAS 
#Serarate the Tide_time column into appropriate columns for analysis
#Filter out a subset of data  of choice
#Use either pivot_longer or wider at least onvce
#Calculate some summary statistics and export he csv file 
##Make any kind of plot (not box) and export to output folder
#make sure you comment your code 

ChemClean_Data <- ChemData %>%
  drop_na() %>% #Remove all NAs
  separate(col = Tide_time, #Separating the tide_time column into two columns
           into = c("Tide", "Time"), 
           sep = "_") %>%
  filter(Time == "Day") %>% #Filtering to only have daytime data
  pivot_longer(cols = Temp_in:percent_sgd, #Putting the data into long format
               names_to = "Measured_Variable", 
               values_to = "Values") %>%
 select(Zone, Tide, Site, Season, Measured_Variable, Values ) %>%
  group_by(Zone, Tide, Site, Season, Measured_Variable, Values) %>%
  summarise(mean(Values)) %>%#Summarizing the values by the grouping variables above 
  
  write_csv(here( "Week_04", "Output", "ChemSummaryData.csv"))



## Create a Plot From the Data ###

ggplot(ChemClean_Data, aes(x = Tide, y = Values, fill = Site)) + #Fills/groups the bars based on the site
       geom_col(position = "dodge") + #bars will stack unless you use position dodge
  facet_wrap(~Measured_Variable, scales = "free", #Facet wrapping based on the measured variables, each having an independent y scale
             labeller = as_labeller( 
                                   c("NN" = "Nitrate + Nitrite (umol/L)", 
                                     "percent_sgd" = "% Submarine Groundwater", 
                                     "pH" = "pH", 
                                     "Phosphate" = "Phosphate (umol/L)", 
                                     "Salinity" = "Salinity", 
                                     "Silicate" = "Silicate (umol/L)", 
                                     "TA" = "Total Alkalinity (umol/Kg)", 
                                     "Temp_in" = "Temperature (\u00B0C)"))) +
  scale_fill_manual(values = c("maroon4", "gold3")) +
  labs(y = "Mean Values") + #Change the y axis colors
  theme_bw() +
  theme(text = element_text(face = "bold"))

ggsave(here("Week_04", "Output", "Homework4b_Plot.png"), width = 10, height = 10)

