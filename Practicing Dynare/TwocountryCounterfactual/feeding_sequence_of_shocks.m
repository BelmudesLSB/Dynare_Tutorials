% Alternatively, save individual shocks
smoothed_shocks_e1 = oo_.SmoothedShocks.e1;
smoothed_shocks_e2 = oo_.SmoothedShocks.e2;
save('smoothed_shocks_e1.mat', 'smoothed_shocks_e1');
save('smoothed_shocks_e2.mat', 'smoothed_shocks_e2');

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

shock_matrix = zeros(lenght,M_.exo_nbr); %create shock matrix with number of time periods in columns% Specify a matrix for shocks:
shock_matrix(:,strmatch('e1',M_.exo_names,'exact')) = smoothed_shocks_e1(2:end); %set news shock to 1 (use any shock size you want)
shock_matrix(:,strmatch('e2',M_.exo_names,'exact')) = smoothed_shocks_e2(2:end); %8 periods later use counteracting shock of -1

% Simulate using equilibrium policy functions:
y2 = simult_(M_,options_,initial_condition_states,oo_.dr,shock_matrix,1);

plot(linspace(1,200,200), y2(2,:), 'r.', LineWidth=2)
hold on
plot(linspace(1,200,200), oo_.SmoothedVariables.c2, 'b-', LineWidth=2)

% Assume that we want to change the last shocks to be zero:
shock_matrix(end-100:end,strmatch('e1',M_.exo_names,'exact')) = 0;

% Simulate using equilibrium policy functions:
y2 = simult_(M_,options_,initial_condition_states,oo_.dr,shock_matrix,1);

% plot:

plot(linspace(1,200,200), y2(2,:), 'r.', LineWidth=2)
hold on
plot(linspace(1,200,200), oo_.SmoothedVariables.c2, 'b-', LineWidth=2)
