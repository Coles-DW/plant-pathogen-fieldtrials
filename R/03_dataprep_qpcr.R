# =============================================================================
# 03_dataprep_qpcr.R
# Purpose: Prepare qPCR assay data for pathogen abundance
# Input: rawdata/qpcr/*.xlsx
# Output: R object qpcr
# Dependencies: tidyverse, lme4, car, emmeans, ggeffects
# =============================================================================

library(tidyverse)
library(lme4)
library(car)
library(emmeans)
library(ggeffects)

qpcr <- readxl::read_xlsx('rawdata/qpcr/data.xlsx', sheet=1, na=c('', 'NA')) %>%
  filter(!is.na(trial)) %>%
  rename(copies_g = 'pathogen_copies_per_g') %>%
  mutate(log10_copies_g = log10(copies_g + 0.5),
         qpcr_detected = copies_g > 0,
         Treatment = factor(Treatment, levels=c('water', 'treatment1', 'treatment2')))
