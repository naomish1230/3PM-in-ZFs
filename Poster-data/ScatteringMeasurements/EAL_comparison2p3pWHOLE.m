% curve fit to mean intensity of 2p and 3p data to get effective attenuation length EAL 

clear
%========= normalize y axis? 
norm = 1; %rescale x and y to be on same scale
logg = 1; %plot as log log plot
%==========

%% first, add paths and load in data
addpath /Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/Poster-data/ScatteringMeasurements/
cd /Users/naomishvedov/Documents/GitHub/3PM-in-ZFs/Poster-data/ScatteringMeasurements/
load('P2_whole.mat');  load('P3_whole.mat'); 

%% 2P data
% Define the function to fit (f(x) = a * exp(-2x/b) + c)
func = @(params, x) params(1) * exp(-2 * x / params(2)) + params(3);
func2 = @(params, x) params(1) * exp(-3 * x / params(2)) + params(3);
y_data= P2_whole.Int(50:end); %truncated because only computing below VZ
x_data = P2_whole.Microns(50:end);

y2_data = P3_whole.Int(10:end);
x2_data = P3_whole.Microns(10:end);

% Initial parameter guesses
initialGuess = [100, 100, 100];

% Set lower and upper bounds
lb = [0, 0, 0];  % Lower bounds for a, b, and c
ub = [inf, inf, inf];  % Upper bounds for a, b, and c

% Fit the curve to the data with parameter bounds
params = lsqcurvefit(func, initialGuess, x_data, y_data, lb, ub);

initialGuess = [100, 100, 100];
params2 = lsqcurvefit(func2, initialGuess, x2_data, y2_data, lb, ub);

% Extract the optimized parameters
a = params(1);
b = params(2);
c = params(3);
a2 = params2(1);
b2 = params2(2);
c2 = params2(3);

% Plot the data and the curve fit
fig = figure(1);
plot(x_data, y_data, 'o', 'Color',[0, 0, 0.3],'DisplayName', '2P Data');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
plot(x_data, y_fit, 'Color',[0, 0, 0.3], 'DisplayName', '2P Curve Fit');%['EAL: ' num2str(b)]);

%plot other data and fit
plot(x2_data, y2_data, 'o', 'Color', [1, 0, 0],'DisplayName', '3P Data');
y2_fit = func2(params2, x2_data);
plot(x2_data, y2_fit, 'Color', [1, 0, 0], 'DisplayName', '3P Curve Fit');%['EAL: ' num2str(b2)]);

xlabel('Depth (microns)');
ylabel('Mean Intensity (a.u.)');
title('Estimated Attenuation Length');
legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);
set(gca,'FontSize',16), set(gcf,'color','w');
hold off
%legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);

disp(['2P EAL: ' num2str(b)])
disp(['3P EAL: ' num2str(b2)])

%% NORMALIZED PLOTS
%rescale or "normalize" y_axes for better comparison
if norm == 1
    % Define the function to fit (f(x) = a * exp(-2x/b) + c)
func = @(params, x) params(1) * exp(-2 * x / params(2)) + params(3);
func2 = @(params, x) params(1) * exp(-3 * x / params(2)) + params(3);
y_data= P2_whole.Int(50:end); %truncated because only computing below VZ
x_data = P2_whole.Microns(50:end);

y2_data = P3_whole.Int(10:end);
x2_data = P3_whole.Microns(10:end);
    
% Initial parameter guesses
initialGuess = [100, 100, 100];

% Set lower and upper bounds
lb = [0, 0, 0];  % Lower bounds for a, b, and c
ub = [inf, inf, inf];  % Upper bounds for a, b, and c

% Fit the curve to the data with parameter bounds
params = lsqcurvefit(func, initialGuess, x_data, y_data, lb, ub);

initialGuess = [100, 100, 100];
params2 = lsqcurvefit(func2, initialGuess, x2_data, y2_data, lb, ub);

% Extract the optimized parameters
a = params(1);
b = params(2);
c = params(3);
a2 = params2(1);
b2 = params2(2);
c2 = params2(3);

% Plot the data and the curve fit
fig = figure(2);
plot(rescale(x_data,100,250), rescale(y_data,0,max(y2_data)), 'o', 'Color',[0, 0, 0.3],'DisplayName', '2P Data');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
plot(rescale(x_data,100,250), rescale(y_fit,0,max(y2_fit)), 'Color',[0, 0, 0.3], 'DisplayName', '2P Curve Fit');%['EAL: ' num2str(b)]);

