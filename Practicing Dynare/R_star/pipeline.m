clear all
clc

% Define sample dates:
% Prompt user to choose an option
fprintf('Choose an option:\n');
fprintf('1. Option 1: Start date is Q3 1987, end date is maximum observation date.\n');
fprintf('2. Option 2: Start date is Q3 1987, end date is beginning of COVID-19.\n');
fprintf('3. Option 3: Start date is beginning of COVID-19, end date is end of sample period.\n');
fprintf('4. Option 4: Start date is Q3 1987, end date is Q3 2009.\n');
option = input('Enter your option (1-4): ');

% Initialize variables
start_date = [];
end_date = [];

% Define date ranges based on user choice
switch option
    case 1
        start_date = datetime(1987, 7, 1);
        end_date = datetime(2024, 1, 1);
    case 2
        start_date = datetime(1987, 7, 1);
        end_date = datetime(2020, 1, 1); % Adjust if needed
    case 3
        start_date = datetime(2020, 1, 1); % Adjust if needed
        end_date = datetime(2024, 1, 1); % Adjust if needed
    case 4
        start_date = datetime(1987, 7, 1);
        end_date = datetime(2009, 7, 1); % Adjusted to Q3 of 2009
    otherwise
        error('Invalid option. Please choose an option between 1 and 4.');
end

% Check if end_date is still empty (for maximum observation date)
if isempty(end_date)
    fprintf('Option %d: Start date is Q3 1987, end date is maximum observation date.\n', option);
else
    fprintf('Option %d: Start date is Q3 1987, end date is %s.\n', option, datestr(end_date, 'yyyy:mm:dd'));
end



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

%% Compute dynare routine and store data efficient rate series:
dynare r_star.mod

%Run historical variance decomposition:
folderPath = 'figures_codes';
addpath(folderPath);
switch option
    case 1
        run('historical_variance_decomposition_full_sample.m');
        run('efficient_rate_full_sample.m');
        run('back_to_steady_state_full_sample.m')
    case 2
        run('historical_variance_decomposition_pre_covid.m');
        run('efficient_rate_full_pre_covid.m');
    case 3
        run('historical_variance_decomposition_post_covid.m');
        run('efficient_rate_full_post_covid.m');
    case 4
        run('historical_variance_decomposition_benchmark.m');
        run('efficient_rate_benchmark.m');
    otherwise
        error('Invalid option. Please choose an option between 1 and 6.');
end



