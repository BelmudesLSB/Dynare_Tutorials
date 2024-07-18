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

%% Construct the sequence of shocks:

% Save individual shocks
smoothed_shocks_ei = oo_.SmoothedShocks.ei;
smoothed_shocks_eu = oo_.SmoothedShocks.eu;
smoothed_shocks_edelta = oo_.SmoothedShocks.edelta;
smoothed_shocks_egamma = oo_.SmoothedShocks.egamma;
save('smoothed_shocks_ei.mat', 'smoothed_shocks_ei');
save('smoothed_shocks_eu.mat', 'smoothed_shocks_eu');
save('smoothed_shocks_edelta.mat', 'smoothed_shocks_edelta');
save('smoothed_shocks_egamma.mat', 'smoothed_shocks_egamma');

% Initial conditions:

% Initialize an array to store first observations of smoothed variables:
first_observation_values = zeros(length(M_.endo_names), 1);
for i = 1:length(oo_.var_list)
    % Get the variable name
    var_name = oo_.var_list{i};
    disp(var_name)
   % Access the variable from SmoothedVariables and take the first element
    first_observation_values(i) = oo_.SmoothedVariables.(var_name)(1);
    disp(oo_.SmoothedVariables.(var_name)(1))
    if i==1
        lenght = length(oo_.SmoothedVariables.(var_name)) - 1;
    end
end
initial_condition_states = first_observation_values;

shock_matrix = zeros(lenght,M_.exo_nbr); % Create shock matrix with number of time periods in columns% Specify a matrix for shocks:
shock_matrix(:,strmatch('ei',M_.exo_names,'exact')) = smoothed_shocks_ei(2:end); 
shock_matrix(:,strmatch('eu',M_.exo_names,'exact')) = smoothed_shocks_eu(2:end);
shock_matrix(:,strmatch('edelta',M_.exo_names,'exact')) = smoothed_shocks_edelta(2:end);
shock_matrix(:,strmatch('egamma',M_.exo_names,'exact')) = smoothed_shocks_egamma(2:end);

% Modify the shocks to monetary policy such that we get the same path one
% year before:
start_date_counter = datetime(2021, 1, 1);
time_periods_counter = start_date_counter+1:calquarters(1):end_date;
num_periods_counter = length(time_periods_counter);

% Inputation of shocks
policy_shocks = smoothed_shocks_ei(2:end);
perfom_imputation = true;
if perfom_imputation 
    policy_shocks(end-11) = 1.0;  % 01-Jan-2021
    policy_shocks(end-10) = 1.0;  % 01-Apr-2021
    policy_shocks(end-9)  = 2.0;  % 01-Jul-2021
    policy_shocks(end-8)  = 2.0;  % 01-Oct-2021
    policy_shocks(end-7)  = 3.5; % 01-Jan-2022
    policy_shocks(end-6)  = 1.5;   % 01-Apr-2022
    policy_shocks(end-5)  = 0.5;   % 01-Jul-2022
    policy_shocks(end-4)  = 0.25;  % 01-Oct-2022
    policy_shocks(end-3)  = 0.511422442514439;  % 01-Jan-2023
    policy_shocks(end-2)  = 1.07782829105966;   % 01-Apr-2023
    policy_shocks(end-1)  = 0.509434711475911;  % 01-Jul-2023
    policy_shocks(end)    = -0.906243775922084; % 01-Oct-2023
end
% Store as realized shocks:
shock_matrix(:,strmatch('ei',M_.exo_names,'exact'))=policy_shocks;

% Test the simulated series + shocks with the smoothed variable:
y2 = simult_(M_,options_,initial_condition_states,oo_.dr,shock_matrix,1);

% Create time vector with quarterly frequency
end_date = end_date; % This should coincide with periods in r_star.mod
time_periods = start_date+1:calquarters(1):end_date;
num_periods = length(time_periods);

fig = figure;
fig.Color = 'white';
plot(time_periods, (ra + pistar) + 400* (y2(6,:)), 'r', 'LineWidth', 1.5, 'DisplayName','Counterfactual');
hold on
plot(time_periods, (ra + pistar) + 400*(oo_.SmoothedVariables.i),'b-', 'LineWidth', 1.5, 'DisplayName', 'Data');
legend('Location', 'southwest');
xlabel('Time');
ylabel('Nominal interest rate');


fig = figure;
fig.Color = 'white';
plot(time_periods, pistar + 400*y2(4,:), 'r', 'LineWidth', 1.5, 'DisplayName','Counterfactual');
hold on
plot(time_periods, pistar + 400*oo_.SmoothedVariables.pi,'b-', 'LineWidth', 1.5, 'DisplayName', 'Data');
legend('Location', 'southwest');
xlabel('Time');
ylabel('Inflation');

