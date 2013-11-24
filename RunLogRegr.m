function [err_train err_val] = RunLogRegr()
% trains the logistic regression model for images and
% returns the error calculated on training set as well as cross-validation set

clear;
load('y');

% random indices, first 35000 will be training set, rest for cross-validation
indices = randperm(50000);

%printf('Diff sets splitted\n');

err_train = 1;
err_val = 1;
k = 10;		% 10 classes

% yy is logical matrix (m * k)
% 10th column corresponds to '0'
yy = zeros(size(y, 1), k)
for i = 1:k,
	yy(:, i) = (y == i);
end

Theta = zeros(1024, k);
Predict_train = zeros(35000, k);
Predict_val = zeros(15000, k);

batchSize = 10;
for batchNumber = 1:(35000 / batchSize),
	sampleNumbers = indices(batchNumber * batchSize : (batchNumber + 1) * batchSize);
	X = pngBatchToMat(sampleNumbers);
	for classNumber = 1:k,
		Theta(:, i) = trainLogRegr(X, y(sampleNumbers), Theta, lambda);
	end
end

for batchNumber = 1:(35000 / batchSize),
	sampleNumbers = indices(batchNumber * batchSize : (batchNumber + 1) * batchSize);
	X = pngBatchToMat(sampleNumbers);
	for classNumber = 1:k,
		Predict_train(:, i) = predictLogRegr(X, Theta(:, i));
	end
end

for batchNumber = 1:(15000 / batchSize),
	sampleNumbers = indices(35000 + batchNumber * batchSize : (batchNumber + 1) * batchSize + 35000);
	X = pngBatchToMat(sampleNumbers);
	for classNumber = 1:k,
		Predict_val(:, i) = predictLogRegr(X, Theta(:, i));
	end
end

[err_train, err_val] = getErrors(Predict_train, Predict_val, indices, yy);

end
