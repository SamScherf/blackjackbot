% Add path
addpath('utils/');

% Get test data
[X y] = get_XY("../data/crossVal26Med.txt");

% Get FPR and TPR
[FPR TPR] = get_roc(X, y);

% Get AUC
AUC = trapz(FPR, TPR)

% Plot results
hf = figure();
plot(FPR, TPR);
xlabel("FPR (1 − precision)");
ylabel("TPR (recall)");
title("ROC Curve");
print(hf, "roc_curve.png");
