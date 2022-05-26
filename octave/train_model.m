% Add path
addpath('utils/');

% Get the size of the model
_size = get_size();

% Initialize weight randomly
Theta1 = randInitializeWeights(_size('input'), _size('hidden'));
Theta2 = randInitializeWeights(_size('hidden'),_size('output'));

% Unroll parameters
nn_params = [Theta1(:) ; Theta2(:)];

% Get training data
% [X y] = get_XY("../data/training1.txt");
[X y] = get_XY("../data/trainingv2.txt");

% Set options and map cost function
lambda = 100;
options = optimset('MaxIter', 400);
costFunction = @(p) nnCostFunction(p, _size, X, y, lambda);

% Train and save model
[nn_params, cost] = fmincg(costFunction, nn_params, options);
dlmwrite("model.csv", nn_params, ",");
