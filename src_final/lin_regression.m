%% play with random signals
clear ;
clc ;
format compact ;

%% Exercise 2: See file lin_interpolation.m

%% Exercise 3:
% Generate a matrix Ru of pseudo random values from a uniform distribution
% and a matrix Ri of pseudo random integer values from a uniform distribution
% and a matrix Rn of random values from a normal distribution.
% Let the size of all matrices be MxN.
% Let the mean value of Rn be m = 8 and variance v = 3.
% Let the values of Ru an Ri be from the interval <a,b> = <4,9>
% Run this section several times to observe that each time
% different matrices will be generated. 

M = 5 ;
N = 10 ;

m = 8 ;
v = 3 ;

a = 4 ;
b = 9 ;

Rn = m + sqrt(v) * randn(M, N); 
Ru = a + (b - a) * rand(M, N); 
Ri = randi([a, b], M, N); 

% Calculate the sample mean and variance of all pseudo random matrices:

%   a) for each column 
%   b) for the whole matrix
Mna = mean(Rn); 
Mnb = mean(Rn, 'all');

Vna = var(Rn);
Vnb = var(Rn, 0, 'all');

Mua = mean(Ru); 
Mub = mean(Ru, 'all');

Vua = var(Ru); 
Vub = var(Ru, 0, 'all'); 

Mia = mean(Ri); 
Mib = mean(Ri, 'all');

Via = var(Ri); 
Vib = var(Ri, 0, 'all'); 

%% Exercise 4:
% Generate a pseudo random column vector V of varying length N
% and constant mean and variance m = 10, v = 3.
% For each vector length N calculate sample mean ms and variance vs
% and for each calculated ms and vs calculate thei relative errors in
% per cent.
% Run this section several times to observe slightly different results each
% time.

m = 10;
v = 3;

for N = [1 2 5 10.^(1:5)]
    V = m + sqrt(v) * randn(N, 1);
    
    ms = mean(V);
    vs = var(V);
    
    mean_error = abs(ms - m) / m * 100;
    var_error = abs(vs - v) / v * 100;
    
    fprintf("Vector length N: %6d, mean: %10.6f, variance: %10.6f, mean error: %10.6f%%, variance error: %10.6f%%\n", N, ms, vs, mean_error, var_error);
end

%% Exercise 5:
% Generate values of a linear function f(x) = beta*x + alpha for the x variable 
% taking on values from the interval <-4,10> with step 0.5.
% Create two noisy copies: Y1, and Y2 by adding pseudo-random noise from normal
% distribution: one with a variance v1 = 0.1, the other with v2 = 1
% Use the plot(), subplot() and scatter() function to plot three plots
% side-by-side: first the noiseless linear function f(x), second the
% scattered noisy observations Y1, and finally scattered observations
% of the more noise degraded signal Y2.

alpha	= 2;
beta	= 0.5;

s		= 0.5;

x = -4:s:10; 
FX = beta * x + alpha;

v1 = 0.1;
v2 = 1;

N1 = sqrt(v1) * randn(size(x));
N2 = sqrt(v2) * randn(size(x));

N1 = N1 - mean(N1);
N2 = N2 - mean(N2);

Y1 = FX + N1; 
Y2 = FX + N2; 

subplot(1, 3, 1);
plot(x, FX);
title('Noiseless Linear Function');
xlabel('X');
ylabel('f(X)');

subplot(1, 3, 2);
scatter(x, Y1);
title('Noise Y1');
xlabel('X');
ylabel('Y1');

subplot(1, 3, 3);
scatter(x, Y2);
title('Noise Y2');
xlabel('X');
ylabel('Y2');

%% Exercise 6: implement the linreg() function in a separate linreg.m file.

% %% Exercise 7:
% % For the X coordinates and both noisy datasets Y1, Y2 from EX.4 find the
% % coeficients alpha, beta of the simple linear regression:
% %  a) using your function linreg
% %  b) using the MATLAB function polyfit
% %  c) using the \ operator.
% 
% % Insert code below: calling the linreg() function 
% [ alpha1, beta1 ] = linreg( X, Y1 )
% linreg( X, Y2 )
[alpha1, beta1] = linreg(x, Y1);
[alpha2, beta2] = linreg(x, Y2);

% % Insert code below: using a toolbox function
p1 = polyfit(x, Y1, 1);
p2 = polyfit(x, Y2, 1);

% % Insert code below: using the \ operator
coef1 = x \ Y1;
coef2 = x \ Y2;

%% Exercise 8:
% Use the polyval() function to find the data yf1 and yf2 for both noisy
% datasets y1 and y2 using the previously found linear regression 
% coefficients alpha, beta for the x vector defined in E4. 
% Use the plot(), subplot() and scatter() functions to plot
% three plots side by side:
%   1. The noisy data y1 along with the fitted linear function values yf1.
%   2. The noisy data y2 along with the fittel linear function values yf2.
%   3. The linear fitted values yf1 and yf2.

yf1 = polyval(p1, x);
yf2 = polyval(p2, x);

figure;
subplot(1, 3, 1);
scatter(x, Y1, 'r.');
hold on;
plot(x, yf1, 'b-', 'LineWidth', 2); 
hold off;
title('Y1 , yf1');

subplot(1, 3, 2);
scatter(x, Y2, 'g.');
hold on;
plot(x, yf2, 'y-', 'LineWidth', 2); 
hold off;
title('Y2 , yf2');

subplot(1, 3, 3);
plot(x, yf1, 'b-', 'LineWidth', 2); 
hold on;
plot(x, yf2, 'y-', 'LineWidth', 2); 
hold off;
title('yf1, yf2');


%% Exercise 9:
% Implement the body of the function r_squared() in file r_squared.m 
Rsq11 = r_squared(Y1, yf1);
Rsq12 = r_squared(Y1, yf2);

if Rsq11 > Rsq12
    disp('As expected, fit1 better represents dataset 1');
else
    disp('fit2 better represents dataset 1. strange.');
end

Rsq21 = r_squared(Y2, yf1);
Rsq22 = r_squared(Y2, yf2);

if Rsq22 > Rsq21
    disp('As expected, fit2 better represents dataset 2');
else
    disp('fit1 better represents dataset 2. strange.');
end

%% Exercise 10:
% For the second fit Yf2 and know values Y2, calculate residuals and 
% plot them using the scatter() function. Also use the hist() 
% function to calculate and plot the histogram of the residuals.
% Calculate residuals for Yf2 and Y2
residuals_Y2 = Y2 - yf2;

figure;
subplot(1, 2, 1);
scatter(x, residuals_Y2);
title('Residuals for Yf2 and Y2');
xlabel('X');
ylabel('Residuals');

subplot(1, 2, 2);
hist(residuals_Y2, 20); %#ok<HIST> 
title('Histogram of Residuals');
xlabel('Residuals');
ylabel('Frequency');