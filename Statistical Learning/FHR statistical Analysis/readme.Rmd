## Fetal Health Rate

The data might be found at [here!](https://archive.ics.uci.edu/ml/datasets/cardiotocography)



### Introduction


The data information were collected on cardiotocographies (CTG) by experts obstetricians used to
monitor fetal heartbeat (fetal heart rate - FHR) and uterine contractions during pregnancy and
labour. According to US National Library of Medicine National Institutes of Health up to 50% of the
CTG reports evidence not reliable pathological patterns which might be classiffied as false positives.
Additionally, there are some factors that would affect CTG such as:



| Maternal         | Fetoplacental    | Fetal    | Exogenous |
| ---------------- | -----------------| -------- | --------- |
|Physical activity | age of gestation | movement | noise     |
|Posture umbilical | cord compression | fetal behavioral | states medication|
|Uterine activity  |placental insufficiency | stimulation to wake the fetus | smoking |
|Body temperature (fever) | chorioamnionitis | hypoxemia  | drugs|
|Fluctuations in blood pressure|             |            |      |

Indeed, by hand I have been closely related to CTGs, and FHR analysis. Interviewing some doctors at 
the hospital taking advantage of my long stay, they mention that it is usual pregnant women assist 
there because of movement reduction which according to the following data is an explanatory variable 
in all the presented models in this report. 

According to the collected data, pregnant women usually do not know how to correctly check fetal 
movement, and that is one of the reasons they assist to the hospitals for a fetal medical review 
which usually starts with a FHR analysis.  CTGs are not 100% medical processes to check not only 
FHR but also fetal health in general, and that might be due to the fact the fetal growth is 
constantly changing, and for that reason when there is some issue regarding to the fetal health 
the prenatal OBGs ask for a constant follow up which consist in at least two to three checks per 
week. 


### Aims

In this report, I present a wide description about the data using statistical methods in two 
sections: regression and classification analysis. The regression analysis might shows us statistics 
about the data, and classification for characterizing the data using the explanatory variables using 
advance statistical leaning methods to analysis the dataset to make inferences.


## Methods 


In this section, all the methods for the multilinear regression analysis over the white wine are 
presented in order.  This dataset is available for anyone on-line. The data information were 
collected based on the red and white variants of the Portuguese "Vinho Verde" wine. The dataset 
contains objective tests data such as:

- Fixed Acidity, Volatile Acidity, Citric Acid, Residual Sugar, Chlorides, Free Sulfur Dioxide, 
Total Sulfur Dioxide, Density, pH, Sulphates, Alcohol.

and sensory data such as:

- Quality.


This DATASET is highly versatile. Indeed, not only the DATASET source recommend multilinear 
regression but also related papers introduce some other statistical methods to analyze, extract and 
present data from this DATASET such as classification. Nevertheless,
our aim will be to implement multilinear regression using the quality as the output variable.

 In each method, I decided to use it as numerical from 1 to 3, and as characters "normal", 
 "suspect", and "pathologic".  First, I take a quick look into the data:
 
 
 








