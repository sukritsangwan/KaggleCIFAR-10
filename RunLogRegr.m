function [err_train, err_val] = RunLogRegr()
% trains the logistic regression model for images and
% returns the error calculated on training set as well as cross-validation set

clear;
load('trainLabels.mat');
number = 100;
trainNumber = 70;
testNumber = 30;
% random indices, first 35000 will be training set, rest for cross-validation
indices = randperm(number);

%printf('Diff sets splitted\n');

err_train = 1;
err_val = 1;
k = 10;		% 10 classes

% yy is logical matrix (m * k)
yy = zeros(size(y, 1), k);
for i = 1:k,
	yy(:, i) = (y == i);
end

Theta = zeros(1025, k);				% 32 * 32 = 1024
Predict_train = zeros(trainNumber, 1);
Predict_val = zeros(testNumber, 1);
lambda = 0;
alpha = 0.01;

%printf('starting\n');

batchSize = 10;
for batchNumber = 1:(trainNumber / batchSize),
	sampleNumbers = indices((batchNumber - 1) * batchSize + 1 : batchNumber * batchSize);
	X = pngBatchToMat(sampleNumbers);
	for classNumber = 1:k,
		Theta(:, classNumber) = trainLogRegr(X, yy(sampleNumbers, classNumber), Theta(:, classNumber), lambda, alpha);
	end
end

for batchNumber = 1:(trainNumber / batchSize),
	sampleNumbers = indices((batchNumber - 1) * batchSize + 1 : batchNumber * batchSize);
	X = pngBatchToMat(sampleNumbers);
	Predict_train((batchNumber - 1) * batchSize + 1 : batchNumber * batchSize) = predictLogRegr(X, Theta);
end

for batchNumber = 1:(testNumber / batchSize),
	sampleNumbers = indices((batchNumber - 1) * batchSize + 1 : batchNumber * batchSize);
	X = pngBatchToMat(sampleNumbers);
	Predict_val((batchNumber - 1) * batchSize + 1 : batchNumber * batchSize) = predictLogRegr(X, Theta);
end

[err_train, err_val] = getErrors(Predict_train, Predict_val, y(indices));

end
