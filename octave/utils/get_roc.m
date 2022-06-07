function [FPR TPR] = get_roc(X, y)

% Set number of steps
num_of_steps = 25;

% Get number of examples
m = size(y, 1);

% Initialize vectors
FPR = zeros(num_of_steps, 1);
TPR = zeros(num_of_steps, 1);

% Open model
nn_params = dlmread("model.csv", ",");

% Loop through every data in 'num_of_steps' steps
for i=1:num_of_steps

	% Get epsilon
	epsilon = (i-1)/(num_of_steps-1);

	% Predict
	pred = predict(nn_params, X, epsilon);

	% Get confusion matrix
	tp = sum((pred == 1) & (y == 1));
	fp = sum((pred == 1) & (y == 0));
	fn = sum((pred == 0) & (y == 1));
	tn = sum((pred == 0) & (y == 0));

	spec = tn/(tn+fp);
	rec = tp/(tp+fn);

	FPR(i) = 1-spec;
	TPR(i) = rec;
end

% Flip vectors so that they go from small to big
FPR = flipud(FPR);
TPR = flipud(TPR);
end
