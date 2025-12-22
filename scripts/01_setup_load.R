# =========================================
# 01_setup_load.R
# Medical Application Project - Setup & Load
# =========================================

# 1) Clean environment
rm(list = ls())

# 2) Packages
library(tidyverse)

# 3) Load data (from /data folder)
baseline <- read.csv(
  "data/MigraineBaselineVars.csv",
  sep = ";",
  stringsAsFactors = FALSE
)

longitudinal <- read.csv(
  "data/MigraineLongitudianlVars.csv",
  sep = ";",
  stringsAsFactors = FALSE
)


# 4) Quick checks
cat("Baseline dim:", dim(baseline), "\n")
cat("Longitudinal dim:", dim(longitudinal), "\n\n")

cat("Baseline columns:\n")
print(names(baseline))

cat("\nLongitudinal columns:\n")
print(names(longitudinal))

cat("\nFirst rows (baseline):\n")
print(head(baseline, 3))

cat("\nFirst rows (longitudinal):\n")
print(head(longitudinal, 3))

# 5) Key ID sanity checks
cat("\nMissing SUBJECT_ID (baseline):", sum(is.na(baseline$SUBJECT_ID)), "\n")
cat("Missing SUBJECT_ID (longitudinal):", sum(is.na(longitudinal$SUBJECT_ID)), "\n")
cat("Unique patients (baseline):", n_distinct(baseline$SUBJECT_ID), "\n")
cat("Unique patients (longitudinal):", n_distinct(longitudinal$SUBJECT_ID), "\n")

