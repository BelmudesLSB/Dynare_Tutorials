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
M_.fname = 'TwocountryEst';
M_.dynare_version = '6.0';
oo_.dynare_version = '6.0';
options_.dynare_version = '6.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'e1'};
M_.exo_names_tex(1) = {'e1'};
M_.exo_names_long(1) = {'e1'};
M_.exo_names(2) = {'e2'};
M_.exo_names_tex(2) = {'e2'};
M_.exo_names_long(2) = {'e2'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'c1'};
M_.endo_names_tex(1) = {'c1'};
M_.endo_names_long(1) = {'c1'};
M_.endo_names(2) = {'c2'};
M_.endo_names_tex(2) = {'c2'};
M_.endo_names_long(2) = {'c2'};
M_.endo_names(3) = {'k1'};
M_.endo_names_tex(3) = {'k1'};
M_.endo_names_long(3) = {'k1'};
M_.endo_names(4) = {'k2'};
M_.endo_names_tex(4) = {'k2'};
M_.endo_names_long(4) = {'k2'};
M_.endo_names(5) = {'a1'};
M_.endo_names_tex(5) = {'a1'};
M_.endo_names_long(5) = {'a1'};
M_.endo_names(6) = {'a2'};
M_.endo_names_tex(6) = {'a2'};
M_.endo_names_long(6) = {'a2'};
M_.endo_names(7) = {'y1'};
M_.endo_names_tex(7) = {'y1'};
M_.endo_names_long(7) = {'y1'};
M_.endo_names(8) = {'y2'};
M_.endo_names_tex(8) = {'y2'};
M_.endo_names_long(8) = {'y2'};
M_.endo_partitions = struct();
M_.param_names = cell(5,1);
M_.param_names_tex = cell(5,1);
M_.param_names_long = cell(5,1);
M_.param_names(1) = {'gamma'};
M_.param_names_tex(1) = {'gamma'};
M_.param_names_long(1) = {'gamma'};
M_.param_names(2) = {'delta'};
M_.param_names_tex(2) = {'delta'};
M_.param_names_long(2) = {'delta'};
M_.param_names(3) = {'alpha'};
M_.param_names_tex(3) = {'alpha'};
M_.param_names_long(3) = {'alpha'};
M_.param_names(4) = {'beta'};
M_.param_names_tex(4) = {'beta'};
M_.param_names_long(4) = {'beta'};
M_.param_names(5) = {'rho'};
M_.param_names_tex(5) = {'rho'};
M_.param_names_long(5) = {'rho'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 8;
M_.param_nbr = 5;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
options_.varobs = cell(2, 1);
options_.varobs(1)  = {'y1'};
options_.varobs(2)  = {'y2'};
options_.varobs_id = [ 7 8  ];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
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
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [2 3 4 7 8];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 8;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 13;
 0 6 14;
 1 7 0;
 2 8 0;
 3 9 15;
 4 10 16;
 0 11 0;
 0 12 0;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [8; 12; 2; 0; ];
M_.equations_tags = {
  1 , 'name' , 'c1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'a1' ;
  6 , 'name' , 'a2' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
};
M_.mapping.c1.eqidx = [1 2 4 ];
M_.mapping.c2.eqidx = [1 3 4 ];
M_.mapping.k1.eqidx = [2 4 7 ];
M_.mapping.k2.eqidx = [3 4 8 ];
M_.mapping.a1.eqidx = [2 4 5 7 ];
M_.mapping.a2.eqidx = [3 4 6 8 ];
M_.mapping.y1.eqidx = [7 ];
M_.mapping.y2.eqidx = [8 ];
M_.mapping.e1.eqidx = [5 ];
M_.mapping.e2.eqidx = [6 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 2;
M_.block_structure.block(1).mfs = 2;
M_.block_structure.block(1).equation = [ 5 6];
M_.block_structure.block(1).variable = [ 5 6];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 4;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 4 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 4;
M_.block_structure.block(2).mfs = 4;
M_.block_structure.block(2).equation = [ 3 2 4 1];
M_.block_structure.block(2).variable = [ 4 3 1 2];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 14;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 2 5 6 7 8 11 12 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 8];
M_.block_structure.block(3).variable = [ 8];
M_.block_structure.block(3).is_linear = false;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(4).Simulation_Type = 3;
M_.block_structure.block(4).endo_nbr = 1;
M_.block_structure.block(4).mfs = 1;
M_.block_structure.block(4).equation = [ 7];
M_.block_structure.block(4).variable = [ 7];
M_.block_structure.block(4).is_linear = false;
M_.block_structure.block(4).NNZDerivatives = 1;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([3 3 1 3 2 3 2 3 4 1 3 4 2 1 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 2 5 5 6 6 7 7 7 8 8 8 11 12 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 2 3 3 3 5 7 10 13 13 13 14 15 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.variable_reordered = [ 5 6 4 3 1 2 8 7];
M_.block_structure.equation_reordered = [ 5 6 3 2 4 1 8 7];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 4 3;
 4 4;
 5 5;
 6 6;
 7 3;
 8 4;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 2;
 2 1;
 2 3;
 3 2;
 3 4;
 4 1;
 4 2;
 4 3;
 4 4;
 4 5;
 4 6;
 5 5;
 6 6;
 7 5;
 7 7;
 8 6;
 8 8;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 1;
 2 5;
 3 2;
 3 6;
];
M_.block_structure.dyn_tmp_nbr = 20;
M_.state_var = [5 6 4 3 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(5, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [30; 42; -1; ];
M_.dynamic_g1_sparse_rowval = int32([4 7 4 8 5 6 1 2 4 1 3 4 2 4 3 4 4 5 7 4 6 8 7 8 2 3 2 3 5 6 ]);
M_.dynamic_g1_sparse_colval = int32([3 3 4 4 5 6 9 9 9 10 10 10 11 11 12 12 13 13 13 14 14 14 15 16 17 18 21 22 25 26 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 3 5 6 7 7 7 10 13 15 17 20 23 24 25 26 27 27 27 28 29 29 29 30 31 ]);
M_.dynamic_g2_sparse_indices = int32([2 9 9 ;
2 17 17 ;
2 17 11 ;
2 17 21 ;
2 11 11 ;
2 11 21 ;
2 21 21 ;
3 10 10 ;
3 18 18 ;
3 18 12 ;
3 18 22 ;
3 12 12 ;
3 12 22 ;
3 22 22 ;
4 9 9 ;
4 10 10 ;
4 3 3 ;
4 3 13 ;
4 11 11 ;
4 4 4 ;
4 4 14 ;
4 12 12 ;
4 13 13 ;
4 14 14 ;
7 3 3 ;
7 3 13 ;
7 13 13 ;
7 15 15 ;
8 4 4 ;
8 4 14 ;
8 14 14 ;
8 16 16 ;
]);
M_.lhs = {
'c1'; 
'exp(c1)^(-gamma)'; 
'exp(c2)^(-gamma)'; 
'exp(k2)+exp(k1)+exp(c1)+exp(c2)-exp(k1(-1))*(1-delta)-(1-delta)*exp(k2(-1))'; 
'a1'; 
'a2'; 
'exp(y1)'; 
'exp(y2)'; 
};
M_.static_tmp_nbr = [8; 4; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 5];
M_.block_structure_stat.block(1).variable = [ 5];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 6];
M_.block_structure_stat.block(2).variable = [ 6];
M_.block_structure_stat.block(3).Simulation_Type = 6;
M_.block_structure_stat.block(3).endo_nbr = 4;
M_.block_structure_stat.block(3).mfs = 4;
M_.block_structure_stat.block(3).equation = [ 3 4 1 2];
M_.block_structure_stat.block(3).variable = [ 4 2 1 3];
M_.block_structure_stat.block(4).Simulation_Type = 3;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 8];
M_.block_structure_stat.block(4).variable = [ 8];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 7];
M_.block_structure_stat.block(5).variable = [ 7];
M_.block_structure_stat.variable_reordered = [ 5 6 4 2 1 3 8 7];
M_.block_structure_stat.equation_reordered = [ 5 6 3 4 1 2 8 7];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 2 1;
 2 3;
 2 5;
 3 2;
 3 4;
 3 6;
 4 1;
 4 2;
 4 3;
 4 4;
 4 5;
 4 6;
 5 5;
 6 6;
 7 3;
 7 5;
 7 7;
 8 4;
 8 6;
 8 8;
];
M_.block_structure_stat.tmp_nbr = 16;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 2 1 2 3 2 3 4 2 4 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 1 2 2 2 3 3 3 4 4 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 3 6 9 11 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.static_g1_sparse_rowval = int32([1 2 4 1 3 4 2 4 7 3 4 8 2 4 5 7 3 4 6 8 7 8 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 5 6 6 6 6 7 8 ]);
M_.static_g1_sparse_colptr = int32([1 4 7 10 13 17 21 22 23 ]);
M_.params(1) = 2;
gamma = M_.params(1);
M_.params(2) = .05;
delta = M_.params(2);
M_.params(3) = .4;
alpha = M_.params(3);
M_.params(4) = .98;
beta = M_.params(4);
M_.params(5) = .85;
rho = M_.params(5);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(7) = 1.1;
oo_.steady_state(8) = 1.1;
oo_.steady_state(3) = 2.8;
oo_.steady_state(4) = 2.8;
oo_.steady_state(1) = .8;
oo_.steady_state(2) = .8;
oo_.steady_state(5) = 0;
oo_.steady_state(6) = 0;
oo_.exo_steady_state(1) = 0;
oo_.exo_steady_state(2) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (.08)^2;
M_.Sigma_e(2, 2) = (.08)^2;
steady;
if isempty(estim_params_)
    estim_params_.var_exo = zeros(0, 10);
    estim_params_.var_endo = zeros(0, 10);
    estim_params_.corrx = zeros(0, 11);
    estim_params_.corrn = zeros(0, 11);
    estim_params_.param_vals = zeros(0, 10);
end
if ~isempty(find(estim_params_.param_vals(:,1)==3))
    error('Parameter alpha has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 3, .35, .05, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==5))
    error('Parameter rho has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 3, .8, .05, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==1))
    error('The standard deviation for e1 has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, .09, 10, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==2))
    error('The standard deviation for e2 has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 2, NaN, (-Inf), Inf, 4, .09, 10, NaN, NaN, NaN ];
options_.datafile = 'simu2';
options_.mh_jscale = .7;
options_.mh_replic = 1200;
options_.nodiagnostic = true;
options_.order = 1;
var_list_ = {};
oo_recursive_=dynare_estimation(var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'TwocountryEst_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
