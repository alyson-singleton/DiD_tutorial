# Script written by:
# Alyson Singleton, asinglet@stanford.edu
#
# Script description: 
# Create clean, simple datasets for DiD tutorial with spanish names.
#
# Date created: 8/24/2025

# Load data
dengue_yearly <- readRDS("data/clean/dengue_yearly_panels.rds")
leish_yearly <- readRDS("data/clean/leish_yearly_panels.rds")

# Process dengue data
dengue_yearly <- dengue_yearly$connected_buffered
dengue_yearly$year_chr <- substr(as.character(dengue_yearly$year),1,4)

# Process leish data
leish_yearly <- leish_yearly$connected_buffered
