
library(tidyverse)
library(ggplot2)
library(tidytext)
library(dplyr)
library(plotly)
library(stringr)


# https://data.oregon.gov/Natural-Resources/Log-Prices/4v4m-wr5p/data
log_prices_raw <- read.csv("\\Users\\William Young Wu\\Desktop\\Log Prices 572 Data Science Project\\Log_Prices.csv", stringsAsFactors = FALSE)

nrow(log_prices_raw)
# 7884 rows 

# this will show us the number of rows per year
row_count_by_year <- log_prices_raw %>% group_by(Year) %>% count()
# The row count seems to stabilize after 2006. Why are they lower before that time? Was it because the data collection was still just getting started, so they didn't have all the proper contacts? 

# clean df 1, remove three N/A in prices
log_prices_clean_1 <- log_prices_raw[-c(6265, 5549, 7227),]

nrow(log_prices_clean_1)
# 7881. good. This is to remove three regions which appear only once and seem out of place. 

log_prices_clean_2 <- 
  log_prices_clean_1 %>% 
  filter(!Year == 2016)
# Removing year 2016 due to incomplete quarter assessment (only had quarter 1 out of 1,2,3,4)
nrow(log_prices_clean_2)
# 7623. good. 2016 rows are removed. 

# background basic info below

# number of times a species appears
species_count <- 
  log_prices_clean_2 %>% 
  group_by(Species) %>% 
  count(sort=TRUE)


# number of times a region appears 
region_count <- 
  log_prices_clean_2 %>% 
  group_by(Region) %>% 
  count(sort=TRUE)
# slice off bottom two, seems like wrong input
region_count <- region_count[-c(6,7),]

#_________________________________________________________________________________________
# Using a special color scheme
install.packages("viridis")
library("viridis")
#_________________________________________________________________________________________

# DATAFRAME 0 Region to Pond Value
region_pond_value <- 
  log_prices_clean_2 %>% 
  group_by(Region) %>% 
  summarize(Pond.Value = sum(Pond.Value))

# slice off bottom two, seems like wron input. 
region_pond_value <- region_pond_value[-c(6,7),]

# need to merge two rows, they are the same, but input differently. "2 & 3 - Coos, Douglas Counties & Roseburg" 
# create temprorary input dataframe
input_df_1 <- data.frame("2 & 3 - Coos, Douglas Counties & Roseburg", 937040)
# change names of this dataframe
names(input_df_1) <- c("Region", "Pond.Value")
# delete wrong rows
region_pond_value <- region_pond_value[-c(2,3),]
# merge temp input_df_1 with region_pond_value
region_pond_value <- rbind(region_pond_value, input_df_1)   #this works!!!!! nice

# need to change Pond Value scale from scientific notation to numbers
# load scales 
library(scales)

region_pond_value_plot <- 
  region_pond_value %>% 
  ggplot(aes(y=Pond.Value, x = Region)) + 
  geom_col(aes(y=Pond.Value, x=Region, fill = Region)) + 
  labs(x="Region", y="Pond Value", title="Pond Value by Region") + 
  scale_y_continuous(labels=comma) + 
  scale_fill_viridis_d(option="turbo") +
  theme(text = element_text(size = 24), axis.text.x=element_blank(), panel.grid.major.x = element_blank()) 

region_pond_value_plot


# __________________________________________________________________________________
# DATAFRAME 1 Year to Pond Value 
yearly_price_total <- 
  log_prices_clean_2 %>% 
  group_by(Year) %>% 
  summarize(sum(Pond.Value))

colnames(yearly_price_total)[2] <- "pond_value"

yearly_plot <- 
  yearly_price_total %>% 
  ggplot(aes(x=Year, y = pond_value)) + 
  geom_line(aes(x=Year, y=pond_value), size=1)

yearly_plot + 
  scale_x_continuous(breaks = seq(2000, 2016, by = 1)) + 
  labs(y = "Pond Value") +
  ggtitle("Total Pond Values: 2000-2015") + 
  scale_y_continuous(labels=comma) + 
  theme(text = element_text(size = 24)) 

# __________________________________________________________________________________

# DATAFRAME 2 Grade to Pond Value
# (We may or may not use this due to difficult in interpreting and organizing grades).
grade_to_pond <- 
  log_prices_clean_2 %>% 
  group_by(Grade, Pond.Value) %>% 
  count(sort = TRUE)

aggregate_grade_value <- 
  log_prices_clean_2 %>% 
  group_by(Grade) %>% 
  summarize(Pond.Value = sum(Pond.Value))
# need to clean this to simplify and unify same grades which are inputted differently

# step 1: remove leading and trailing white space
aggregate_grade_value_1 <- 
  aggregate_grade_value %>% 
  mutate(across(where(is.character), str_remove_all, pattern = fixed(" ")))
# step 2: clean up entries
aggregate_grade_value_2 <- 
  aggregate_grade_value_1 %>% 
  group_by(Grade) %>% 
  summarize(Pond.Value=sum(Pond.Value))

# aggregate_grade_value_2 has grouped by everything that is typed in correctly. Now we need to fix the type errors and group them
# aggregate_grade_value only shows which grade produces the most revenue, because we don't have weight by number sold. 

# _______________________________________________________________________________________________________
# DATAFRAME 3 Grade to Species 
# This shows what species take up what grades. 
# (We are proabably not going to use this).
grade_to_species <- 
  log_prices_clean_2 %>% 
  group_by(Grade, Species) %>% 
  count(sort = TRUE)

# _______________________________________________________________________________________________________
# DATAFRAME 4 Four Lines of Quarters to Pond Value
# This shows how much sales take place in each quarter over the 15 years. (This is a good one).
four_quarters <- 
  log_prices_clean_2 %>% 
  group_by(Quarter, Year) %>% 
  summarize(Pond.Value = sum(Pond.Value))

#install.packages("reshape")
library(reshape)

# transform integer into factor
four_quarters$Quarter <-
  factor(four_quarters$Quarter)

typeof(four_quarters$Quarter)  # checking
# confirmed, is integer

ggplot(four_quarters, aes(x = Year, y = Pond.Value, color = Quarter)) +
  geom_line(size=1) + 
  labs(x="Year", y="Pond Value", title="Pond Value by Quarter: 2000-2015") + 
  scale_y_continuous(labels=comma) +
  theme(text = element_text(size = 24)) +
  scale_x_continuous(breaks = seq(2000, 2016, by = 1))

#_________________________________________________________________________________________________________


# DATAFRAME 5 Species to Pond Value
# Aggregate sales of Species to Pond Value. (This is very good) 
species_pond_value <- 
  log_prices_clean_2 %>% 
  group_by(Species) %>% 
  summarize(Pond.Value = sum(Pond.Value))

ggplot(species_pond_value, aes(x=Species, y=Pond.Value)) + 
  geom_col(aes(fill = Species)) + 
  labs(y="Pond Value", title="Pond Value by Species") + 
  scale_y_continuous(labels=comma) +
  scale_fill_viridis_d() +
  theme(text = element_text(size = 24), axis.text.x=element_blank(), panel.grid.major.x = element_blank())

# doing calculations for blog
species_pond_value %>% summarize(sum(Pond.Value))
# 3579925 is total
















