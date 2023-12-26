function [alpha, beta] = linreg( x, y )
% Implement the body of this function to perform the calculation
% of simple linear regression coefficients alpha, beta (or a,b).
% as defined in eq. (4) and (5).
% Use the MATLAB built-in functions mean(), var(), cov() in your
% implementation. The use of polyfit() or \ operator or any other
% tooolbox function OR CYCLES is explicitly prohibited.

n = length(x); %#ok<NASGU>

beta = cov(x, y) / var(x);

alpha = mean(y) - beta * mean(x);
end

