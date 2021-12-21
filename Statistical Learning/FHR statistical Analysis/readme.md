## Fetal Health Rate Analysis on R : Report

The data might be found at [here!](https://archive.ics.uci.edu/ml/datasets/cardiotocography) In this folder, you might find the RData and Rhistory for replication and validation purposes. Additionally, it is the Markdown file (.Rmd), and the compiled pdf version. This research is the Statistical Learning final project, course leaded by phD. [Tamer Oraby](https://faculty.utrgv.edu/tamer.oraby/index.htm) at University of Texas Rio Grande Valley. The final purpose is the use of advance statistical learning methods for classification and regression analysis.



### Introduction.


The data information were collected on cardiotocographies (CTG) by experts obstetricians used to monitor fetal heartbeat (fetal heart rate - FHR) and uterine contractions during pregnancy and labour. According to US National Library of Medicine National Institutes of Health up to 50% of the CTG reports evidence not reliable pathological patterns which might be classiffied as false positives. Additionally, there are some factors that would affect CTG such as:



| Maternal         | Fetoplacental    | Fetal    | Exogenous |
| ---------------- | -----------------| -------- | --------- |
|Physical activity | age of gestation | movement | noise     |
|Posture umbilical | cord compression | fetal behavioral | states medication|
|Uterine activity  |placental insufficiency | stimulation to wake the fetus | smoking |
|Body temperature (fever) | chorioamnionitis | hypoxemia  | drugs|
|Fluctuations in blood pressure|             |            |      |

Indeed, by hand I have been closely related to CTGs, and FHR analysis. Interviewing some doctors at the hospital taking advantage of my long stay, they mention that it is usual pregnant women assist there because of movement reduction which according to the following data is an explanatory variable in all the presented models in this report. 

According to the collected data, pregnant women usually do not know how to correctly check fetal movement, and that is one of the reasons they assist to the hospitals for a fetal medical review which usually starts with a FHR analysis.  CTGs are not 100% medical processes to check not only FHR but also fetal health in general, and that might be due to the fact the fetal growth is constantly changing, and for that reason when there is some issue regarding to the fetal health the prenatal OBGs ask for a constant follow up which consist in at least two to three checks per week. 


### Aims

In this report, I present a wide description about the data using statistical methods in two sections: regression and classification analysis. The regression analysis might shows us statistics about the data, and classification for characterizing the data using the explanatory variables using advance statistical leaning methods to analysis the dataset to make inferences.



### Data Cleaning and Enhancement.

In this dataset all variables are abbreviated for better analysis process table 1, and
grouped in two sections to perform the statistical analysis: explanatory and response
variables. "CLASS" as the response variable, and the rest as explanatory variables. The
data might not be transformed into numbers or characters due to the fact each process
might be using the response variable differently.

#### Statistics. 
To start building any model, the variable analysis is crucial. First, taking a quick look into the data using "head" function we check some values about the dataset.  I remove non relevant variables such as:

- Width, Min, Max, Nmax, Nzeros, Mode, Mean, Median, Variance and Tendency.

Then,


![head1](https://user-images.githubusercontent.com/63264979/146865293-745ad917-45a4-464e-b695-758540ce81ca.png)


These variables are based on other variables from the original data which might interfere
with the analysis. Indeed, the "summary" or "stat.desc" function (pastecs library) present
compressed that data. Those are the functions that I load to analyze the data. The
analysis results are:

- There is no missing values in the data.
- In general there are 2126 observations.
- All the variables do not have minimum variables except from the tendency. Never-
theless, that variable is not a basis variable but one resulting from others.
- The minimum baby fetal heart beats base is 106 per minute, and the maximum 160
per minute. According to Johns Hopkins Medicine the fetal health rate average is
in between 110 and 160. So, the fetal health max beats base is 160, and matches
with the literature. On the other hand, the minimum dataset fetal heart beat
base min value is 106 which is not in the average range. This case is named fetal
bradyarrhythmia.
- All the explanatory variables are continuous.


Additionally, implementing basic grouping selection in the data shows that there is a
high (77.85%) of cases where the fetal state is normal, (13.88%) wealthy suspect fetal,
and unfortunately (8.28%) fetal in pathological state. This implies that the data is not
uniformly grouped which might not allow some statistical methods fit as we expect to.

Lastly, I performed duplication analysis which might guide to a biased analysis because
of data collection error. Nevertheless, the number of repetitions is not significant (14
out of 2126) which shows that there is not evidence to afirm that the data repetitions is
because of mismanagement of the cardiograms.


#### Correlation. 
The "GGally" package describes a widely complete correlation, density and frequency table all in one included in the same plot. For that reason, we select this rather than other packages. Correlation plot shows not only correlation in between the variables but correlation in each variable with the response variable and order by strong positive (top), not or medium (center), and negative (bottom) correlations. 


![ggpair-data](https://user-images.githubusercontent.com/63264979/146865523-284b97bf-d436-4713-8246-09065512bd44.png)



The results of the analysis are:

- In the data we found that there is not strong correlation in between the variables.
The variables analysis are classified as quantitative inputs. There are not transfor-
mation of quantitative inputs or basis expansions.
- There are negative and positive correlations. For instance, the Number of de-
celeration per second with the mean value of short term variability. Why? The
cardiogram shows results show that on average with a range of 3-5 BPM the fetal
heart rate speeds up slightly and the slows down slightly.
- There is an important number of outliers for each of the explanatory variables
presented in the data. So, performing linear regression might be not a good and
optimal idea. Nevertheless, the concentrated


#### Training and testing sets.
Before starting the entire process we select the eighty percent of the actual data as the training set to perform the analysis, and the testing set to test the model. This is usually done to enhance the time processing model, and set the algorithm not only for this dataset but for general related datasets. I do not include validation data because I could not find another dataset related to FHR from a reliable source.


### Multinomial Log-Linear Model
Regression models, as it is described in the introduction, are not "black boxes" that do not described the variable relations and do not show much more description about the process but the result. I decided to use one powerful regression model belonging to Generalized Additive Models as being an extension for the traditional logistic regression model. The model will run for 3 possible classifications 2 independent binary logistic regression model. To perform the model, I used "nnet" package and "multinom" function.
The output represents the relation in between the inputs and the log odds i.e. the log
of the ratio probabilities which might be interpret as the probability of selecting suspect
fetal rate health vs normal fetal health rate, and the probability of selecting pathologic
fetal health rate vs normal fetal health rate.


#### Output. 
This model-running output includes some iteration history and include the final negative log-likelihood 497.01. The double of this value is the model's residual deviance equal to 994.02.


#### P - Values. 
Here, I decided to perform manually the p-values to measure the significance level for all the variables in each of the models. The method is using the coeficients and standard errors from the multinomial regression, and we calculate one minus the "normalized" results. As it can be observed, the first log-linear equation (pathologic vs normal) has almost all variables significant respect to the log odds response variable but the FHR baseline and mean value of long term variability. On the other log-linear equation (suspect vs normal) has two not significant variables: mean value of short term variability and mean value of long term variability.


| |pathologic | suspect |
|-|-----------|---------|
|(Intercept) | 2.625e-06 | 2.220e-16 |
|LB | 7.922e-01 | 4.432e-13 |
|AC | 0.000e+00 | 0.000e+00 |
|FM | 7.442e-04 | 1.008e-05 |
|UC | 0.000e+00 | 0.000e+00 |
|DL | 0.000e+00 | 0.000e+00 |
|DS | 0.000e+00 | 0.000e+00 |
|DP | 0.000e+00 | 0.000e+00 |
|ASTV | 0.000e+00 | 2.581e-07 |
|MSTV | 2.612e-07 | 6.954e-01 |
|ALTV | 5.018e-14 | 1.523e-03 |
|MLTV | 9.395e-01 | 8.459e-01 |



#### Best Multinomial Log-Linear Model. 
After calculating the p-values that evidence the significance values, I decided to perform a better version of this model removing the non significant variables from the model. The non significant values might be removed by two options:

-Removing the non significant values manually. The result is:

<img src="https://latex.codecogs.com/svg.image?CLASS&space;\sim&space;LB&space;&plus;&space;AC&space;&plus;&space;FM&space;&plus;&space;UC&space;&plus;&space;DL&space;&plus;&space;DS&space;&plus;&space;DP&space;&plus;&space;ASTV&space;&plus;&space;MSTV&space;&plus;&space;ALTV&space;&plus;&space;MLTV" title="CLASS \sim LB + AC + FM + UC + DL + DS + DP + ASTV + MSTV + ALTV + MLTV" />

 
with an AIC and residual deviance of 1122.859 and 1082.85 respectively.

- The "step" method might be useful in this case. Reading the manual this specific
case belongs to the acceptable modeling regression that fit into the implementation
using the "backward" direction and k = log. So, the resultant model is:


<img src="https://latex.codecogs.com/svg.image?\begin{align*}\begin{split}\text{odds}(path.\&space;VS&space;\&space;nor.)&space;&\sim&space;\beta_{0}&space;&plus;&space;\beta_{1}LB&space;&plus;&space;\beta_{2}AC&space;&plus;&space;\beta_{3}FM&space;&plus;&space;\beta_{4}UC&space;&plus;&space;\beta_{5}DL&space;&plus;&space;\beta_{6}DP&space;\\&space;&&plus;&space;\beta_{7}ASTV&space;&plus;&space;\beta_{8}MSTV&space;&plus;&space;\beta_{9}ALTV&space;&plus;&space;\beta_{10}MLTV&space;\\\end{split}\end{align*}\newline\indent\begin{align*}\begin{split}\text{odds}(susp.\&space;VS&space;\&space;nor.)&space;&\sim&space;\beta_{0}&space;&plus;&space;\beta_{1}LB&space;&plus;&space;\beta_{2}AC&space;&plus;&space;\beta_{3}FM&space;&plus;&space;\beta_{4}UC&space;&plus;&space;\beta_{5}DL&space;&plus;&space;\beta_{6}DP&space;\\&space;&&plus;&space;\beta_{7}ASTV&space;&plus;&space;\beta_{8}MSTV&space;&plus;&space;\beta_{9}ALTV&space;&plus;&space;\beta_{10}MLTV&space;\\\end{split}\end{align*}" title="\begin{align*}\begin{split}\text{odds}(path.\ VS \ nor.) &\sim \beta_{0} + \beta_{1}LB + \beta_{2}AC + \beta_{3}FM + \beta_{4}UC + \beta_{5}DL + \beta_{6}DP \\ &+ \beta_{7}ASTV + \beta_{8}MSTV + \beta_{9}ALTV + \beta_{10}MLTV \\\end{split}\end{align*}\newline\indent\begin{align*}\begin{split}\text{odds}(susp.\ VS \ nor.) &\sim \beta_{0} + \beta_{1}LB + \beta_{2}AC + \beta_{3}FM + \beta_{4}UC + \beta_{5}DL + \beta_{6}DP \\ &+ \beta_{7}ASTV + \beta_{8}MSTV + \beta_{9}ALTV + \beta_{10}MLTV \\\end{split}\end{align*}" />



with an AIC and residual deviance of 1024.175 and 980.1753 respectively.


#### Final Multinomial Log-Linear Model. 
After the best multinomial logistic model setting, I decided that the "step" model is the best choice. This model-running output includes some iteration history and include the final negative log-likelihood 490.087. The double of this value is the model's residual deviance equal to 980.1753.



![eq1](https://user-images.githubusercontent.com/63264979/146871717-c08ada4d-05e0-40ef-a648-93ffd6242415.PNG)


#### Estimates interpretation.

- For one-unit increase in the variable fetal movement is associated with the increase
in the log odds of being in suspect fetal rate health vs normal fetal health rate in
the amount of 1.9904.
- For one-unit increase in the variable accelerations per second is associated with the
decrease in the log odds of being in pathologic fetal rate health vs normal fetal
health rate in the amount of 0.01113.
- For one-unit increase in the variable mean value of short term variability is associated with the increase in the log odds of being in suspect fetal rate health vs normal fetal health rate in the amount of 0.1954.
- For one-unit increase in the variable uterine contractions per second is associated
with the increment in the log odds of being in pathologic fetal rate health vs normal
fetal health rate in the amount of 0.0417.


#### Performance. 
The model performance has an acceptable precision due to the confusion matrix results and the specificity, sensitivity, and accuracy values for training and testing data. Nevertheless, there is an important miss-classification that might be avoid in each of the classes.



 <table>
  <tr>
    <td align="center", colspan="4">Training</td>
  </tr>
  <tr>
    <td align="center", colspan="4">Acurracy = 87.65%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>95.41%</td>
    <td>58.0%</td>
    <td>62.68%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>70.54%</td>
    <td>94.74%</td>
    <td>98.46%</td>
  </tr>    
</table>
  

 <table>
  <tr>
    <td align="center", colspan="4">Testing</td>
  </tr>
  <tr>
    <td align="center", colspan="4">Acurracy = 86.85%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>95.69%</td>
    <td>55.93%</td>
    <td>61.90%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>67.33%</td>
    <td>95.09%</td>
    <td>98.69%</td>
  </tr>    
</table>
  
  
  
This above table evidence that each of those training and testing present an important
percentage of miss-classification in each of the classes.
  
  
  
### KNN
I decided to start the classification analysis using one of the most used and accurate
classification methods: KNN. This supervised machine learning algorithm usually is used
not only for classification problems but for regression analysis. Additionally, there is no
need to build a model because it uses the input data calculating neighbors and classifying
the data.

To perform this model, I used "purrr" and "class" libraries using the created function
in Statitical Learning class at UTRGV 1 to obtain the best K for the classification. My
decision was based on validating similar models to the one created in class selecting that
one as the most accurate 2.

After applying the best K (best possible K for this dataset is 3) function the model was
ready to be initialized. 


![KNN-plot](https://user-images.githubusercontent.com/63264979/146873238-1d6b0a5b-8214-424f-b394-112d8501cff8.png)


This model will use the inputs attributes to classify the training
data. As I mention before, this model is simple and accurate when the best K is selected.
Then, I applied that into the training and testing data.


#### Performance.
The KNN performance is measured not by the estimates interpretation but the confusion matrix and the MSE in both: training and testing data.




 <table>
  <tr>
    <td align="center", colspan="4">Training</td>
  </tr>
  <tr>
    <td align="center", colspan="4">MSE= 0.058</td>
  </tr>  
  <tr>
    <td align="center", colspan="4">Acurracy = 94.18%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>97.52%</td>
    <td>79.24%</td>
    <td>87.31%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>84.32%</td>
    <td>97.95%</td>
    <td>99.29%</td>
  </tr>    
</table>
  

 <table>
  <tr>
    <td align="center", colspan="4">Testing</td>
  </tr>
  <tr>
    <td align="center", colspan="4">MSE= 0.072</td>
  </tr>   
  <tr>
    <td align="center", colspan="4">Acurracy = 92.72%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>96.62%</td>
    <td>79.66%</td>
    <td>79.66%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>82.18%</td>
    <td>97.55%</td>
    <td>98.95%</td>
  </tr>    
</table>


#### Confusion matrix interpretation. 
To check the KNN performance classifying the data we use the confusion matrix. The confusion matrix shows that based on the training data (testing data) the KNN classify the entire data with an accuracy of 94.35% (92.7%). The model predicted 1298 (314) to be classified as normal FHR out of 1700 training data (426 testing data), with a misclassification of 32 (101). The model predicted 118 (34) to be classified as suspect FHR out of 1700 training data (426 testing data), with a misclassification of 118 (35). Lastly, the model predicted 188 (47) to be classified as pathologic FHR out of 1700 training data (426 testing data), with a misclassification of 16 (5).



Regarding to the specificity and sensitivity we might notice that:

1. Normal FHR.
- This model has a precision of 84.3% when it makes the classification predictions, and it is correct 84.3% of the time. Additionally, it predict successfully 97.6% of the classifications.
2. Suspect FHR.
- This model has a precision of 97.9% when it makes the classification predictions, and it is correct 97.9% of the time. Additionally, it predict successfully 79.24% of the classifications.
3. Pathologic FHR.
- This model has a precision of 99.2% when it makes the classification predictions, and it is correct 99.2% of the time. Additionally, it predict successfully 87.3% of the classifications.

_Remark_. The caret package using the "confusionMatrix" library has an interesting feature
called: Cohen's Kappa Statistic which is commonly used to provide measure of how good
two evaluators can classify data. Here the Kappa value is 0.83 which according to the
strength table is a good classification.



### Tree Classification
The tree statistical methods used for studying data are set to perform classification and
regression. Classification trees perform a structural 1 and 0 (yes and no) decisions that guide the method to classify the data based on that decisions with two important parts:
branches representing attributes in the data, and leaves representing decisions.

To perform this analysis I used "rpart" library (function at the same time) setting the
R routine to treat our DATABASE as a categorical classification setting the method by
"class".

The summary expose each step showing the number of nodes, complexity parameter, class
counts with their classification probabilities, and present the splits counts. For instance, analyzing the second node for 1397 observations the class count was: (class=Normal) 1244, (class=Suspect) 80, (class=Pathological) 73. Each of those with probabilities: 0.89, 0.057, and 0.052 respectively.


#### Performance. 
This method split the original root node dropping a relative error from 1.0 to 0.33784 where the root node is 0.33784. Next, analyzing the complexity parameter we might find the best complexity parameter value (CP) for this tree analysis. To select the optimal CP, I used "printcp" and "plotcp" function to check and visualize the CP with its relative error per node. Additionally, I check the RSQ loading "rsq.rpart" function.


![plotcp-tree](https://user-images.githubusercontent.com/63264979/146874386-49f7a327-2406-44d1-84a7-49fd2ac478c3.png)


The CP plot evidence that the optimal number of nodes is 8 with an optimal CP equals to 0.01.

Additionally, I present a tree development plot representing all branches and leaves at-
tributes by plotting not only linear classication process but also three dimensional plot
(each node step as the third dimension). This type of plot allow the reader to check the
convergence in each node, and some important relations about the classied variables.
Lastly, the confusion matrix:



 <table>
  <tr>
    <td align="center", colspan="4">Training</td>
  </tr>
  <tr>
    <td align="center", colspan="4">MSE= 0.924</td>
  </tr>  
  <tr>
    <td align="center", colspan="4">Acurracy = 94.18%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>97.89%</td>
    <td>66.52%</td>
    <td>83.58%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>75.68%</td>
    <td>98.83%</td>
    <td>98.59%</td>
  </tr>    
</table>
  

 <table>
  <tr>
    <td align="center", colspan="4">Testing</td>
  </tr>
  <tr>
    <td align="center", colspan="4">MSE=0.899</td>
  </tr>   
  <tr>
    <td align="center", colspan="4">Acurracy = 89.91%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>96.62%</td>
    <td>62.71%</td>
    <td>76.19%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>70.30%</td>
    <td>99.18%</td>
    <td>97.39%</td>
  </tr>    
</table>


#### Variable Importance and implementation plot. 
Classification trees perform the analysis using the data variables on at a time, decide and split the data. Then, the variable importance refers about the model variable use and accuracy over that variable. Usually, tree classification methods presents gini or information gain plots visualizing all the process locating the most important variable in the top.


![VA-tree](https://user-images.githubusercontent.com/63264979/146874802-79d98f76-218d-4bdb-8982-069d3e4714eb.png)


The decision plot shows that the variable importance in classifying the data plotting the
mean value of short term variability in rst place. So, basically the tree classification
method used this variable as the principal variable to grouped the data.


![tree-plot](https://user-images.githubusercontent.com/63264979/146874814-42401418-8bc3-465f-ba87-b331f029fbac.png)


The implementation plot using the "plotmo" library is a nice tool that represents the
linear relations in between the involved variables in the classification together with the
tree dimensional plot that might be used to analyze the speed classification analysis or
the number of nodes in the group selection.

#### Recommendations.
After reading the documentation about rpart plots, and related packages I could not find a nice rpart plot when the data have many inputs. So, I could find two solutions: quick solution and developing solution. The quick solution is gathering all the data on R, and using "graphviz" package on python which has more visual dependencies, and features. The developing option is creating better dependencies and libraries in R to visualize tree plots.


### Supported Vector Machine.
Here, I tried to use supported vector machine because of one important feature: overlapping data. The SVM method is optimal for generalizing the hyperplanes separation. How do we check for overlapping data? Well, the really descriptive data analysis plot allow us to check this type of overlapping behavior for two variable, and there would be importantly more overlapping characteristics for more than two variables.

To perform SVM analysis, I load the "e1071" R package with the "svm" function training
a support vector machine and making the classication analysis. Before starting the
process, as the classification variable was not numerical I made the conversion and used
the \tune" implementation over a sequence of size 10, and cost exponentially big.

#### Performance.
The resulting colorful analysis plot describes the best model using color coding where darker regions imply better performance (accuracy) in the implementation. This is a visual way to explore the tuning implementation for SVM. So, we can observe that the best epsilon runs from 0 to 1, while the optimal cost is in between 110 and 40.


![perf-svm](https://user-images.githubusercontent.com/63264979/146875056-00f35257-a537-4c31-a2ea-51dbfe7d61d2.png)


According to the tune method, the best model is:


| SVM-Type: C-classification |
| SVM-Kernel: radial |
| Cost: 64 |


#### Confusion matrix interpretation.
To check the SVM performance classifying the data we use the confusion matrix. The confusion matrix shows that based on the training data (testing data) the SVM classify the entire data with an accuracy of 96.47% (91.08%). The model predicted 1317 (311) to be classified as normal FHR out of 1700 training data (426 testing data), with a misclassification of 13 (14). The model predicted 128 (38) to be classified as suspect FHR out of 1700 training data (426 testing data), with a misclassification of 108 (21). Lastly, the model predicted 195 (39) to be classified as pathologic FHR out of 1700 training data (426 testing data), with a misclassification of 61 (3).



 <table>
  <tr>
    <td align="center", colspan="4">Training</td>
  </tr>
  <tr>
    <td align="center", colspan="4">MSE= 0.035</td>
  </tr>  
  <tr>
    <td align="center", colspan="4">Acurracy = 96.47%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>99.02%</td>
    <td>82.63%</td>
    <td>95.52%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>89.19%</td>
    <td>98.7%</td>
    <td>99.93%</td>
  </tr>    
</table>
  

 <table>
  <tr>
    <td align="center", colspan="4">Testing</td>
  </tr>
  <tr>
    <td align="center", colspan="4">MSE=0.089</td>
  </tr>   
  <tr>
    <td align="center", colspan="4">Acurracy = 91.08%</td>
  </tr>
  <tr>
    <td></td>
    <td>normal</td>
    <td>suspect</td>
    <td>pathologic</td>
  </tr> 
  <tr>
    <td>Sensitivity</td>
    <td>95.69%</td>
    <td>66.10%</td>
    <td>90.47%</td>
  </tr> 
  <tr>
    <td>Specificity</td>
    <td>78.22%</td>
    <td>96.45%</td>
    <td>99.21%</td>
  </tr>    
</table>


## Results and conclusions.
I decided to stop the analysis, due to the fact the other implementations were not optimal.
I tried the neural network, LDA, and k-means method for classification ant the MSE results were significantly high. I stop the classification analysis, and atfer implement the methods we find the following results:



| Method | MSE Training | MSE Testing |
| Multinomial Log-Linear | 0.1235 | 0.1314 |
| KNN | 0.058 | 0.0727 |
| Tree Classification | 0.924 | 0.899 |
| SVM | 0.0352 | 0.0892 |


Finally, I select two models: multinomial logistic regression and SVM. The SVM method
above all the other methods choice was because of the distribution of the data. This type
of analysis has a better performance for overlapping datasets.

Additionally, I present this project as part of my code repository at GitHub due to the
fact one of the aims this project was set is to be a cover letter to posterior studies.



## References

<a id="1">[1]</a> 
An Introduction to Statistical Learning with Applications in R, 
G. James, D. Witten, T. Hastie, R. Tibshirani, 
Springer Text in Statistics.

<a id="1">[2]</a> 
A Program for Automated Analysis of Cardiotocograms,
Ayres de Campos, 
SisPorto 2.0, 
Matern Fetal Med 5:311-318, 
2000.

<a id="1">[3]</a> 
Ggplot images,
[R repository - ggplot2 package.](https://cran.r-project.org/web/packages/ggplot2/index.html)

<a id="1">[4]</a>
Introduction to regression modeling, 
B. Abraham, J. Ledolter, 
Springer Series in Statistics.

<a id="1">[5]</a> 
Knn implementation,
[R repository - Class package.](https://www.rdocumentation.org/packages/class/versions/7.3-19)






