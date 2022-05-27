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

% Get prediction
pred = predict(Theta1, Theta2, X);

% Get confusion matrix
tp = sum((pred == 1) & (y == 1));
fp = sum((pred == 1) & (y == 0));
fn = sum((pred == 0) & (y == 1));
tn = sum((pred == 0) & (y == 0));

% Get accuracy, precision, recall, and F1 score
accuracy = (tp+tn)/(tp+tn+fp+fn)
prec = tp/(tp+fp)
rec = tp/(tp+fn)
F1 = 2*prec*rec/(prec+rec)

% Save results
dlmwrite("result.csv", [X y pred], ",");
