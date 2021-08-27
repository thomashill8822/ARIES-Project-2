%% Load files.
load('C:\Users\thoma\Desktop\Turbulence project\13.8.21 data\CTD\3. Plotting basic profiles\ctd_data_v_b.mat');

%% Plot temperature profiles.
figure(1)
hold on
for n = 1 : 4
    plot(ctd_data_v_b{1, n}(:, 3), ctd_data_v_b{1, n}(:, 2))
end
ylim([0 24])
set(gca, 'YDir','reverse')
xlabel('Temperature [deg C]')
ylabel('Pressure [dbar]')
legend('Cast 01', 'Cast 02', 'Cast 03', 'Cast 04')

%% Plot salinity profiles.
figure(2)
hold on
for n = 1 : 4
    plot(ctd_data_v_b{1, n}(3 : end, 4), ctd_data_v_b{1, n}(3 : end, 2))
end
ylim([0 24])
set(gca, 'YDir','reverse')
xlabel('Salinity [PSU]')
ylabel('Pressure [dbar]')
legend('Cast 01', 'Cast 02', 'Cast 03', 'Cast 04')