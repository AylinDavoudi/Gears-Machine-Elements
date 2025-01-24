% MATLAB code for deflection calculation with a range of forces

% Inputs
b = 10;       % Tooth face width (mm)
nu = 0.3;     % Poisson's ratio
E = 2e5;      % Young's modulus (N/mm^2)
k1 = 5;       % Gear-specific parameter
k2 = 5;       % Gear-specific parameter
rho1 = 10;    % Radius of curvature 1 (mm)
rho2 = 15;    % Radius of curvature 2 (mm)

% Force range
F_range = linspace(50, 5000, 100); % Force range from 50 N to 5000 N (100 points)

% Initialize deflection array
delta_c_array = zeros(size(F_range));

% Calculate deflection for each force
for i = 1:length(F_range)
    F = F_range(i);
    % Half-width of the contact zone (a)
    a = sqrt((8 * F * rho1 * rho2 * (1 - nu^2)) / (b * (rho1 + rho2) * pi * E));
    % Deflection calculation (delta_c)
    delta_c_array(i) = (4 * F * (1 - nu^2)) / (b * pi * E) * ...
                       (log((2 * sqrt(k1 * k2)) / a) - (nu / (2 * (1 - nu))));
end

% Plotting the deflection
figure;
plot(F_range, delta_c_array, 'b-', 'LineWidth', 1.5);
xlabel('Force (N)');
ylabel('Deflection (mm)');
title('Deflection vs Force on Gear Tooth');
grid on;
