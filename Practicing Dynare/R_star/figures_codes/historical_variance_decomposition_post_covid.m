%{
Remember that:
var
xtil        %(1)
y           %(2)
pitil       %(3)
pi          %(4)
r           %(5)
i           %(6)
u           %(7)
gamma       %(8)
delta       %(9)
xe          %(10)
ye          %(11)
re          %(variable)
ie          %(13)
gya         %(14) Growth rate of output
pia         %(15) Inflation rate
iras;       %(16)
%}

variable = 15;

num_shocks = size(oo_.shock_decomposition, 1);  % Number of shocks
num_vars = size(oo_.shock_decomposition, 2);    % Number of variables
num_periods = size(oo_.shock_decomposition, 3); % Number of time periods

ei=squeeze(oo_.shock_decomposition(variable, 1, :));
eu=squeeze(oo_.shock_decomposition(variable, 2, :));
edelta=squeeze(oo_.shock_decomposition(variable, 3, :));
egamma=squeeze(oo_.shock_decomposition(variable, 4, :));
state= squeeze(oo_.shock_decomposition(variable, 5, :));
all = squeeze(oo_.shock_decomposition(variable, 6, :));

% Create time vector with quarterly frequency
time_periods = start_date+1:calquarters(1):end_date;
num_periods = length(time_periods);

% Plotting combined variance decomposition
figure;
bar(time_periods, [ei, eu, edelta, egamma, state], 'stack');
hold on
plot(time_periods, all, 'k', 'LineWidth', 2); 
datetick('x', 'yyyy:qq'); % Display years and quarters
% Adding legend for stacked bars with LaTeX labels
legend('$\epsilon_i:$ Interest rate', '$\epsilon_u:$ Markups', '$\epsilon_{\delta}:$ Taste', '$\epsilon_{\gamma}:$ Productivity growth', 'State', 'Total', 'Location', 'best', 'Interpreter', 'latex');

% Adding labels and title
xlabel('Time Periods');
ylabel('Variance Contribution');
title('Historical shock decomposition of Inflation');

plot_folder = 'figures_results';
plot_name = 'historical_decomposition_inflation_post_covid.png';
plot_path = fullfile(plot_folder, plot_name);
saveas(gcf, plot_path);
disp(['Plot saved as: ', plot_path]);
