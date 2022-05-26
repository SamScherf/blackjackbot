% Add path
addpath('utils/');

% Open model
nn_params = dlmread("model.csv", ",");

% Unroll nn_params into theta 1 and theta 2
_size = get_size();
[Theta1 Theta2] = roll(nn_params, _size);

% Get test data
[X y] = get_XY("../data/crossVal.txt");
% [X y] = get_XY("../data/test.txt");

% Check accuracy
pred = predict(Theta1, Theta2, X);
accuracy =  mean(double(pred == y))

% Save results
dlmwrite("result.csv", [X y pred], ",");
