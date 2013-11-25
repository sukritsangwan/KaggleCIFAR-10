function predictions = predictLogRegr(X, theta)
% Based on X and theta predicts the answer (0 or 1)
% X => m * (n+1)
% theta => (n+1) * 1

predictions = zeros(size(X,1), 1);
h = sigmoid(X * theta);

[temp, preds] = max(h');
predictions = preds';

end
