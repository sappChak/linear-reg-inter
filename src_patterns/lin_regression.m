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


Rn = 
Ru = 
Ri = 

% Calculate the sample mean and variance of all pseudo random matrices:

%   a) for each column 
%   b) for the whole matrix
Mna = 
Mnb = 

Vna = 
Vnb = 

Mua = 
Mub = 

Vua = 
Vub = 

Mia = 
Mib = 

Via = 
Vib = 

%% Exercise 4:
% Generate a pseudo random column vector V of varying length N
% and constant mean and variance m = 10, v = 3.
% For each vector length N calculate sample mean ms and variance vs
% and for each calculated ms and vs calculate thei relative errors in
% per cent.
% Run this section several times to observe slightly different results each
% time.

m = 10
v = 3

for N = [1 2 5 10.^[ 1 : 5 ] ]
	ms = 
	vs = 
	abs( ms - m ) / m

	fprintf("Vector length N: %6d, mean: %10.6f, variance: %10.6f, mean error: %10.6f%%, variance error: %10.6f%% \n", %Finish this statement, so that it works ...
end

%% Exercise 5:
% Generate values of a linear function f(x) = beta*x + alpha for the x variable 
% taking on values from the interval <-4,10> with step 0.1.
% Create two noisy copies: Y1, and Y2 by adding pseudo-random noise from normal
% distribution: one with a variance v1 = 0.1, the other with v2 = 1
% Use the plot(), subplot() and scatter() function to plot three plots
% side-by-side: first the noiseless linear function f(x), second the
% scattered noisy observations Y1, and finally scattered observations
% of the more noise degraded signal Y2.

alpha	= 2
beta	= 0.5

s		= 0.5

%TODO: complete the code below:

x = 
FX = beta * x + alpha

N1 = randn ...
N2 = randn ...


Y1 = FX + N1
Y2


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
% % Insert code below: using a toolbox function
% polyfit
% 
% % Insert code below: using the \ operator




%% Exercise 8:
% Use the polyval() function to find the data yf1 and yf2 for both noisy
% datasets y1 and y2 using the previously found linear regression 
% coefficients alpha, beta for the x vector defined in E4. 
% Use the plot(), subplot() and scatter() functions to plot
% three plots side by side:
%   1. The noisy data y1 along with the fitted linear function values yf1.
%   2. The noisy data y2 along with the fittel linear function values yf2.
%   3. The linear fitted values yf1 and yf2.

% yf1 = 
% yf2 = 



%% Exercise 9:
% Implement the body of the function r_squared() in file r_squared.m 
% Do not modify the following code:
% 
% Rsq11 = r_squared( y1, yf1 )
% Rsq12 = r_squared( y1, yf2 )
% 
% if Rsq11 > Rsq12
% 	disp('As expected, fit1 better represents dataset 1') ;
% else
% 	disp('fit2 better represents dataset 1. strange.')
% end
% 
% Rsq21 = r_squared( y2, yf1 )
% Rsq22 = r_squared( y2, yf2 )
% 
% if Rsq22 > Rsq21
% 	disp('As expected, fit2 better represents dataset 2') ;
% else
% 	disp('fit1 better represents dataset 2. strange.')
% end

%% Exercise 10:
% For the second fit Yf2 and know values Y2, calculate residuals and 
% plot them using the scatter() function. Also use the hist() 
% function to calculate and plot the histogram of the residuals.






