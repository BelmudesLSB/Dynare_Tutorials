%% Path back to steady state in the absense of shocks.

forecast_re = oo_.forecast.Mean.re;
smoothed_re = oo_.SmoothedVariables.re;

% Concatenate forecast_re and smoothed_re into path_re
path_re = [smoothed_re; forecast_re];

% Create time vector with quarterly frequency
end_date = end_date + calquarters(50); % This should coincide with periods in r_star.mod
time_periods = start_date+1:calquarters(1):end_date;
num_periods = length(time_periods);

fig = figure;
fig.Color = 'white'; % Set background color to white

plot(time_periods, (path_re-mean(re_data))*400, 'r-.', 'LineWidth', 1.5, 'DisplayName', 'T')
hold on 
plot(time_periods, 0*path_re, 'LineWidth', 0.5, 'Color', 'black', 'HandleVisibility', 'off') % Black zero line without legend entry
datetick('x', 'yyyy:qq'); % Display years and quarters
legend('Location', 'southwest');
xlabel('Time');
ylabel('Smoothed efficient real rate');

plot_folder = 'figures_results';
plot_name = 'back_to_steady_state_full_sample.png';
plot_path = fullfile(plot_folder, plot_name);
saveas(gcf, plot_path);
disp(['Plot saved as: ', plot_path]);