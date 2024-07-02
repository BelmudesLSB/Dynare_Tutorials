var
    
    pi                 ${\pi_t}$         (long_name = 'CPI quarterly seasonally adjusted annualized')
    pi12m              ${\pi^{12m}_t}$   (long_name = 'CPI 12 months')
    pi_target          ${\bar{\pi}_t}$   (long_name = 'Inflation target perceived by agents')
    r_n                ${r^N_t}$         (long_name = 'Natural real interest rate')
    i_star             ${i^*_t}$         (long_name = 'Fed-funds nominal rate')
    i_star_adj
    s                  ${s_t}$           (long_name = 'Target-deviation from Central Bank')
    y                  ${y_t}$           (long_name = 'Output-gap')
    v                  ${v_t}$           (long_name = 'Inertia and price indexation')

;


varexo
        
    eps_pi             ${\epsilon^{\pi}_t}$        (long_name = 'Short-term inflation shock')
    eps_pi_target      ${\epsilon^{\bar{\pi}}}$    (long_name = 'Inflation target shock')
    eps_r_n            ${\epsilon^{r^n_t}}$        (long_name = 'Natural interest rate shock')
    eps_i              ${\epsilon^{i^*}_t}$        (long_name = 'Monetary policy shock')
    eps_y              ${\epsilon^{y}_t}$          (long_name = 'Preferences shock')

;


parameters

    betta              ${\betta}$                  (long_name = 'Intertemporal discount')
    h                  ${h}$                      (long_name = 'Habit-formation')
    sigma              ${\sigma}$                  (long_name = 'IES')
    theta              ${\theta}$                  (long_name = 'Price reset probability')         
    omega              ${\omega}$                  (long_name = 'Price indexation')
    gamma              ${\gamma}$                  (long_name = 'Monetary policy inertia')
    phi_pi             ${\phi_\pi}$                (long_name = 'Monetary policy reaction to inflation above target')
    phi_y              ${\phi_y}$                  (long_name = 'Monetary policy reaction to output-gap')
    rho_r_n            ${\rho_{r^n}}$              (long_name = 'Neutral rate persistance')
    pi_target_ss       ${\Bar{\pi}_{ss}}$          (long_name = 'Announced inflation target by monetary authority')
    sigma_pi           ${\sigma_{\pi}}$            (long_name = 'Short-term inflation shock volatility')
    sigma_i            ${\sigma_i}$                (long_name = 'Monetary policy shock volatility')
    sigma_pi_target    ${\sigma_{\bar{\pi}}}$      (long_name = 'Inflation target volatility shock')
    sigma_r_n          ${\sigma_{r^n}}$            (long_name = 'Neutral rate volatility')
    sigma_y            ${\sigma_y}$                 (long_name = 'Preferences shock volatility')
    rho                ${\rho}$                    (long_name = 'Feedback of inflation target changes')
;


betta                       = 0.99;
sigma                       = 2;
h                           = 0.6;
omega                       = 0.3;
gamma                       = 0.75;
theta                       = 0.75;
phi_pi                      = 2;
phi_y                       = 0.5/4;
rho                         = 0.99;
rho_r_n                     = 0.97;
pi_target_ss                = 2;

sigma_y                     = 1;
sigma_pi                    = 1;
sigma_i                     = 1;
sigma_r_n                   = 1;
sigma_pi_target             = 0.25;  

model(linear);
    
    #kappa = (1-theta) * (1 - theta * betta) / theta;
    
    pi - v = kappa * y + 
             betta * (pi(+1) - v(+1)) + 
             sigma_pi * eps_pi;

    v = omega * pi(-1) + (1-omega) * pi_target;

    y = h/(1 + h) * y(-1) + 
            1/(1 + h) * y(+1) - 
                1/sigma * (1-h)/(1+h) * (i_star - pi(+1) - r_n) + 
                        sigma_y * eps_y;

    i_star = gamma * i_star(-1) + 
                      (1-gamma) * ( r_n + 
                                    pi_target + 
                                    phi_pi * (pi12m - pi_target) + 
                                    phi_y * y ) + 
                          sigma_i * eps_i;


    r_n = rho_r_n * r_n(-1) + sigma_r_n * eps_r_n;
    pi_target = pi_target_ss + s;
    s = rho * s(-1) + sigma_pi_target * eps_pi_target;

    pi12m = (pi + pi(-1) + pi(-2) + pi(-3)) / 4;
    i_star_adj = i_star;

end;


steady_state_model;

    pi_target          = pi_target_ss;
    v                  = pi_target;
    pi                 = pi_target;
    i_star             = pi_target;
    i_star_adj         = pi_target;
    pi12m              = pi_target;

end;


steady;
check;


shocks;

    var eps_pi          = 1;
    var eps_y           = 1;
    var eps_i           = 1;
    var eps_r_n         = 1;
    var eps_pi_target   = 1;
   
end;



varobs pi
       y
       i_star_adj
       r_n
;


// ==================================================
// Calibration smoother
// ==================================================
calib_smoother( datafile = df, 
                xls_sheet = Sheet1, 
                xls_range = B1:AG2000, 
                first_obs = 259,
                parameter_set = calibration,
                filtered_vars
                %filter_decomposition,
                %filter_covariance
                %diffuse_filter,
                %diffuse_kalman_tol = 1e-4
                );



// ==================================================
// Adjusting initial conditions for forecasting
// ==================================================
smoother2histval(outfile = initial_conditions_for_forecasting);
histval_file(datafile = initial_conditions_for_forecasting);



// ==================================================
// Conditional forecast
// ==================================================
conditional_forecast_paths;


%- Trajetoria de Fed funds esperada 
    var i_star;
    periods 1,2,3,4,5,6,7,8,9,10;
    values 5.33, 5.33, 5.33, 5.12, 4.85, 4.65, 4.35, 4.15, 3.85, 3.50;


end;

conditional_forecast(
                     parameter_set = calibration,
                     controlled_varexo = (eps_i),
                     periods = 10,
                     replic = 3000,
                     conf_sig = 0.72 
                    );

plot_conditional_forecast(periods = 10) i_star pi12m pi_target;











    

    