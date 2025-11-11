# ML-9 Team Project

Stroke prediction dataset is selected (https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset)

# Purpose & Overview

Stroke, a leading cause of death and disability worldwide, places a significant burden on healthcare systems. In fact, yearly stroke-related health care costs in Ontario, Canada were estimated to be up to $40,000 as of 2018 [1] which has likely only increased since then. Early prediction and intervention are therefore crucial to reducing mortality, improving patient outcome and reducing the costs on the health care system. Maching learning approaches offer promising tools for enhancing stroke prediction by analyzing vast datasets to identify patterns and risk factors that traditional methods may overlook.

This project aims to develop a predictive model for stroke risk using demographic, health, and lifestyle data. By analyzing patterns in patient profiles, we seek to identify key indicators that contribute to stroke incidence and build a tool that can assist healthcare providers in early intervention and resource prioritization.

## Business Motivation

Stroke is a leading cause of death and long-term disability worldwide. Early detection and prevention are critical to reducing healthcare costs and improving patient outcomes. However, many healthcare systems lack scalable tools to assess stroke risk across diverse populations.

This project addresses that gap by:

* Building a data-driven model to predict stroke risk
* Identifying high-impact features for targeted screening
* Supporting public health strategies with actionable insights
* Enabling hospitals and clinics to prioritize care for at-risk individuals

# Goals & Objectives

Machine learning models (ML) including Random Forests and Deep Learning (DL) models like Convolutional Neural Networks have been successfully used previously for stroke prevention [2,3]. The goals of the current project are to explore ML and DL models using a diverse and large-scale dataset to predict the occurrence of stroke while achieving high sensitivity and specificity.

<!-- The specific objectives of the project include:
1. 
2.
3. -->

# Techniques & Technologies

## Key Findings & Setup Instructions

After reviewing several datasets, we have decided to investigate the Stroke Prediction one. We are investigating whether a difference can be found by ML between male and female subjects.

https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset

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

---

## Possible Questions:

Are there different risk factors per age group, which would indicate different prevention strategies?

BMI, Age, Rural/Urban, see if there's different risk factors/prevention for different groups

_Research question: can deep learning be used with this dataset to identify which risk factors are most pertinent to predict a stroke depending on demographic?_

Do we need to subdivide the dataset along demographics (age, lifestyle, etc.)


## Approaches:
Regression to find composition and correlation of different variables

Based on significance of variables, create a model to predict stroke or not

_We have determined that we need to develop an experiment to determine the number of layers that will be optimal to get a result from our project._

Dask will be useful to run the experiments in parallel on multiple cores. We can use Google Colab to access GPUs for training our models.


Adding this comment from outside account
====
To try and find solution to a GitHub issue, we created a test account to make a remote branch and create a pull request. We also developed a step-by-step walkthrough of using GitHub in organizations.



## Possible Problem:
The occurance of false stroke overwhelms the stroke occurence in this dataset by an order of magnitude.

[1] Vyas, M., Fang, J., de Oliveria, C., et al. Attributable Costs of Stroke in Ontario, Canada and Their Variation by Stroke Type and Social Determinants of Health. Stroke 2023, 54, 2824.
[2] Vu, T., Kokubo, Y., Inoue, M., et al. Machine Learning Approaches for Stroke Risk Prediction: Findings from the Suita Study. J Cardiovasc Dev Dis 2024, 11, 207. https://doi.org/10.3390/jcdd11070207
[3] Moulaei, K., Afshari, L., Moulaei, R. et al. Explainable artificial intelligence for stroke prediction through comparison of deep learning and machine learning models. Sci Rep 2024, 14, 31392. https://doi.org/10.1038/s41598-024-82931-5
