%# load data as in Problem 1a
source problem1a.m;


%# run regression and get residuals
beta_hat = inv(X.'*X)*X.'*Y;
e_hat = Y - X*beta_hat;

%# calculate homoskedastic variance estimator
V_hat = e_hat.'*e_hat/(rows(X) - size(X, 2))*inv(X.'*X);

%# calculate White
V_w = inv((X.'*X))*X.'*diag(e_hat)*X*inv(X.'*X);

%# calculate scaled White
V_w_scaled = rows(X)/(rows(X)-size(X, 2)) * inv((X.'*X))*X.'*diag(e_hat)*X*inv(X.'*X);

%# Projection matrix and rescaled residuals
P = X*inv(X.'*X)*X.';
e_tilde = (1 - diag(P)).^-2.*e_hat;
e_bar = (1 - diag(P)).^-1.*e_hat;

%# calculate Andrews
V_a = rows(X)/(rows(X)-size(X, 2)) * inv((X.'*X))*X.'*diag(e_tilde)*X*inv(X.'*X);

%# calculate Horn-Horn-Duncan
V_hhd = rows(X)/(rows(X)-size(X, 2)) * inv((X.'*X))*X.'*diag(e_bar)*X*inv(X.'*X);

%# comparison of homoskedastic variance estimator and robust estimators show naive estimator estimates Variance to be too large
%# --> typically the opposite happens so this result could be wrong (although it is possible and can be interpreted)

%# rescaling residuals doesnt seem to make a big difference
