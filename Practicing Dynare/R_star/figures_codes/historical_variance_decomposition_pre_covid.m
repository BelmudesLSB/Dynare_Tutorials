% Define the list of variable descriptions
variable_descriptions = { ...
    'xtil',                    ... % (1)  
    'y',                       ... % (2)  
    'pitil',                   ... % (3)  
    'pi',                      ... % (4)  
    'r',                       ... % (5)  
    'i',                       ... % (6)  
    'u',                       ... % (7)  
    'gamma',                   ... % (8)  
    'delta',                   ... % (9)  
    'Efficient output gap',    ... % (10) xe
    'Efficient output',        ... % (11) ye
    'Efficient rate',          ... % (12) re
    'Efficient nominal rate',  ... % (13) ie
    'Output Growth',           ... % (14) gya 
    'Inflation rate',          ... % (15) pia
    'Fed funds rate'           ... % (16) iras
};

% Define the indices of the variables you want to plot:

num_shocks = size(oo_.shock_decomposition, 1);  % Number of shocks
num_vars = size(oo_.shock_decomposition, 2);    % Number of variables
num_periods = size(oo_.shock_decomposition, 3); % Number of time periods

% Create time vector with quarterly frequency
time_periods = start_date+1:calquarters(1):end_date;
num_periods = length(time_periods);

for variable = 10:1:16

    ei = squeeze(oo_.shock_decomposition(variable, 1, :));
    eu = squeeze(oo_.shock_decomposition(variable, 2, :));
    edelta = squeeze(oo_.shock_decomposition(variable, 3, :));
    egamma = squeeze(oo_.shock_decomposition(variable, 4, :));
    state = squeeze(oo_.shock_decomposition(variable, 5, :));
    all = squeeze(oo_.shock_decomposition(variable, 6, :));

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
    title(['Historical shock decomposition of ', variable_descriptions{variable}]);

    % Save the plot
    plot_folder = 'figures_results';
    plot_name = ['historical_decomposition_precovid_', variable_descriptions{variable}, '.png'];
    plot_path = fullfile(plot_folder, plot_name);
    saveas(gcf, plot_path);
    disp(['Plot saved as: ', plot_path]);

    hold off
end
