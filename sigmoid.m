function sig = sigmoid(z)
% Returns the sigmoid of z
% z may be scalar, vector or matrix
% sigmoid(z) = 1 / (1 + e^(-z))

sig = 1 ./ (1 + exp(-z));

end