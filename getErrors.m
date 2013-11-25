function [err_t, err_val] = getErrors(Predict_train, Predict_val, y)
% returns the error
% Predict_train is predictions for training set, Predict_val for validation
% indices is the indices of images, as predicted
% yy => m * k
% k is the number of labels, 10

negs = sum(sum(Predict_train ~= y(1:size(Predict_train, 1))));
err_t = negs / 2 / size(Predict_train, 1);

negs = sum(sum(Predict_val ~= y(size(Predict_train, 1) + 1 : end)));
err_val = negs / 2 / size(Predict_val, 1);

end
