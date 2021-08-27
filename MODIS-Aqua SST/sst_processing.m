function sst2 = sst_processing(filename)

% Specify filename for each image as it is written in folder.
% Specify filenumber in date order:
% jun 01 = 1
% jun 15 = 2
% jun 23 = 3
% jul 18 = 4
% jul 19 = 5
% aug 04 = 6
% aug 10 = 7
% aug 11 = 8
% aug 14 = 9

lon = ncread(filename, '/navigation_data/longitude');
lat = ncread(filename, '/navigation_data/latitude');
sst = ncread(filename, '/geophysical_data/sst');
qual = ncread(filename, '/geophysical_data/qual_sst');

sst(qual(:) > 0) = NaN;

lon2 = (-6 : 0.01 : -3);
lat2 = (49.5 : 0.01 : 50.5)';

clear tmp
tmp = find(isnan(lon(:)) | isnan(lat(:)));
if ~isempty(tmp)
    clear iok
    iok = find(~isnan(lon(:)) & ~isnan(lat(:)));
    sst2 = griddata(lon(iok), lat(iok), sst(iok), lon2, lat2, 'nearest');
else
    sst2 = griddata(lon, lat, sst, lon2, lat2, 'nearest');
end

end
