function Rsq = r_squared( Y, Yf )
% Implement the body of this function to perform the calculation
% of the coefficient of determination R^2 as defined in eq. (6).
% Only use the MATLAB built-in functions in your implementation.
% The use of any tooolbox functions OR CYCLES is explicitly prohibited.

Y_mean = mean(Y);

SS_total = sum((Y - Y_mean).^2);

SS_residual = sum((Y - Yf).^2);

Rsq = 1 - (SS_residual / SS_total);
end
