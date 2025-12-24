# =============================================================================
# Medical Application Project - Preprocessing and missing imputation
# 02_preprocessing_missing_imputation.R
# ==============================================================================

source("scripts/01_setup_load.R")

# =============================================================================
# Missingness audit
# ==============================================================================

# Missing rate per variable (baseline)
miss_base <- baseline %>%
  summarise(across(everything(), ~mean(is.na(.)))) %>%
  pivot_longer(everything(), 
               names_to = "variable", values_to = "missing_rate") %>%
  arrange(desc(missing_rate))

cat("\nTop 10 baseline missing rates:\n")
print(head(miss_base, 10))

# Missing rate per variable (long)
miss_long <- long %>%
  summarise(across(everything(), ~mean(is.na(.)))) %>%
  pivot_longer(everything(), names_to = "variable",
               values_to = "missing_rate") %>%
  arrange(desc(missing_rate))

cat("\nTop 10 longitudinal missing rates:\n")
print(head(miss_long, 10))

# Missingness by (CYCLE; MONTH) for key outcomes
key_vars <- c("MMDs", "HIT6", "HADSA", "HADSD", "INT", "MIDAS")
key_vars <- intersect(key_vars, names(long))

miss_by_time <- long %>%
  group_by(CYCLE, MONTH) %>%
  summarise(across(all_of(key_vars), ~mean(is.na(.)), .names = "miss_{.col}"),
            .groups = "drop")

cat("\nMissingness by cycle/month (first rows):\n")
print(head(miss_by_time, 10))

# Save missingness tables for reporting

dir.create("outputs", showWarnings = FALSE)

readr::write_csv(miss_base, "outputs/missing_baseline.csv")
readr::write_csv(miss_long, "outputs/missing_longitudinal.csv")
readr::write_csv(miss_by_time, "outputs/missing_by_cycle_month.csv")

# =============================================================================
# Baseline imputation (MICE)
# ==============================================================================

if (!requireNamespace("mice", quietly = TRUE)) install.packages("mice")
library(mice)

# Pick a small set of baseline vars (must exist) to inspect missingness
pattern_vars <- intersect(
  c("AGE_OF_ONSET", "BMI", "HEIGHT", "FAMILIARITY", "Aura", "Psycopathological"),
  names(baseline)
)

cat("\nVariables used for md.pattern:\n")
print(pattern_vars)

if (length(pattern_vars) >= 2) {
  md.pattern(baseline %>% select(all_of(pattern_vars)))
} else {
  cat("\nNot enough variables found for md.pattern. 
      Available baseline columns are:\n")
  print(names(baseline))
}

tmp <- baseline %>%
  select(all_of(pattern_vars)) %>%
  rename(
    onset = AGE_OF_ONSET,
    bmi = BMI,
    fam = FAMILIARITY,
    psycho = Psycopathological,
    aura = Aura
  )

md.pattern(tmp)

md_tab <- md.pattern(tmp, plot = FALSE)
write.csv(md_tab, "outputs/mdpattern_baseline_subset.csv")