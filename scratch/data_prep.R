# Script written by:
# Alyson Singleton, asinglet@stanford.edu
#
# Script description: 
# Create clean, simple datasets for DiD tutorial and save spanish colnames.
#
# Date created: 8/24/2025

library(tidyverse)
library(readr)

# Load data
dengue_yearly <- readRDS("~/Desktop/doctorate/ch2 mdd highway/IOH_and_dengue_proj/data/clean/dengue_yearly_panels.rds")
leish_yearly <- readRDS("~/Desktop/doctorate/ch2 mdd highway/IOH_and_dengue_proj/data/clean/leish_yearly_panels.rds")

# Process dengue data english
dengue_tutorial_df_english <- dengue_yearly$connected_buffered %>%
  mutate(year = substr(as.character(year), 1, 4)) %>%
  select(year, key, incidence, fivekm, urban, ag, 
         mean_temp_centered, mean_temp_centered_sq, 
         sum_precip_centered)

# Process dengue data spanish
dengue_tutorial_df <- dengue_yearly$connected_buffered %>%
  mutate(year = substr(as.character(year), 1, 4)) %>%
  select(year, key, incidence, fivekm, urban, ag, 
         mean_temp_centered, mean_temp_centered_sq, 
         sum_precip_centered) %>%
  rename(
    año = year,
    e_salud = key,
    incidencia = incidence,
    dist_tx = fivekm,
    urbano = urban,
    agricola = ag,
    temp = mean_temp_centered,
    temp_cuad = mean_temp_centered_sq,
    precip = sum_precip_centered
  )

# Process leish data english
leish_tutorial_df_english <- leish_yearly$connected_buffered %>%
  mutate(year = substr(as.character(year), 1, 4)) %>%
  select(year, key, incidence, fivekm, urban, ag, 
         mean_temp_centered, mean_temp_centered_sq, 
         sum_precip_centered)

# Process leish data
leish_tutorial_df <- leish_yearly$connected_buffered %>%
  mutate(year = substr(as.character(year), 1, 4)) %>%
  select(year, key, incidence, fivekm, urban, ag, 
         mean_temp_centered, mean_temp_centered_sq, 
         sum_precip_centered) %>%
  rename(
    año = year,
    e_salud = key,
    incidencia = incidence,
    dist_tx = fivekm,
    urbano = urban,
    agricola = ag,
    temp = mean_temp_centered,
    temp_cuad = mean_temp_centered_sq,
    precip = sum_precip_centered
  )

# Save data
saveRDS(dengue_tutorial_df, file = "data/dengue_tutorial_df.rds")
saveRDS(dengue_tutorial_df_english, file = "scratch/dengue_tutorial_df_english.rds")
saveRDS(leish_tutorial_df, file = "data/leish_tutorial_df.rds")
saveRDS(leish_tutorial_df_english, file = "scratch/leish_tutorial_df_english.rds")
