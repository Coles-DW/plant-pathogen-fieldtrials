Plant-Pathogen Field Trials and qPCR Analysis

This repository contains scripts for processing and analyzing agricultural field trial and qPCR data.

Repository Structure

data/: Contains raw and cleaned data files (generic placeholders, no sensitive information included).

R/: Contains R scripts for data preparation and analysis.

Scripts

R/01_dataprep_trial1.R: Prepare raw data from Trial 1.

R/02_dataprep_trial2.R: Prepare raw data from Trial 2.

R/03_dataprep_qpcr.R: Prepare qPCR assay data.

R/04_analysis.R: Analyze Trial data: biomass, yield, disease, florets, and shelf life.

Data Files

data/trial1_data.xlsx: Raw data for Trial 1.

data/trial2_data.xlsx: Raw data for Trial 2.

data/qpcr_data.xlsx: Raw qPCR assay data.

Note: All sensitive or identifiable information has been removed. Data files contain generic or anonymized sample IDs.

Requirements

R (version 4.0 or higher)

Required R packages:

tidyverse

readxl

lme4

emmeans

ggeffects

Installation of Required Packages
install.packages(c("tidyverse", "readxl", "lme4", "emmeans", "ggeffects"))

Usage

Clone the repository:

git clone https://github.com/Coles-DW/plant-pathogen-fieldtrials.git
cd plant-pathogen-fieldtrials


Run the data preparation scripts:

source("R/01_dataprep_trial1.R")
source("R/02_dataprep_trial2.R")
source("R/03_dataprep_qpcr.R")


Run the analysis script:

source("R/04_analysis.R")

License

This project is licensed under the MIT License.
