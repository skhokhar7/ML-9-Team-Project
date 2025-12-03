# ML-9 Team Project

# Stroke Risk Prediction — Project Proposal

## Project Overview

This project aims to develop a predictive model for stroke risk using demographic, health, and lifestyle data. By analyzing patterns in patient profiles, we seek to identify key indicators that contribute to stroke incidence and build a tool that can assist healthcare providers in early intervention and resource prioritization.

## Business Motivation

Stroke is a leading cause of death and long-term disability worldwide. Early detection and prevention are critical to reducing healthcare costs and improving patient outcomes. However, many healthcare systems lack scalable tools to assess stroke risk across diverse populations.

This project addresses that gap by:

* Building a data-driven model to predict stroke risk
* Identifying high-impact features for targeted screening
* Supporting public health strategies with actionable insights
* Enabling hospitals and clinics to prioritize care for at-risk individuals

## Dataset Description

We are using the publicly available  **Stroke Prediction Dataset** , which includes 11 features and a binary target variable (`stroke`). The dataset contains 5110 records with the following attributes:

* **Demographics** : `gender`, `age`, `ever_married`, `Residence_type`
* **Health indicators** : `hypertension`, `heart_disease`, `avg_glucose_level`, `bmi`, `smoking_status`
* **Socioeconomic** : `work_type`
* **Target** : `stroke` (1 = stroke occurred, 0 = no stroke)

This dataset provides a rich foundation for exploratory analysis and predictive modeling.

## Modeling Plan

We will explore multiple modeling approaches to capture both linear and non-linear relationships:

### 1. Baseline Models

* Logistic Regression for interpretability
* Random Forest for feature importance and robustness
  * Ensemble of Decision Trees trained on random subsets of data and features
    * Each tree votes on the final prediction, improving stability and accuracy
    * Handles both numerical and categorical data without extensive preprocessing
  * Advantages
    * Captures complex, non-linear relationships
    * Resistant to overfitting through averaging
    * Provides interpretable feature importance for identifying key stroke predictors
  * Implementation
    * Use scikit-learn’s RandomForestClassifier
    * Tune parameters such as n_estimators, max_depth, and min_samples_split using grid search and cross-validation

### 2. Neural Networks

* **Fully Connected Neural Network (FCNN)** using Keras or PyTorch
  * Input: normalized tabular features
  * Architecture: 2–3 hidden layers with dropout and batch normalization
    * Start from 1 hidden layer and gradually add more hidden layers
  * Output: sigmoid activation for binary classification

### Evaluation Metrics

* ROC-AUC, precision-recall, F1-score
* Confusion matrix and calibration plots
* SHAP values for interpretability

## Risks and Unknowns

* **Class Imbalance** : Stroke negative cases are rare in this dataset, which may bias models toward the majority class. We plan to use techniques like SMOTE or class weighting to mitigate this.
* **Missing Data** : BMI values contain `N/A` entries. We will impute missing values using median or regression-based methods.
* **Data Quality** : Some entries have implausible values (e.g., age < 1). These will be filtered or corrected during preprocessing.
* **Generalizability** : The dataset may not represent all populations. External validation with broader datasets is recommended before deployment.
* **Model Complexity** : Neural networks may overfit due to limited data size. We will use regularization and cross-validation to monitor generalization.

## Next Steps

* Perform data cleaning and exploratory analysis
* Train baseline and neural models (FCNN)
* Evaluate performance using ROC-AUC and precision-recall metrics
* Visualize feature importance and risk factors
* Document findings and recommendations in a reproducible format
