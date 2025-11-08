# ML-9 Team Project

Stroke prediction dataset is selected (https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset)

# Purpose & Overview

Stroke, a leading cause of death and disability worldwide, places a significant burden on healthcare systems. In fact, yearly stroke-realted health care costs in Ontario, Canada were estimated to be up to $40,000 as of 2018 [1] which has likely only increased since then. Early prediction and intervention are therefore crucial to reducing mortality, improving patient outcome and reducing the costs on the health care system. Maching learning approaches offer promising tools for enhancing stroke prediction by analyzing vast datasets to identify patterns and risk factors that traditional methods may overlook.

# Goals & Objectives

Machine learning models (ML) including Random Forests and Deep Learning (DL) models like Convolutional Neural Networks have been successfully used previously for stroke prevention [2,3]. The goals of the current project are to explore ML and DL models using a diverse and large-scale dataset to predict the occurrence of stroke while achieving high sensitivity and specificity.

The specific objectives of the project include:
1. 
2.
3.

# Techniques & Technologies

# Key Findings & Setup Instructions

After reviewing several datasets, we have decided to investigate the Stroke Prediction one. We are investigating whether a difference can be found by ML between male and female subjects.

https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset

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


## Possible Problem:
The occurance of stroke overwhelms the lack of stroke by an order of magnitude in this dataset.

## References:
[1] Vyas, M., Fang, J., de Oliveria, C., et al. Attributable Costs of Stroke in Ontario, Canada and Their Variation by Stroke Type and Social Determinants of Health. Stroke 2023, 54, 2824.

[2] Vu, T., Kokubo, Y., Inoue, M., et al. Machine Learning Approaches for Stroke Risk Prediction: Findings from the Suita Study. J Cardiovasc Dev Dis 2024, 11, 207. https://doi.org/10.3390/jcdd11070207

[3] Moulaei, K., Afshari, L., Moulaei, R. et al. Explainable artificial intelligence for stroke prediction through comparison of deep learning and machine learning models. Sci Rep 2024, 14, 31392. https://doi.org/10.1038/s41598-024-82931-5
