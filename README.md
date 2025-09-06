# Plant-Pathogen Field Trials and qPCR Analysis

This repository contains scripts for processing and analyzing agricultural field trial and qPCR data.

## Contents

- `R/01_dataprep_trial1.R` - Prepare raw data from Trial 1.
- `R/02_dataprep_trial2.R` - Prepare raw data from Trial 2.
- `R/03_dataprep_qpcr.R` - Prepare qPCR assay data.
- `R/04_analysis_trial1.R` - Analyze Trial 1 data: biomass, yield, disease, florets, and shelf life.
- `R/05_analysis_trial2.R` - Analyze Trial 2 data: biomass, yield, disease, florets, and shelf life.
- `R/06_analysis_qpcr.R` - Analyze qPCR data: pathogen presence and abundance.

## Main Points of Interest

- Effects of treatments on biomass, yield, and disease severity.
- Proportion of florets within target length and diameter ranges.
- Pathogen presence and abundance per treatment and trial.

## Usage

1. Place raw data files in the `rawdata/` directory.
2. Load each script in order to process and analyze data.
3. Scripts require `tidyverse`, `lme4`, `car`, `emmeans`, and `ggeffects` R packages.
4. Modify placeholder paths to match your local dataset structure.

