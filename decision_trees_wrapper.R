# MIT License
# 
# Copyright (c) 2019 Shane Zabel 
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
###############################################################################

#Wrapper takes four arguments. 
#First is the location of the training data file for test set 1
#Second is the location of the test data file foor test set 1
#Third is the location of the training data file for test set2
#Fourth is the location of the test data file foor test set 2

#Example:
#$ Rscript decision_trees_wrapper.R data_sets1/training_set.csv data_sets1/test_set.csv data_sets2/training_set.csv data_sets2/test_set.csv

args <- commandArgs(TRUE)
trdata <- args[1]
tedata <- args[2]
trdata2 <- args[3]
tedata2 <- args[4]

#Run the R program with the file locations set

source("decision_trees.R")

