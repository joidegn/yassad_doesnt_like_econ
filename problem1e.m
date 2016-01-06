%# load data as in Problem 1a (done in problem1b.m)
%# and run OLS as in problem 1b
source problem1b.m;

gamma_hat = zeros(size(Z, 2), 1);

theta_hat = [beta_hat.' gamma_hat.'].';

%# make an anonymous function that can be used by fminunc
function_to_optimize = @(theta_hat)loglikelihood(theta_hat, Y, X, Z, true);

theta_hat = fminunc(function_to_optimize, theta_hat)


