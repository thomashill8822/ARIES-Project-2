%% Plot pcolor maps of SST from satellite images, with date, latitude, longitude, and save vector of mean and standard deviation of SST in 0.1 study location at each date.
load('sst_cell.mat');
study_sst = zeros(9, 2);
lon2 = (-6 : 0.01 : -3);
lat2 = (49.5 : 0.01 : 50.5)';
dates = ["2021 June 01"; "2021 June 15"; "2021 June 23"; "2021 July 18"; "2021 July 19"; "2021 August 04"; "2021 August 10"; "2021 August 11"; "2021 August 14"];

for d = 1 : 9 % should be to 9 but having issues processing days 6 - 9
    figure(d)
    hold on
    pcolor(lon2, lat2, sst_cell{1, d})
    shading flat
    xlabel('Longitude [deg]')
    ylabel('Latitude [deg]')
    title(dates(d))
    colorbar
    h = colorbar;
    ylabel(h, 'Sea-surface temperature [deg C]')
    caxis([12.5 22.5])
    rectangle('Position', [-4.2 50.22 0.1 0.1])
    study_sst(d, 1) = nanmean(sst_cell{1, d}(find(lat2 == 50.22) : find(lat2 == 50.32), 181 : 191), 'all');
    study_sst(d, 2) = nanstd(sst_cell{1, d}(find(lat2 == 50.22) : find(lat2 == 50.32), 181 : 191), 0, 'all');
end