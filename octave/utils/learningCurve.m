% GRADED FUNCTION: learningCurve
function [steps, error_train, error_val] = learningCurve(X, y, X_cv, y_cv, lambda)

% Set number of steps
num_of_steps = 20;

% Get size of model
_size = get_size();

% Get Number of training examples
m = size(X, 1);

% Initialize vectors
error_train = zeros(num_of_steps, 1);
error_cv = zeros(num_of_steps, 1);
steps = zeros(num_of_steps, 1);

% Randomly initialize parameters
init_nn_params = init_params(_size);

% Loop through every data in 'num_of_steps' steps
for i=1:num_of_steps

	% Get index of data
	j = int16(i*m/num_of_steps);

	% Train model
	options = optimset('MaxIter', 400);
	costFunction = @(p) nnCostFunction(p, _size, X(1:j,:), y(1:j), lambda);
	[nn_params, cost] = fmincg(costFunction, init_nn_params, options);

    	% Get J
	J_train = nnCostFunction(nn_params, _size, X(1:j,:), y(1:j), 0);
	J_cv = nnCostFunction(nn_params, _size, X_cv, y_cv, 0);

    	% Add values to matrices
    	error_train(i) = J_train;
    	error_val(i) = J_cv;
	steps(i) = j;
end
end
