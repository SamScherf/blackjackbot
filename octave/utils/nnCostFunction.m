function [J grad] = nnCostFunction(nn_params, _size, X, y, lambda)

% Get theta and number of examples
[Theta1 Theta2] = roll(nn_params, _size);
m = size(X, 1);

% PART 1: FEED FORWARD PROPAGATION

% Add column of ones
X = [ones(m,1) X];

% Get a2
z2 = X*Theta1';
a2 = [ones(m, 1) sigmoid(z2)];

% Get a3
z3 = a2*Theta2';
a3 = sigmoid(z3);

% Get J
J = sum(sum(-y.*log(a3)-(1-y).*log(1-a3)))/m;

% Get the regulairzed compent
Theta1(:, 1) = 0;
Theta2(:, 1) = 0;
R = lambda/(2*m)*(sum(sum(Theta1.^2)) + sum(sum(Theta2.^2)));

% Add regularized component to J
J = J + R;

% PART 2: BACK PROPAGATION

% Get difference
d3 = a3 - y;
d2 = (d3*Theta2(:,2:end)).*(sigmoidGradient(z2));

% Get deltas
Delta1 = d2'*X;
Delta2 = d3'*a2;

% Set theta gradients
Theta1_grad = Delta1/m;
Theta2_grad = Delta2/m;

% PART 3: WEIGHT REGULARIZATION
Theta1_grad = Theta1_grad + lambda/m*Theta1;
Theta2_grad = Theta2_grad + lambda/m*Theta2;

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)]; 

end
