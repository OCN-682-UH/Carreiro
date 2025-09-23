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
