% Add path
addpath('utils/');

% Get training and cross validation data
[X y] = get_XY("../data/training26Med.txt");
[X_cv y_cv] = get_XY("../data/crossVal26Med.txt");

% Try various lambdas error
[lambda_vec, error_train, error_cv] = validationCurve(X, y, X_cv, y_cv);

% Find best lambda
[val, idx] = min(error_cv);
best_lambda = lambda_vec(idx)

% Plot results
hf = figure();
plot(lambda_vec, error_train);
hold on;
plot(lambda_vec, error_cv);
xlabel("Lambda");
ylabel("Error");
title("Validation Curve");
legend('Training Error', 'Cross Validation Error')
print(hf, "validation_curve.png");
