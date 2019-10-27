# ABOUT
This program is an implementation and test of the decision tree learning algorithm (see Mitchell Chapter 3).   
  
This uses the following datasets to test the code:  
Dataset  1. It’s  divided  into  2  parts: training  (for  learning  the model),  test(for testing performance). 
Dataset  2. It’s  divided  into  2  parts: training  (for  learning the  model),   test(for testing performance). 

Program was written in R using R native functions

# COMPILING, INSTALLATION AND RUNNING  
Program files are decision_trees.R and decision_trees_wrapper.R 

## Compiling:  

No compiling of R … its an interpreted language. 

## How to run the code and a genric run command statement along with an example test cases below the general statement.  

Assumes RPart is installed. If not run:
> install.packages("rpart", dependencies=TRUE)

Run the code using the RScipt wrapper file: decision_trees_wrapper.R 

Generic run command: Rscript decision_trees_wrapper.R arg[1] arg[2] arg[3] arg[4]

Wrapper takes four arguments. 
First is the location of the training data file for test set 1
Second is the location of the test data file for test set 1
Third is the location of the training data file for test set2
Fourth is the location of the test data file for test set 2

Example using directory structure as unpacked:
$ Rscript decision_trees_wrapper.R data_sets1/training_set.csv data_sets1/test_set.csv data_sets2/training_set.csv data_sets2/test_set.csv

## RESULTS  

Results are shown in the RESULTS.pdf file 

Decision Tree prints are sent to the Console.

Decision Tree plots are printed to RGraphics and to file if plotflag<-TRUE is set in decision_trees.R.

Accuracies are printed to the Console. 

## LICENSE  
[MIT License](https://github.com/shoeloh/decision-trees-R/blob/master/LICENSE)  

