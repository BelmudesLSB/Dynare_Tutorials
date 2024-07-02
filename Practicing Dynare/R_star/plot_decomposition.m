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

variable = 14;

% Example: Plotting combined variance decomposition for all shocks over time
num_shocks = size(oo_.shock_decomposition, 1);  % Number of shocks
num_vars = size(oo_.shock_decomposition, 2);    % Number of variables
num_periods = size(oo_.shock_decomposition, 3); % Number of time periods

ei=squeeze(oo_.shock_decomposition(variable, 1, :));
eu=squeeze(oo_.shock_decomposition(variable, 2, :));
edelta=squeeze(oo_.shock_decomposition(variable, 3, :));
egamma=squeeze(oo_.shock_decomposition(variable, 4, :));
state= squeeze(oo_.shock_decomposition(variable, 5, :));
all = squeeze(oo_.shock_decomposition(variable, 6, :));

% Create time vector (assuming 146 time periods)
time_periods = 1:num_periods;

% Plotting combined variance decomposition
figure;
bar(time_periods, [ei, eu, edelta, egamma, state], 'stack');
hold on
plot(time_periods, all, 'k', 'LineWidth', 2); 

% Adding legend for stacked bars with LaTeX labels
legend('$\epsilon_i$', '$\epsilon_u$', '$\epsilon_{\delta}$', '$\epsilon_{\gamma}$', 'State', 'Total', 'Location', 'southwest', 'Interpreter', 'latex');

% Adding labels and title
xlabel('Time Periods');
ylabel('Combined Variance Contribution');
title('Combined Variance Decomposition of Shocks Over Time');
