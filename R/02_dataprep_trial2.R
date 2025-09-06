# =============================================================================
# 02_dataprep_trial2.R
# Purpose: Prepare raw field trial 2 data (shoots, florets, bunches, shelf life)
# Input: rawdata/trial2/*.xlsx
# Output: R objects for analysis (shoots, florets, bunches, shelf)
# Dependencies: tidyverse, lme4, car, emmeans, ggeffects
# =============================================================================

library(tidyverse)
library(lme4)
library(car)
library(emmeans)
library(ggeffects)

# Read and process shoots data
shoots <- readxl::read_xlsx('rawdata/trial2/shoots.xlsx', sheet=1, na=c('', 'NA')) %>%
  separate(sample, into=c('plot','plant')) %>%
  filter(!is.na(disease_score)) %>%
  mutate(scoring = case_when(as.numeric(plant) <=10 ~ 'early',
                             TRUE ~ 'late'))

# Read and process bunches/florets data
dat <- lapply(1:6, function(i) readxl::read_xlsx('rawdata/trial2/data.xlsx', sheet=i, na=c('', 'NA')))
tmp <- lapply(dat, function(x){
  x %>%
    pivot_longer(cols=starts_with(c('length','diameter')), names_to='response', values_to='value') %>%
    separate(sample, into=c('plot','plant')) %>%
    pivot_wider(names_from=response, values_from=value)
})
tmp <- bind_rows(tmp)
bunches <- tmp %>% select(plot:bunchweight)
florets <- tmp %>% select(plot, plant, length, diameter) %>% drop_na()

# Read and process shelf life data
shelf <- readxl::read_xlsx('rawdata/trial2/shelf.xlsx', skip=2, col_names=FALSE, na=c('', 'NA'))
names(shelf) <- c("treatment","bunch","day1","day2","day3") # Placeholder names
