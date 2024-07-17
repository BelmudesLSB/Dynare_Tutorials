clear all
clc

start_date = datetime(1987, 7, 1);
end_date = datetime(2024, 1, 1);

%% Construct Data Series:

% Define the folder path
folderPath = 'data/intermediate_data';
addpath(folderPath);
% Extract series for FEDFUNDS.xls
fed_funds = extractSeries(folderPath, 'FEDFUNDS.xls', start_date, end_date);
% Extract series for GDPC.xls
real_gdp = extractSeries(folderPath, 'GDPC.xls', start_date, end_date);
% Extract series for PCEPILFE.xls
deflator = extractSeries(folderPath, 'PCEPILFE.xls', start_date, end_date);

%% Construct growth rates, and convert to annual frequency:

%Define auxiliary variables:
RGDP = real_gdp;
DGDP = deflator;
FFR = fed_funds;
% Calculate gya
gya = 400 * log(RGDP(2:end) ./ RGDP(1:end-1));
% Calculate pia
pia = 400 * log(DGDP(2:end) ./ DGDP(1:end-1));
% Rename FFR to iras
iras = FFR(2:end);
% Delete the old variables:
clear RGDP DGDP FFR;
% Save the variables as a .mat file
save('data_EU_gdpd.mat', 'gya', 'pia', 'iras')

%% Run Mod file

dynare r_star_taylor.mod