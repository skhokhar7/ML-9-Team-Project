# Stroke Prediction Project

## Project Overview

This project aims to predict stroke risk using patient health and demographic data. The dataset includes features such as age, BMI, glucose level, smoking status, and work type. The goal is to build accurate and interpretable models that can assist in early stroke detection and risk stratification.

---

## Data Preprocessing

* **Cleaning** : Removed irrelevant columns like `id`, handled missing values, and encoded categorical variables.
* **Balancing** : Applied **SMOTE** to address class imbalance between stroke and non-stroke cases.
* **Feature Engineering** : One-hot encoded categorical features and scaled numerical ones for neural network compatibility.

---

## Modeling and Hyperparameter Tuning

Three models were trained and fine-tuned:

| Model               | Accuracy | ROC-AUC | F1-score | Class 1 Recall |
| ------------------- | -------- | ------- | -------- | -------------- |
| Logistic Regression | 0.86     | 0.94    | 0.86     | 0.86           |
| Random Forest       | 0.96     | 0.99    | 0.96     | 0.96           |
| FCNN (Neural Net)   | 0.88     | 0.96    | 0.88     | 0.94           |

* **Logistic Regression** : Tuned with `C=1`, `penalty='l2'`, `solver='liblinear'`. Balanced and interpretable.
* **Random Forest** : Tuned with `n_estimators=500`, `max_depth=30`, `min_samples_split=5`, `max_features='sqrt'`. Best overall performance.
* **FCNN** : Tuned using Keras Tuner. Achieved high recall and ROC-AUC with optimized layers, dropout, learning rate, and batch size.

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

* **Confusion Matrices** : Random Forest and FCNN showed strong recall for stroke cases.
* **ROC Curves** : All models outperform random guessing. Random Forest curve nearly touches the top-left corner.
* **Tuning Impact** : Hyperparameter optimization significantly improved recall and ROC-AUC across all models.

---

## Conclusion

* **Recommended Model** : Random Forest — best performance and interpretability.
* **Benchmark** : Logistic Regression — simple and transparent.
* **Research Extension** : FCNN — high recall, flexible architecture, ideal for ensemble strategies.

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
│   ├── BestFCNN-model.pkl
│   ├── BestLR-model.pkl
│   ├── BestRF-model.pkl
│   ├── FCNN-model.pkl
│   ├── LR-model.pkl
│   ├── RF-model.pkl
├── notebooks/
│   ├── HPT
|   │   ├── fccn_tunning\stroke_prediction
|   |   ├── README.md
|   │   ├── StrokeRiskPrediction-HPT.ipynb
│   ├── StrokeRiskPrediction.ipynb
├── README.md
```
