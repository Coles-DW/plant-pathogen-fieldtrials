# =============================================================================
# 01_dataprep_trial1.R
# Purpose: Prepare raw field trial 1 data (shoots, florets, bunches, shelf life)
# Input: rawdata/trial1/*.xlsx
# Output: R objects for analysis (shoots, florets, bunches, shelf)
# Dependencies: tidyverse, lme4, car, emmeans, ggeffects
# =============================================================================

library(tidyverse)
library(lme4)
library(car)
library(emmeans)
library(ggeffects)

# Read and process shoots data
shoots <- readxl::read_xlsx('rawdata/trial1/shoots.xlsx', sheet=1, na=c('', 'NA')) %>%
  separate(sample, into=c('plot','plant')) %>%
  filter(!is.na(disease_score)) %>%
  mutate(scoring = case_when(as.numeric(plant) <=10 ~ 'early',
                             TRUE ~ 'late'))

# Read and process bunches/florets data
bunches <- readxl::read_xlsx('rawdata/trial1/bunches.xlsx', sheet=1, na=c('', 'NA'))
florets <- readxl::read_xlsx('rawdata/trial1/florets.xlsx', sheet=1, na=c('', 'NA'))

# Read and process shelf life data
shelf <- readxl::read_xlsx('rawdata/trial1/shelf.xlsx', sheet=1, na=c('', 'NA'))

# Transformations
bunches <- bunches %>% group_by(plot, plant) %>%
  arrange(harvest, .by_group=TRUE) %>%
  mutate(cumul_bunchweight = cumsum(replace_na(bunchweight, 0))) %>%
  ungroup()

florets <- florets %>% drop_na(length, diameter)
