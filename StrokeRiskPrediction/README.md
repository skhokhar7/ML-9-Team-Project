# Stroke Prediction Project

## Project Overview

This project aims to predict stroke risk using patient health and demographic data. The dataset includes features such as age, BMI, glucose level, smoking status, and work type. The goal is to build accurate and interpretable models that can assist in early stroke detection and risk stratification.

---

## Data Preprocessing

* **Cleaning** : Removed irrelevant columns like `id`, handled missing values, and encoded categorical variables.
* **Balancing** : Applied **SMOTE** to address class imbalance between stroke and non-stroke cases.
* **Feature Engineering** : One-hot encoded categorical features and scaled numerical ones for neural network compatibility.

---

## Modeling

Three models were trained and evaluated:

| Model               | Accuracy | ROC-AUC | F1-score |
| ------------------- | -------- | ------- | -------- |
| Logistic Regression | 0.86     | 0.94    | 0.86     |
| Random Forest       | 0.96     | 0.99    | 0.96     |
| FCNN (Neural Net)   | 0.90     | 0.97    | 0.90     |

* **Logistic Regression** : Strong baseline with interpretable coefficients.
* **Random Forest** : Best overall performance, capturing nonlinear patterns and interactions.
* **FCNN** : Competitive results, especially in ROC-AUC, but with higher complexity and lower interpretability.

---

## Interpretability

### SHAP Analysis (Random Forest)

* **Top Features** : `age`, `avg_glucose_level`, and `bmi` were the most influential.
* **SHAP Summary Plot** : Visualized global feature importance.
* **SHAP Interaction Plot** : Revealed strong interaction between `age` and `hypertension`.

### Feature Importance (Gini)

* Confirmed SHAP findings, with `age` contributing ~33% of the model’s decision power.

---

## Evaluation

### Confusion Matrices

* FCNN: 101 false negatives, 90 false positives — balanced error profile.
* Random Forest: Minimal misclassifications, strong generalization.

### ROC Curves

* All models outperform random guessing.
* Random Forest curve nearly touches the top-left corner, indicating near-perfect discrimination.

---

## Conclusion

* **Recommended Model** : Random Forest — best performance and interpretable via SHAP.
* **Benchmark** : Logistic Regression — simple and transparent.
* **Research Extension** : FCNN — useful for experimentation and ensemble strategies.

---

## Repository Structure

```
├── data/
│   ├── healthcare-dataset-stroke-data.csv
├── images/
│   ├── ConfusionMatrix-FCNN.jpg
│   ├── CorrelationWithStroke.jpg
│   ├── FeatureImportance-RF.jpg
│   ├── ROC-Curve.jpg
│   ├── shap.jpg
│   ├── StrokeClassDistribution.jpg
├── models/
│   ├── FCNN-model.pkl
│   ├── LR-model.pkl
│   ├── RF-model.pkl
├── notebooks/
│   ├── StrokeRiskPrediction.ipynb
├── README.md
```

---
