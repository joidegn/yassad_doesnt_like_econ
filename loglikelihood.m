function loglik = loglikelihood(theta, Y, X, Z, return_sum)
    beta = theta(1:4)
    gamma = theta(5:end)
    beta_hat = inv(X.'*X)*X.'*Y;
    e_hat = Y - X*beta_hat;
    sigma = sqrt(exp(Z*gamma));
    if return_sum
        loglik = -rows(X)/2 * (log(2*pi) + 2*sum(log(sigma)))-sum(e_hat.^2./(2*sigma.^2));
    else
        %# not sure what he means with individual negative log likelihood values
        %# this returns log of density function evaluated at e_hat
        loglik = -1/2 * log(2*pi*sigma.^2) - e_hat.^2./(2*sigma.^2);
    end
end
