function [lambda_vec, error_train, error_cv] = validationCurve(X, y, X_cv, y_cv)

% Values of lambda to try
lambda_vec = [0 0.0001 0.0003 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10 30]';

% Initialize error vectors
error_train = zeros(length(lambda_vec), 1);
error_cv = zeros(length(lambda_vec), 1);

% Get size of model
_size = get_size();

% Randomly initialize parameters
init_nn_params = init_params(_size);

% Loop through every lambda
for i=1:length(lambda_vec)

	% Train model with given lambda
	options = optimset('MaxIter', 400);
	costFunction = @(p) nnCostFunction(p, _size, X, y, lambda_vec(i));
	[nn_params, cost] = fmincg(costFunction, init_nn_params, options);

    	% Get predictions
	J_train = nnCostFunction(nn_params, _size, X, y, 0);
	J_cv = nnCostFunction(nn_params, _size, X_cv, y_cv, 0);

    	% Add values to matrices
    	error_train(i) = J_train;
    	error_cv(i) = J_cv;
end
end
