% Add path
addpath('utils/');

% Get training and cross validation data
[X y] = get_XY("../data/training26Med.txt");
[X_cv y_cv] = get_XY("../data/crossVal26Med.txt");

% Get learning curve
% lambda = 0.0001;
lambda = 0;
[steps, error_train, error_cv] = learningCurve(X, y, X_cv, y_cv, lambda);

% Plot results
hf = figure();
plot(steps, error_train);
hold on;
plot(steps, error_cv);
xlabel("Number of examples trained on");
ylabel("Error");
title("Learning Curve");
legend('Training Error', 'Cross Validation Error')
print(hf, "learning_curve.png");
