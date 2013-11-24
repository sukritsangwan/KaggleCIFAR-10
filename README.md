KaggleCIFAR-10
==============

code of the kaggle competition, CIFAR-10, Object Recognition in Images

code is written in octave

training and test samples reside in 'train' and 'test' directories and images are named as '1.png'.....


Files
-----
labelsToMat.m => converts labels given in csv to '.mat' file with numbered labels
pngBatchToMat.m => converts multiple images to a matrix representation
RunLogRegr.m => run this file. classifies according to logistic regression
trainLogRegr.m => trains a logistic regression model
predictLogRegr.m => classifies the objects acc to trained model
getError.m => get error percentage on predicted values
sigmoid.m => calculates sigmoid of a matrix
