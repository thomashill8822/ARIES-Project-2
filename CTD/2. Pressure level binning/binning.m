%% Load data.
load('C:\Users\thoma\Desktop\Turbulence project\13.8.21 data\CTD\2. Pressure level binning\ctd_data_all.mat');
% Each array in cell is 1 cast. Columns are:
% depth [m]
% pressure [dbar]
% temperature [deg C]
% salinity [PSU]
% density [kg / m^3]

%% Bin all variables at integer pressure values.
ctd_data_b = cell(1, 4);
blank = zeros(24, 5);
for i = 1 : 4
    ctd_data_b{1, i} = blank;
end
for n = 1 : 4
    for ii = 0 : 23
        divisor = 0;
        for i = 1 : size(ctd_data_all{1, n}, 1)
            if ctd_data_all{1, n}(i, 2) >= ii - 0.5 && ctd_data_all{1, n}(i, 2) < ii + 0.5
                ctd_data_b{1, n}(ii + 1, :) = ctd_data_b{1, n}(ii + 1, :) + ctd_data_all{1, n}(i, :);
                divisor = divisor + 1;
            end
        end
        ctd_data_b{1, n}(ii + 1, :) = ctd_data_b{1, n}(ii + 1, :)/divisor;
    end
end
% Note: pressure column is using binned pressure values; can make
% approximation to integer values if needed.