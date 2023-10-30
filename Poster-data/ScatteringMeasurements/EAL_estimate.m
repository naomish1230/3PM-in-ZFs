% curve fit to mean intensity of 2p or 3p data to get effective attenuation length EAL 
function EAL_estimate(data,p) %data is variable with Int and Micron info, p is 2p or 3p

% Define the function to fit (f(x) = a * exp(-2x/b) + c)
func = @(params, x) params(1) * exp(-p * x / params(2)) + params(3);

if p == 2
    y_data= data.Int(50:end); %truncated because only computing below VZ
    x_data = data.Microns(50:end);
elseif p == 3
  y_data= data.Int(10:end); %truncated because only computing below VZ
    x_data = data.Microns(10:end); 
end

% Initial parameter guesses
initialGuess = [100, 100, 100];

% Set lower and upper bounds
lb = [0, 0, 0];  % Lower bounds for a, b, and c
ub = [inf, inf, inf];  % Upper bounds for a, b, and c

% Fit the curve to the data with parameter bounds
params = lsqcurvefit(func, initialGuess, x_data, y_data, lb, ub);

% Extract the optimized parameters
a = params(1);
b = params(2);
c = params(3);

% Plot the data and the curve fit
fig = figure(1);
plot(x_data, y_data, 'o', 'Color',[1,0,0],'DisplayName', 'Data');
hold on;
% Generate curve fit using optimized parameters
y_fit = func(params, x_data);
plot(x_data, y_fit, 'Color',[1,0,0], 'DisplayName', ['EAL: ' num2str(b)]);
xlabel('Depth (microns)');
ylabel('Mean Intensity');
title('Estimated Attenuation Length');
%legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);

disp(['a = ', num2str(a)]);
disp(['b (EAL) = ', num2str(b)]);
disp(['c = ', num2str(c)]);

legend;%('2P HVC','2P Out',['EAL: ' num2str(b)], ['EAL: ' num2str(b2)]);
set(gca,'FontSize',16), set(gcf,'color','w');
hold off

end

