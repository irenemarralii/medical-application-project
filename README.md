![R](https://img.shields.io/badge/language-R-blue)
![Healthcare AI](https://img.shields.io/badge/domain-Healthcare%20AI-green)
![Statistics](https://img.shields.io/badge/method-Statistical%20Modeling-orange)
![University Project](https://img.shields.io/badge/type-Academic%20Project-lightgrey)
# Objective-Subjective Mismatch in Migraine Treatment
## BSc Artificial Intelligence - Medical Applications and Healthcare Project
Longitudinal statistical analysis of anti-CGRP migraine treatment outcomes, investigating the mismatch between biological improvement and patient-perceived benefit. 

## Project Overview
Anti-CGRP therapies are designed to reduce migraine frequency by targeting the Calcitonin Gene-Related Peptide (CGRP) pathway. Clinical efficacy is evaluated using Monthly Migraine Days (MMDs).

However, improvements in migraine frequency do not always correspond to a proportional improvement in patient-perceived disease burden.

This project investigates the potential objective-subjective mismatch in treatment response using a real-world longitudinal dataset of migraine patients.

The analysis explores two main questions:

**Objective vs Subjective Response**

Does a reduction in migraine frequency correspond to improvements in patient-reported outcomes such as HIT-6?

**Determinants of Discordance**

Which baseline characteristics may explain cases where clinical improvement does not translate into perceived benefit?

### Key Results

**Longitudinal Trend in Monthly Migraine Days**

Anti-CGRP therapy shows a clear reduction in migraine frequency over time across treatment cycles.

![MMD Trend](outputs/task1/figures/trend_mmds_main.png)

**Objective vs Subjective Treatment Response**
This scatter plot highlights the relationship between objective reduction in migraine days and change in patient-perceived disease buerden (HIT-6).

![Objective vs Subjective](outputs/task1/figures/scatter_mmds_pct_vs_hit6_delta_main.png)

## Dataset
The analysis uses a longitudinal dataset of migraine patients treated with anti-CGRP therapies.

The data contains two main components.

**Baseline dataset**

Clinical and demographic information collected before treatment:
- age and gender
- migraine history
- comorbidities
- baseline disability and pain measures

**Longitudinal dataset**

Repeated measurements collected during treatment:
- Monthly Migraine Days (MMDs)
- HIT-6 (Headache Impact Test)
- MIDAS disability score
- HADS anxiety and depression scores

Patients were followed across three treatment cycles, with visits at:
Month 1 - Month 3 - Month 6 - Month 9 - Month 12

## Methods
**Longitudinal Modeling**
Treatment trajectories were analyzed using linear mixed-effects models to account for repeated measurements within patients.

Model specification:

MMDs ~ CYCLE + MONTH + (1 | SUBJECT_ID)

HIT6 ~ CYCLE + MONTH + (1 | SUBJECT_ID)

These models estimate population-level treatment effects while capturing individual variability.

**Response Definitions**

Treatment response was evaluated at the end of Cycle 1.

Objective response
≥50 % reduction in Montlhy Migraine Days

Subjective response
≥5-point improvement in HIt-6 score

Patients were classified into response profile, with particular focus on the discordant subgroup showing biological improvement without perceived benefit.

## Analytical Workflow
1. **Data integration**  
   Merge baseline and longitudinal datasets.

2. **Missing data handling**  
   Multiple Imputation (MICE) for baseline variables and linear interpolation for longitudinal outcomes.

3. **Longitudinal modeling**  
   Linear mixed-effects models to evaluate treatment trajectories.

4. **Response classification**  
   Identification of objective and subjective responders.

5. **Exploratory regression analysis**  
   Logistic regression to explore baseline predictors of discordance.

6. **Clinical interpretation**  
   Evaluation of the mismatch between biological response and patient-perceived benefit.

## Results and Insights
The analysis reveals important patterns.

Anti-CGRP therapy shows consistent reductions in migraine frequency across treatment cycles.

Improvements in HIT-6 scores are more heterogeneous, indicating that subjective benefit does not always follow objective improvement.

A small subgroup of patients exhibits objective improvement without subjective benefit, highlighting a clinically relevant mismatch.

Exploratory regression analysis suggests that this discordance is not explained by baseline clinical variables alone, indicating that additional psychosocial or dynamic factors may influence perceived treatment-benefit.

## Clinical Implications
These findings suggest that treatment success in migraine prevention cannot be evaluated solely through biological markers such as migraine frequency.

Patient-reported outcomes provide complementary information about disease burden and perceived beneift, highlighting the importance of integrating subjective measures into treatment evaluation.



## Tech Stack
Language: R

Libraries
- tidyverse
- lme4
- mice
- ggplot2
- dplyr
- tidyr

Methods:
- longitudinal data analysis
- mixed-effects models
- multiple imputation (MICE)
- logistic regression

## Project Materials
Additional materials for this project are available below.

**Project report**
Full methodological details and results.
[Read the report](medical_report.pdf)

**Project Presentation**
Slides used to present the project and main findings.
[View the presentation](project_presentation.pdf)

# Authors
Gallo Sabina

Marrali Irene

BSc in Artificial Intelligence @ Università degli Studi di Milano, Università degli Studi di Pavia, Università degli Studi di Milano-Bicocca

