%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'Us_model';
M_.dynare_version = '6.0';
oo_.dynare_version = '6.0';
options_.dynare_version = '6.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(5,1);
M_.exo_names_tex = cell(5,1);
M_.exo_names_long = cell(5,1);
M_.exo_names(1) = {'eps_pi'};
M_.exo_names_tex(1) = {'{\epsilon^{\pi}_t}'};
M_.exo_names_long(1) = {'Short-term inflation shock'};
M_.exo_names(2) = {'eps_pi_target'};
M_.exo_names_tex(2) = {'{\epsilon^{\bar{\pi}}}'};
M_.exo_names_long(2) = {'Inflation target shock'};
M_.exo_names(3) = {'eps_r_n'};
M_.exo_names_tex(3) = {'{\epsilon^{r^n_t}}'};
M_.exo_names_long(3) = {'Natural interest rate shock'};
M_.exo_names(4) = {'eps_i'};
M_.exo_names_tex(4) = {'{\epsilon^{i^*}_t}'};
M_.exo_names_long(4) = {'Monetary policy shock'};
M_.exo_names(5) = {'eps_y'};
M_.exo_names_tex(5) = {'{\epsilon^{y}_t}'};
M_.exo_names_long(5) = {'Preferences shock'};
M_.endo_names = cell(11,1);
M_.endo_names_tex = cell(11,1);
M_.endo_names_long = cell(11,1);
M_.endo_names(1) = {'pi'};
M_.endo_names_tex(1) = {'{\pi_t}'};
M_.endo_names_long(1) = {'CPI quarterly seasonally adjusted annualized'};
M_.endo_names(2) = {'pi12m'};
M_.endo_names_tex(2) = {'{\pi^{12m}_t}'};
M_.endo_names_long(2) = {'CPI 12 months'};
M_.endo_names(3) = {'pi_target'};
M_.endo_names_tex(3) = {'{\bar{\pi}_t}'};
M_.endo_names_long(3) = {'Inflation target perceived by agents'};
M_.endo_names(4) = {'r_n'};
M_.endo_names_tex(4) = {'{r^N_t}'};
M_.endo_names_long(4) = {'Natural real interest rate'};
M_.endo_names(5) = {'i_star'};
M_.endo_names_tex(5) = {'{i^*_t}'};
M_.endo_names_long(5) = {'Fed-funds nominal rate'};
M_.endo_names(6) = {'i_star_adj'};
M_.endo_names_tex(6) = {'i\_star\_adj'};
M_.endo_names_long(6) = {'i_star_adj'};
M_.endo_names(7) = {'s'};
M_.endo_names_tex(7) = {'{s_t}'};
M_.endo_names_long(7) = {'Target-deviation from Central Bank'};
M_.endo_names(8) = {'y'};
M_.endo_names_tex(8) = {'{y_t}'};
M_.endo_names_long(8) = {'Output-gap'};
M_.endo_names(9) = {'v'};
M_.endo_names_tex(9) = {'{v_t}'};
M_.endo_names_long(9) = {'Inertia and price indexation'};
M_.endo_names(10) = {'AUX_ENDO_LAG_0_1'};
M_.endo_names_tex(10) = {'AUX\_ENDO\_LAG\_0\_1'};
M_.endo_names_long(10) = {'AUX_ENDO_LAG_0_1'};
M_.endo_names(11) = {'AUX_ENDO_LAG_0_2'};
M_.endo_names_tex(11) = {'AUX\_ENDO\_LAG\_0\_2'};
M_.endo_names_long(11) = {'AUX_ENDO_LAG_0_2'};
M_.endo_partitions = struct();
M_.param_names = cell(16,1);
M_.param_names_tex = cell(16,1);
M_.param_names_long = cell(16,1);
M_.param_names(1) = {'betta'};
M_.param_names_tex(1) = {'{\betta}'};
M_.param_names_long(1) = {'Intertemporal discount'};
M_.param_names(2) = {'h'};
M_.param_names_tex(2) = {'{h}'};
M_.param_names_long(2) = {'Habit-formation'};
M_.param_names(3) = {'sigma'};
M_.param_names_tex(3) = {'{\sigma}'};
M_.param_names_long(3) = {'IES'};
M_.param_names(4) = {'theta'};
M_.param_names_tex(4) = {'{\theta}'};
M_.param_names_long(4) = {'Price reset probability'};
M_.param_names(5) = {'omega'};
M_.param_names_tex(5) = {'{\omega}'};
M_.param_names_long(5) = {'Price indexation'};
M_.param_names(6) = {'gamma'};
M_.param_names_tex(6) = {'{\gamma}'};
M_.param_names_long(6) = {'Monetary policy inertia'};
M_.param_names(7) = {'phi_pi'};
M_.param_names_tex(7) = {'{\phi_\pi}'};
M_.param_names_long(7) = {'Monetary policy reaction to inflation above target'};
M_.param_names(8) = {'phi_y'};
M_.param_names_tex(8) = {'{\phi_y}'};
M_.param_names_long(8) = {'Monetary policy reaction to output-gap'};
M_.param_names(9) = {'rho_r_n'};
M_.param_names_tex(9) = {'{\rho_{r^n}}'};
M_.param_names_long(9) = {'Neutral rate persistance'};
M_.param_names(10) = {'pi_target_ss'};
M_.param_names_tex(10) = {'{\Bar{\pi}_{ss}}'};
M_.param_names_long(10) = {'Announced inflation target by monetary authority'};
M_.param_names(11) = {'sigma_pi'};
M_.param_names_tex(11) = {'{\sigma_{\pi}}'};
M_.param_names_long(11) = {'Short-term inflation shock volatility'};
M_.param_names(12) = {'sigma_i'};
M_.param_names_tex(12) = {'{\sigma_i}'};
M_.param_names_long(12) = {'Monetary policy shock volatility'};
M_.param_names(13) = {'sigma_pi_target'};
M_.param_names_tex(13) = {'{\sigma_{\bar{\pi}}}'};
M_.param_names_long(13) = {'Inflation target volatility shock'};
M_.param_names(14) = {'sigma_r_n'};
M_.param_names_tex(14) = {'{\sigma_{r^n}}'};
M_.param_names_long(14) = {'Neutral rate volatility'};
M_.param_names(15) = {'sigma_y'};
M_.param_names_tex(15) = {'{\sigma_y}'};
M_.param_names_long(15) = {'Preferences shock volatility'};
M_.param_names(16) = {'rho'};
M_.param_names_tex(16) = {'{\rho}'};
M_.param_names_long(16) = {'Feedback of inflation target changes'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 11;
M_.param_nbr = 16;
M_.orig_endo_nbr = 9;
M_.aux_vars(1).endo_index = 10;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 1;
M_.aux_vars(1).orig_lead_lag = -1;
M_.aux_vars(1).orig_expr = 'pi(-1)';
M_.aux_vars(2).endo_index = 11;
M_.aux_vars(2).type = 1;
M_.aux_vars(2).orig_index = 1;
M_.aux_vars(2).orig_lead_lag = -2;
M_.aux_vars(2).orig_expr = 'AUX_ENDO_LAG_0_1(-1)';
options_.varobs = cell(4, 1);
options_.varobs(1)  = {'pi'};
options_.varobs(2)  = {'y'};
options_.varobs(3)  = {'i_star_adj'};
options_.varobs(4)  = {'r_n'};
options_.varobs_id = [ 1 8 6 4  ];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 11;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 3;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 3;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 3;
M_.lead_lag_incidence = [
 1 8 19;
 0 9 0;
 0 10 0;
 2 11 0;
 3 12 0;
 0 13 0;
 4 14 0;
 5 15 20;
 0 16 21;
 6 17 0;
 7 18 0;]';
M_.nstatic = 3;
M_.nfwrd   = 1;
M_.npred   = 5;
M_.nboth   = 2;
M_.nsfwrd   = 3;
M_.nspred   = 7;
M_.ndynamic   = 8;
M_.dynamic_tmp_nbr = [1; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'v' ;
  3 , 'name' , 'y' ;
  4 , 'name' , 'i_star' ;
  5 , 'name' , 'r_n' ;
  6 , 'name' , 'pi_target' ;
  7 , 'name' , 's' ;
  8 , 'name' , 'pi12m' ;
  9 , 'name' , 'i_star_adj' ;
};
M_.mapping.pi.eqidx = [1 2 3 8 ];
M_.mapping.pi12m.eqidx = [4 8 ];
M_.mapping.pi_target.eqidx = [2 4 6 ];
M_.mapping.r_n.eqidx = [3 4 5 ];
M_.mapping.i_star.eqidx = [3 4 9 ];
M_.mapping.i_star_adj.eqidx = [9 ];
M_.mapping.s.eqidx = [6 7 ];
M_.mapping.y.eqidx = [1 3 4 ];
M_.mapping.v.eqidx = [1 2 ];
M_.mapping.eps_pi.eqidx = [1 ];
M_.mapping.eps_pi_target.eqidx = [7 ];
M_.mapping.eps_r_n.eqidx = [5 ];
M_.mapping.eps_i.eqidx = [4 ];
M_.mapping.eps_y.eqidx = [3 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 3;
M_.block_structure.block(1).mfs = 3;
M_.block_structure.block(1).equation = [ 5 7 6];
M_.block_structure.block(1).variable = [ 4 7 3];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 6;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 4 5 6 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 7;
M_.block_structure.block(2).mfs = 7;
M_.block_structure.block(2).equation = [ 8 4 11 10 1 3 2];
M_.block_structure.block(2).variable = [ 2 5 11 10 1 8 9];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 25;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [2 3 4 5 6 8 9 10 11 12 13 14 19 20 21 ];
M_.block_structure.block(3).Simulation_Type = 1;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 9];
M_.block_structure.block(3).variable = [ 6];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [2 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 1 1 3 1 4 7 6 1 2 2 6 3 4 1 5 2 5 6 5 7 5 6 6 5 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([2 3 4 4 5 5 5 6 8 8 9 9 10 11 12 12 13 13 13 14 14 19 19 20 21 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 2 3 5 8 9 9 11 13 14 15 17 20 22 22 22 22 22 24 25 26 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([]);
M_.block_structure.block(3).g1_sparse_colval = int32([]);
M_.block_structure.block(3).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 4 7 3 2 5 11 10 1 8 9 6];
M_.block_structure.equation_reordered = [ 5 7 6 8 4 11 10 1 3 2 9];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 2 1;
 3 8;
 4 5;
 5 4;
 7 7;
 8 1;
 8 10;
 8 11;
 10 1;
 11 10;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 8;
 1 9;
 2 3;
 2 9;
 3 4;
 3 5;
 3 8;
 4 2;
 4 3;
 4 4;
 4 5;
 4 8;
 5 4;
 6 3;
 6 7;
 7 7;
 8 1;
 8 2;
 9 5;
 9 6;
 10 10;
 11 11;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 9;
 3 1;
 3 8;
];
M_.block_structure.dyn_tmp_nbr = 0;
M_.state_var = [4 7 5 11 10 1 8 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(16, 1);
M_.endo_trends = struct('deflator', cell(11, 1), 'log_deflator', cell(11, 1), 'growth_factor', cell(11, 1), 'log_growth_factor', cell(11, 1));
M_.NNZDerivatives = [42; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 8 10 5 4 7 3 8 11 8 1 8 4 8 2 4 6 3 4 5 3 4 9 9 6 7 1 3 4 1 2 10 11 1 3 3 1 1 7 5 4 3 ]);
M_.dynamic_g1_sparse_colval = int32([1 1 1 4 5 7 8 10 10 11 12 12 13 13 14 14 14 15 15 15 16 16 16 17 18 18 19 19 19 20 20 21 22 23 23 30 31 34 35 36 37 38 ]);
M_.dynamic_g1_sparse_colptr = int32([1 4 4 4 5 6 6 7 8 8 10 11 13 15 18 21 24 25 27 30 32 33 34 36 36 36 36 36 36 36 37 38 38 38 39 40 41 42 43 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'pi-v'; 
'v'; 
'y'; 
'i_star'; 
'r_n'; 
'pi_target'; 
's'; 
'pi12m'; 
'i_star_adj'; 
'AUX_ENDO_LAG_0_1'; 
'AUX_ENDO_LAG_0_2'; 
};
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 5];
M_.block_structure_stat.block(1).variable = [ 4];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 7];
M_.block_structure_stat.block(2).variable = [ 7];
M_.block_structure_stat.block(3).Simulation_Type = 1;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 6];
M_.block_structure_stat.block(3).variable = [ 3];
M_.block_structure_stat.block(4).Simulation_Type = 6;
M_.block_structure_stat.block(4).endo_nbr = 7;
M_.block_structure_stat.block(4).mfs = 7;
M_.block_structure_stat.block(4).equation = [ 4 1 3 2 8 11 10];
M_.block_structure_stat.block(4).variable = [ 5 8 1 9 2 11 10];
M_.block_structure_stat.block(5).Simulation_Type = 1;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 9];
M_.block_structure_stat.block(5).variable = [ 6];
M_.block_structure_stat.variable_reordered = [ 4 7 3 5 8 1 9 2 11 10 6];
M_.block_structure_stat.equation_reordered = [ 5 7 6 4 1 3 2 8 11 10 9];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 8;
 1 9;
 2 1;
 2 3;
 2 9;
 3 1;
 3 4;
 3 5;
 3 8;
 4 2;
 4 3;
 4 4;
 4 5;
 4 8;
 5 4;
 6 3;
 6 7;
 7 7;
 8 1;
 8 2;
 8 10;
 8 11;
 9 5;
 9 6;
 10 1;
 10 10;
 11 10;
 11 11;
];
M_.block_structure_stat.tmp_nbr = 0;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 3 1 2 3 2 3 4 5 7 2 4 1 5 5 6 5 6 7 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 1 2 2 2 3 3 3 3 3 4 4 5 5 6 6 7 7 7 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 3 6 11 13 15 17 20 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([1 2 3 8 10 4 8 2 4 6 3 4 5 3 4 9 9 6 7 1 3 4 1 2 8 10 11 8 11 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 1 2 2 3 3 3 4 4 4 5 5 5 6 7 7 8 8 8 9 9 10 10 10 11 11 ]);
M_.static_g1_sparse_colptr = int32([1 6 8 11 14 17 18 20 23 25 28 30 ]);
M_.params(1) = 0.99;
betta = M_.params(1);
M_.params(3) = 2;
sigma = M_.params(3);
M_.params(2) = 0.6;
h = M_.params(2);
M_.params(5) = 0.3;
omega = M_.params(5);
M_.params(6) = 0.75;
gamma = M_.params(6);
M_.params(4) = 0.75;
theta = M_.params(4);
M_.params(7) = 2;
phi_pi = M_.params(7);
M_.params(8) = 0.125;
phi_y = M_.params(8);
M_.params(16) = 0.99;
rho = M_.params(16);
M_.params(9) = 0.97;
rho_r_n = M_.params(9);
M_.params(10) = 2;
pi_target_ss = M_.params(10);
M_.params(15) = 1;
sigma_y = M_.params(15);
M_.params(11) = 1;
sigma_pi = M_.params(11);
M_.params(12) = 1;
sigma_i = M_.params(12);
M_.params(14) = 1;
sigma_r_n = M_.params(14);
M_.params(13) = 0.25;
sigma_pi_target = M_.params(13);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
M_.Sigma_e(3, 3) = 1;
M_.Sigma_e(4, 4) = 1;
M_.Sigma_e(5, 5) = 1;
options_.datafile = 'df';
options_.filtered_vars = true;
options_.first_obs = 259;
options_.parameter_set = 'calibration';
options_.xls_range = 'B1:AG2000';
options_.xls_sheet = 'Sheet1';
var_list_ = {};
options_.smoother = true;
options_.order = 1;
[oo_, M_, options_, bayestopt_] = evaluate_smoother(options_.parameter_set, var_list_, M_, oo_, options_, bayestopt_, estim_params_);
options_smoother2histval = struct();
options_smoother2histval.outfile = 'initial_conditions_for_forecasting';
smoother2histval(options_smoother2histval);
%
% HISTVAL_FILE statement
%
options_.histval_file = true;
options_histvalf = struct();
options_histvalf.datafile = 'initial_conditions_for_forecasting';
[M_.endo_histval, M_.exo_histval, M_.exo_det_histval] = histvalf(M_, options_histvalf);
constrained_vars_ = [];
constrained_paths_ = NaN(1, 10);
constrained_vars_ = 5;
constrained_paths_(1,1)=5.33;
constrained_paths_(1,2)=5.33;
constrained_paths_(1,3)=5.33;
constrained_paths_(1,4)=5.12;
constrained_paths_(1,5)=4.85;
constrained_paths_(1,6)=4.65;
constrained_paths_(1,7)=4.35;
constrained_paths_(1,8)=4.15;
constrained_paths_(1,9)=3.85;
constrained_paths_(1,10)=3.50;
options_cond_fcst_ = struct();
options_cond_fcst_.conditional_forecast.conf_sig = 0.72;
options_cond_fcst_.controlled_varexo = {'eps_i'};
options_cond_fcst_.parameter_set = 'calibration';
options_cond_fcst_.periods = 10;
options_cond_fcst_.replic = 3000;
oo_.conditional_forecast=conditional_forecasts.run(M_,options_,oo_,bayestopt_,estim_params_,constrained_paths_, constrained_vars_,options_cond_fcst_);
var_list_ = {'i_star';'pi12m';'pi_target'};
conditional_forecasts.plot(var_list_, 10,options_,oo_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Us_model_results.mat'], 'options_mom_', '-append');
end
disp('Note: 3 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end