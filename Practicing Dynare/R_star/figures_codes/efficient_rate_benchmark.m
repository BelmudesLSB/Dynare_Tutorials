re_data = oo_.SmoothedVariables.re;

% Create time vector with quarterly frequency
time_periods = start_date+1:calquarters(1):end_date;
num_periods = length(time_periods);

% Plotting combined variance decomposition
fig = figure;
fig.Color = 'white'; % Set background color to white

plot(time_periods, (re_data-mean(re_data))*400, 'r-.', 'LineWidth', 1.5, 'DisplayName', 'T')
hold on
plot(time_periods, (iras-mean(iras)), 'b-', 'LineWidth', 1.5, 'DisplayName', 'FFR') % Blue solid line with label "FFR"
hold on
plot(time_periods, 0*iras, 'LineWidth', 0.5, 'Color', 'black', 'HandleVisibility', 'off') % Black zero line without legend entry
datetick('x', 'yyyy:qq'); % Display years and quarters
legend('Location', 'southwest');
xlabel('Time');
ylabel('Smoothed efficient real rate');

plot_folder = 'figures_results';
plot_name = 'efficient_rate_benchmark.png';
plot_path = fullfile(plot_folder, plot_name);
saveas(gcf, plot_path);
disp(['Plot saved as: ', plot_path]);

