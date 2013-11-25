function theta = trainLogRegr(X, y, initialTheta, lambda, alpha)
% Trains the parameters for logistic regression and
% returns the optimum value of theta for given X and y
% X => training data m * (n+1)
% y => m * 1


% we are doing mini-batch gradient descent
theta = initialTheta - (alpha / size(X, 1)) * X' * (sigmoid(X * initialTheta) - y);

end
