### Week 4b Lecture ###
### Created by: Ashley Carreiro ###
### Updated on: 2025-09-22 ###
### Load Libraries ###
library(tidyverse)
library(here)

### Load Data ###
ChemData <- read_csv(here("Week_04", "Data", "chemicaldata_maunalua.csv"))
DataDictionary <- read_csv(here("Week_04", "Data", "chem_data_dictionary.csv"))

view(ChemData)


### Clean up Data ###

ChemData_Clean <- ChemData %>%
  filter(complete.cases(.)) %>% #Filters out everything that is not a complete row
  separate(col = Tide_time, #Choose the column that you want separated
           into = c("Tide", "Time"), # Separate it into two columns "tide" an "time"
           sep = "_", #What are the two separated by 
          remove = FALSE) %>% #Keeps the original tide_time column while making the other two 
  unite(col = "Site_Zone", #The names of the new column being created
        c(Site, Zone), #The columns that are being united
        sep = ".",  #What you want to add between the two data columns values
        remove = FALSE) #keeps the orginal site and zone columns while making the new one

view(ChemData_Clean)

ChemData_Long <- ChemData_Clean %>% #Making the wide chem dataset into a long version
  pivot_longer(cols = Temp_in:percent_sgd, #The columns you want to pivot, All from temp_in to percent_sgd
               names_to = "Variables", #the names of the new columns with all the column names
               values_to = "Values") #names of the new column with all the values
view(ChemData_Long) 

## Now we can group variables and summarise the data

ChemData_Long %>%
  group_by(Variables, Site) %>% #Group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), #Get the means 
            Param_vars = var(Values, na.rm = TRUE)) #Get teh variance
view(ChemData_Long)

ChemData_Long %>%
  group_by(Variables, Site, Zone, Tide) %>%
  summarise(Param_means = mean(Values, na.rm = TRUE), 
            Param_vars = var(Values, na.rm = TRUE), 
            Param_sd = sd(Values, na.rm = TRUE) )

### Long Data can be useful for facet_wrap ###
ChemData_Long %>%
  ggplot(aes(x = Site, y = Values)) +
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") #This facet wraps yoru variables with their own unique scales on both y and x axis
                                  #free_y only frees the y-axis
                                  # free_x only frees the x-axis
view(ChemData_Long)
### Now we want to change the data to wide format ###
ChemData_Wide <- ChemData_Long %>% #Converting it back to the original dataset
  pivot_wider(names_from =  Variables, #Column with the names for the new columns you are creating 
              values_from = Values) #Where getting values from
view(ChemData_Wide)


### Create a new dataframe and export it as a csv file ###

ChemData_Clean <- ChemData %>%
  drop_na() %>% #filters out everythign that is not a complete row 
  separate(col = Tide_time, #Choose the column that you want separated
         into = c("Tide", "Time"), # Separate it into two columns "tide" an "time"
         sep = "_", #What are the two separated by 
         remove = FALSE) %>% #Keeps the original tide_time column while making the other two 
  pivot_longer(cols = Temp_in:percent_sgd, #The columns you want to pivot, All from temp_in to percent_sgd
               names_to = "Variables", #the names of the new columns with all the column names
               values_to = "Values") %>% #names of the new column with all the values
  group_by(Variables, Site, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables, 
              values_from = mean_vals) %>% #Now taking it from mean_vals column
  write_csv(here("Week_04", "Output", "Summary.csv")) #Exporting ChemData_Clean data frame to a csv into the correct folder

#Have a clean dataset with the average of each of the parameters fro each site and time of day
view(ChemData_Clean)