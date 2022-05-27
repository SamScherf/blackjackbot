function p = predict(nn_params, X)
% This function makes predictions based
% on the given parameters and provided data

% Unroll nn_params into theta 1 and theta 2
_size = get_size();
[Theta1 Theta2] = roll(nn_params, _size);

% Get number of training features and add bias to X
m = size(X, 1);
X = [ones(m,1) X];

% Get a2
z2 = X*Theta1';
a2 = sigmoid(z2);
a2 = [ones(m, 1) a2];  % Add bias unit

% Get a3 
z3 = a2*Theta2';
a3 = sigmoid(z3);  % final layer has no bias unit

% Get prediction
p = round(a3);

end
