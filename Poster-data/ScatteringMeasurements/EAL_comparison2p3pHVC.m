% curve fit to mean intensity of 2p and 3p data to get effective attenuation length EAL 

clear
%first, add paths and load in data
addpath C:/Users/naomish/Documents/GitHub/3PM-in-ZFs/Poster-data/ScatteringMeasurements/
cd C:/Users/naomish/Documents/GitHub/3PM-in-ZFs/Poster-data/ScatteringMeasurements/
load('P2hvcb.mat'); load('P2out.mat'); load('P3hvc.mat'); load('P3outb.mat')

%% 2P data
% Define the function to fit (f(x) = a * exp(-2x/b) + c)
func = @(params, x) params(1) * exp(-2 * x / params(2)) + params(3);

y_data= P2hvcb.Int(50:end); %truncated because only computing below VZ
x_data = P2hvcb.Microns(50:end);

y2_data = P2out.Int(50:end);
x2_data = P2out.Microns(50:end);

% Initial parameter guesses
initialGuess = [100, 100, 100];

% Set lower and upper bounds
lb = [0, 0, 0];  % Lower bounds for a, b, and c
ub = [inf, inf, inf];  % Upper bounds for a, b, and c

% Fit the curve to the data with parameter bounds
params = lsqcurvefit(func, initialGuess, x_data, y_data, lb, ub);
params2 = lsqcurvefit(func, initialGuess, x2_data, y2_data, lb, ub);

% Extract the optimized parameters
a = params(1);
b = params(2);
c = params(3);
a2 = params2(1);
b2 = params2(2);
c2 = params2(3);

% Plot the data and the curve fit
fig = figure(1);
plot(x_data, y_data, 'o', 'Color',[1,0,0],'DisplayName', '2P HVC');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
plot(x_data, y_fit, 'Color',[1,0,0], 'DisplayName', ['EAL: ' num2str(b)]);

%plot other data and fit
plot(x2_data, y2_data, 'o', 'Color', [1, 0.5, 0],'DisplayName', '2P Out');
y2_fit = func(params2, x2_data);
plot(x2_data, y2_fit, 'Color', [1, 0.5, 0], 'DisplayName', ['EAL: ' num2str(b2)]);

xlabel('Depth (microns)');
ylabel('Mean Intensity');
title('Estimated Attenuation Length');
%legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);

% disp(['a = ', num2str(a)]);
% disp(['b = ', num2str(b)]);
% disp(['c = ', num2str(c)]);

%% 3P DATA

clearvars -except P3hvc fig P3outb P2hvcb P2out

% Define the function to fit (f(x) = a * exp(-3x/b) + c)
func = @(params, x) params(1) * exp(-3 * x / params(2)) + params(3);

y_data= P3hvc.Int(10:end); %truncated because only computing below VZ
x_data = P3hvc.Microns(10:end);

y2_data = P3outb.Int(10:end);
x2_data = P3outb.Microns(10:end);

% Initial parameter guesses
initialGuess = [100, 100, 100];

% Set lower and upper bounds
lb = [0, 0, 0];  % Lower bounds for a, b, and c
ub = [inf, inf, inf];  % Upper bounds for a, b, and c

% Fit the curve to the data with parameter bounds
params = lsqcurvefit(func, initialGuess, x_data, y_data, lb, ub);
params2 = lsqcurvefit(func, initialGuess, x2_data, y2_data, lb, ub);

% Extract the optimized parameters
a = params(1);
b = params(2);
c = params(3);
a2 = params2(1);
b2 = params2(2);
c2 = params2(3);

% Plot the data and the curve fit
figure(1);
hold on
plot(x_data, y_data, 'o', 'Color',[0,1,0],'DisplayName', '3P HVC');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
plot(x_data, y_fit, 'Color',[0,1,0], 'DisplayName', ['EAL: ' num2str(b)]);

%plot other data and fit
plot(x2_data, y2_data, 'o', 'Color', [0, 0.5, 0.5],'DisplayName', '3P Out');
y2_fit = func(params2, x2_data);
plot(x2_data, y2_fit, 'Color', [0, 0.5, 0.5], 'DisplayName', ['EAL: ' num2str(b2)]);


legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);
set(gca,'FontSize',16), set(gcf,'color','w');
hold off

% disp(['a = ', num2str(a)]);
% disp(['b = ', num2str(b)]);
% disp(['c = ', num2str(c)]);



