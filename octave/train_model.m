% Add path
addpath('utils/');

% Get the size of the model
_size = get_size();

% Randomly initialize parameters
nn_params = init_params(_size);

% Get training data
% [X y] = get_XY("../data/training1.txt");
[X y] = get_XY("../data/trainingv2.txt");

% Set options and map cost function
lambda = 0;
options = optimset('MaxIter', 400);
costFunction = @(p) nnCostFunction(p, _size, X, y, lambda);

% Train and save model
[nn_params, cost] = fmincg(costFunction, nn_params, options);
dlmwrite("model.csv", nn_params, ",");