%plot other data and fit
plot(rescale(x2_data,100,250), rescale(y2_data,0,max(y2_data)), 'o', 'Color', [1, 0, 0],'DisplayName', '3P Data');
y2_fit = func2(params2, x2_data);
plot(rescale(x2_data,100,250), rescale(y2_fit,0,max(y2_fit)), 'Color', [1, 0, 0], 'DisplayName', '3P Curve Fit');%['EAL: ' num2str(b2)]);

xlabel('Depth (microns)');
ylabel('Mean Intensity (a.u.)');
title('Estimated Attenuation Length');
legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);
set(gca,'FontSize',16), set(gcf,'color','w');
hold off
%legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);

disp(['2P EAL: ' num2str(b)])
disp(['3P EAL: ' num2str(b2)])
    
end

%% log log plot instead of rescaling

if logg == 1
    % Define the function to fit (f(x) = a * exp(-2x/b) + c)
func = @(params, x) params(1) * exp(-2 * x / params(2)) + params(3);
func2 = @(params, x) params(1) * exp(-3 * x / params(2)) + params(3);
y_data= P2_whole.Int(50:end); %truncated because only computing below VZ
x_data = P2_whole.Microns(50:end);

y2_data = P3_whole.Int(10:end);
x2_data = P3_whole.Microns(10:end);
    
% Initial parameter guesses
initialGuess = [100, 100, 100];

% Set lower and upper bounds
lb = [0, 0, 0];  % Lower bounds for a, b, and c
ub = [inf, inf, inf];  % Upper bounds for a, b, and c

% Fit the curve to the data with parameter bounds
params = lsqcurvefit(func, initialGuess, x_data, y_data, lb, ub);

initialGuess = [100, 100, 100];
params2 = lsqcurvefit(func2, initialGuess, x2_data, y2_data, lb, ub);

% Extract the optimized parameters
a = params(1);
b = params(2);
c = params(3);
a2 = params2(1);
b2 = params2(2);
c2 = params2(3);

% Plot the data and the curve fit
fig = figure(3);
plot(x_data, rescale(log(y_data),0,max(log(y2_data))), 'o', 'Color',[0, 0, 0.3],'DisplayName', '2P Data');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
plot(x_data,rescale(log(y_fit),0,max(log(y2_data))), 'Color',[0, 0, 0.3], 'DisplayName', '2P Curve Fit');%['EAL: ' num2str(b)]);

%plot other data and fit
plot(x2_data, rescale(log(y2_data),0,max(log(y2_data))), 'o', 'Color', [1, 0, 0],'DisplayName', '3P Data');
y2_fit = func2(params2, x2_data);
plot(x2_data, rescale(log(y2_fit),0,max(log(y2_data))), 'Color', [1, 0, 0], 'DisplayName', '3P Curve Fit');%['EAL: ' num2str(b2)]);

xlabel('Depth (microns)');
ylabel('Log Mean Intensity (a.u.)');
title('Estimated Attenuation Length');
legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);
set(gca,'FontSize',16), set(gcf,'color','w');
hold off
%legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);

disp(['2P EAL: ' num2str(b)])
disp(['3P EAL: ' num2str(b2)])

% Plot the data and the curve fit
fig = figure(4);
loglog(x_data, rescale(y_data,0,max(y2_data)), 'o', 'Color',[0, 0, 0.3],'DisplayName', '2P Data');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
loglog(x_data,rescale(y_fit,0,max(y2_data)), 'Color',[0, 0, 0.3], 'DisplayName', '2P Curve Fit');%['EAL: ' num2str(b)]);
%plot other data and fit
loglog(x2_data, rescale(y2_data,0,max(y2_data)), 'o', 'Color', [1, 0, 0],'DisplayName', '3P Data');
y2_fit = func2(params2, x2_data);
loglog(x2_data, rescale(y2_fit,0,max(y2_data)), 'Color', [1, 0, 0], 'DisplayName', '3P Curve Fit');%['EAL: ' num2str(b2)]);
xlabel('Log Depth (microns)');
ylabel('Log Mean Intensity (a.u.)');
title('Estimated Attenuation Length');
legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);
set(gca,'FontSize',16), set(gcf,'color','w');
hold off
%legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);

    
end