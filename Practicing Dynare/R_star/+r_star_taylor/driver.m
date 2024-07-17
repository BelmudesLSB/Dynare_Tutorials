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
M_.fname = 'r_star_taylor';
M_.dynare_version = '6.0';
oo_.dynare_version = '6.0';
options_.dynare_version = '6.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'ei'};
M_.exo_names_tex(1) = {'ei'};
M_.exo_names_long(1) = {'ei'};
M_.exo_names(2) = {'eu'};
M_.exo_names_tex(2) = {'eu'};
M_.exo_names_long(2) = {'eu'};
M_.exo_names(3) = {'edelta'};
M_.exo_names_tex(3) = {'edelta'};
M_.exo_names_long(3) = {'edelta'};
M_.exo_names(4) = {'egamma'};
M_.exo_names_tex(4) = {'egamma'};
M_.exo_names_long(4) = {'egamma'};
M_.endo_names = cell(16,1);
M_.endo_names_tex = cell(16,1);
M_.endo_names_long = cell(16,1);
M_.endo_names(1) = {'xtil'};
M_.endo_names_tex(1) = {'xtil'};
M_.endo_names_long(1) = {'xtil'};
M_.endo_names(2) = {'y'};
M_.endo_names_tex(2) = {'y'};
M_.endo_names_long(2) = {'y'};
M_.endo_names(3) = {'pitil'};
M_.endo_names_tex(3) = {'pitil'};
M_.endo_names_long(3) = {'pitil'};
M_.endo_names(4) = {'pi'};
M_.endo_names_tex(4) = {'pi'};
M_.endo_names_long(4) = {'pi'};
M_.endo_names(5) = {'r'};
M_.endo_names_tex(5) = {'r'};
M_.endo_names_long(5) = {'r'};
M_.endo_names(6) = {'i'};
M_.endo_names_tex(6) = {'i'};
M_.endo_names_long(6) = {'i'};
M_.endo_names(7) = {'u'};
M_.endo_names_tex(7) = {'u'};
M_.endo_names_long(7) = {'u'};
M_.endo_names(8) = {'gamma'};
M_.endo_names_tex(8) = {'gamma'};
M_.endo_names_long(8) = {'gamma'};
M_.endo_names(9) = {'delta'};
M_.endo_names_tex(9) = {'delta'};
M_.endo_names_long(9) = {'delta'};
M_.endo_names(10) = {'xe'};
M_.endo_names_tex(10) = {'xe'};
M_.endo_names_long(10) = {'xe'};
M_.endo_names(11) = {'ye'};
M_.endo_names_tex(11) = {'ye'};
M_.endo_names_long(11) = {'ye'};
M_.endo_names(12) = {'re'};
M_.endo_names_tex(12) = {'re'};
M_.endo_names_long(12) = {'re'};
M_.endo_names(13) = {'ie'};
M_.endo_names_tex(13) = {'ie'};
M_.endo_names_long(13) = {'ie'};
M_.endo_names(14) = {'gya'};
M_.endo_names_tex(14) = {'gya'};
M_.endo_names_long(14) = {'gya'};
M_.endo_names(15) = {'pia'};
M_.endo_names_tex(15) = {'pia'};
M_.endo_names_long(15) = {'pia'};
M_.endo_names(16) = {'iras'};
M_.endo_names_tex(16) = {'iras'};
M_.endo_names_long(16) = {'iras'};
M_.endo_partitions = struct();
M_.param_names = cell(18,1);
M_.param_names_tex = cell(18,1);
M_.param_names_long = cell(18,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'omega'};
M_.param_names_tex(2) = {'omega'};
M_.param_names_long(2) = {'omega'};
M_.param_names(3) = {'xi'};
M_.param_names_tex(3) = {'xi'};
M_.param_names_long(3) = {'xi'};
M_.param_names(4) = {'eta'};
M_.param_names_tex(4) = {'eta'};
M_.param_names_long(4) = {'eta'};
M_.param_names(5) = {'zeta'};
M_.param_names_tex(5) = {'zeta'};
M_.param_names_long(5) = {'zeta'};
M_.param_names(6) = {'rho'};
M_.param_names_tex(6) = {'rho'};
M_.param_names_long(6) = {'rho'};
M_.param_names(7) = {'phipi'};
M_.param_names_tex(7) = {'phipi'};
M_.param_names_long(7) = {'phipi'};
M_.param_names(8) = {'phix'};
M_.param_names_tex(8) = {'phix'};
M_.param_names_long(8) = {'phix'};
M_.param_names(9) = {'pistar'};
M_.param_names_tex(9) = {'pistar'};
M_.param_names_long(9) = {'pistar'};
M_.param_names(10) = {'ra'};
M_.param_names_tex(10) = {'ra'};
M_.param_names_long(10) = {'ra'};
M_.param_names(11) = {'gammaa'};
M_.param_names_tex(11) = {'gammaa'};
M_.param_names_long(11) = {'gammaa'};
M_.param_names(12) = {'rhodelta'};
M_.param_names_tex(12) = {'rhodelta'};
M_.param_names_long(12) = {'rhodelta'};
M_.param_names(13) = {'rhogamma'};
M_.param_names_tex(13) = {'rhogamma'};
M_.param_names_long(13) = {'rhogamma'};
M_.param_names(14) = {'rhou'};
M_.param_names_tex(14) = {'rhou'};
M_.param_names_long(14) = {'rhou'};
M_.param_names(15) = {'sigmadelta'};
M_.param_names_tex(15) = {'sigmadelta'};
M_.param_names_long(15) = {'sigmadelta'};
M_.param_names(16) = {'sigmagamma'};
M_.param_names_tex(16) = {'sigmagamma'};
M_.param_names_long(16) = {'sigmagamma'};
M_.param_names(17) = {'sigmau'};
M_.param_names_tex(17) = {'sigmau'};
M_.param_names_long(17) = {'sigmau'};
M_.param_names(18) = {'sigmai'};
M_.param_names_tex(18) = {'sigmai'};
M_.param_names_long(18) = {'sigmai'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 16;
M_.param_nbr = 18;
M_.orig_endo_nbr = 16;
M_.aux_vars = [];
options_.varobs = cell(3, 1);
options_.varobs(1)  = {'gya'};
options_.varobs(2)  = {'pia'};
options_.varobs(3)  = {'iras'};
options_.varobs_id = [ 14 15 16  ];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
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
M_.eq_nbr = 16;
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
 0 8 24;
 1 9 0;
 0 10 25;
 2 11 26;
 0 12 0;
 3 13 0;
 4 14 0;
 5 15 27;
 6 16 28;
 0 17 29;
 7 18 30;
 0 19 0;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;]';
M_.nstatic = 6;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 4;
M_.nsfwrd   = 7;
M_.nspred   = 7;
M_.ndynamic   = 10;
M_.dynamic_tmp_nbr = [4; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'gya' ;
  2 , 'name' , 'pia' ;
  3 , 'name' , 'iras' ;
  4 , 'name' , 'xtil' ;
  5 , 'name' , 'xe' ;
  6 , 'name' , 'r' ;
  7 , 'name' , 'pitil' ;
  8 , 'name' , 'pi' ;
  9 , 'name' , '9' ;
  10 , 'name' , 're' ;
  11 , 'name' , 'ie' ;
  12 , 'name' , '12' ;
  13 , 'name' , 'i' ;
  14 , 'name' , 'delta' ;
  15 , 'name' , 'gamma' ;
  16 , 'name' , 'u' ;
};
M_.mapping.xtil.eqidx = [4 5 7 ];
M_.mapping.y.eqidx = [1 5 9 ];
M_.mapping.pitil.eqidx = [7 8 ];
M_.mapping.pi.eqidx = [2 4 6 8 11 13 ];
M_.mapping.r.eqidx = [6 ];
M_.mapping.i.eqidx = [3 4 6 13 ];
M_.mapping.u.eqidx = [7 16 ];
M_.mapping.gamma.eqidx = [1 10 12 15 ];
M_.mapping.delta.eqidx = [10 12 14 ];
M_.mapping.xe.eqidx = [5 7 9 13 ];
M_.mapping.ye.eqidx = [5 9 10 12 ];
M_.mapping.re.eqidx = [4 10 11 ];
M_.mapping.ie.eqidx = [11 ];
M_.mapping.gya.eqidx = [1 ];
M_.mapping.pia.eqidx = [2 ];
M_.mapping.iras.eqidx = [3 ];
M_.mapping.ei.eqidx = [13 ];
M_.mapping.eu.eqidx = [16 ];
M_.mapping.edelta.eqidx = [14 ];
M_.mapping.egamma.eqidx = [15 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 3;
M_.block_structure.block(1).mfs = 3;
M_.block_structure.block(1).equation = [ 14 15 16];
M_.block_structure.block(1).variable = [ 9 8 7];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 6;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 4 5 6 ];
M_.block_structure.block(2).Simulation_Type = 5;
M_.block_structure.block(2).endo_nbr = 1;
M_.block_structure.block(2).mfs = 1;
M_.block_structure.block(2).equation = [ 12];
M_.block_structure.block(2).variable = [ 11];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 3;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 2 3 ];
M_.block_structure.block(3).Simulation_Type = 1;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 10];
M_.block_structure.block(3).variable = [ 12];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [2 ];
M_.block_structure.block(4).Simulation_Type = 8;
M_.block_structure.block(4).endo_nbr = 6;
M_.block_structure.block(4).mfs = 6;
M_.block_structure.block(4).equation = [ 9 4 13 7 8 5];
M_.block_structure.block(4).variable = [ 2 6 4 10 3 1];
M_.block_structure.block(4).is_linear = true;
M_.block_structure.block(4).NNZDerivatives = 21;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [1 2 3 7 8 9 10 11 12 15 16 17 18 ];
M_.block_structure.block(5).Simulation_Type = 1;
M_.block_structure.block(5).endo_nbr = 5;
M_.block_structure.block(5).mfs = 5;
M_.block_structure.block(5).equation = [ 2 3 1 11 6];
M_.block_structure.block(5).variable = [ 15 16 14 13 5];
M_.block_structure.block(5).is_linear = true;
M_.block_structure.block(5).NNZDerivatives = 5;
M_.block_structure.block(5).bytecode_jacob_cols_to_sparse = [6 7 8 9 10 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 1 1 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 2 3 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 2 3 4 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([]);
M_.block_structure.block(3).g1_sparse_colval = int32([]);
M_.block_structure.block(3).g1_sparse_colptr = int32([]);
M_.block_structure.block(4).g1_sparse_rowval = int32([6 3 5 1 2 3 3 5 1 3 4 6 4 5 2 4 6 2 6 4 2 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([1 2 3 7 8 8 9 9 10 10 10 10 11 11 12 12 12 15 16 17 18 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 2 3 4 4 4 4 5 7 9 13 15 18 18 18 19 20 21 22 ]);
M_.block_structure.block(5).g1_sparse_rowval = int32([]);
M_.block_structure.block(5).g1_sparse_colval = int32([]);
M_.block_structure.block(5).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 9 8 7 11 12 2 6 4 10 3 1 15 16 14 13 5];
M_.block_structure.equation_reordered = [ 14 15 16 12 10 9 4 13 7 8 5 2 3 1 11 6];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 2;
 5 2;
 5 11;
 8 4;
 12 11;
 13 6;
 14 9;
 15 8;
 16 7;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 2;
 1 8;
 1 14;
 2 4;
 2 15;
 3 6;
 3 16;
 4 1;
 4 6;
 4 12;
 5 1;
 5 10;
 6 5;
 6 6;
 7 1;
 7 3;
 7 7;
 7 10;
 8 3;
 8 4;
 9 2;
 9 10;
 9 11;
 10 11;
 10 12;
 11 12;
 11 13;
 12 8;
 12 11;
 13 4;
 13 6;
 13 10;
 14 9;
 15 8;
 16 7;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 4 1;
 4 4;
 5 10;
 6 4;
 7 3;
 10 8;
 10 9;
 10 11;
 11 4;
 12 8;
 12 9;
 12 11;
];
M_.block_structure.dyn_tmp_nbr = 3;
M_.state_var = [9 8 7 11 2 6 4 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(18, 1);
M_.endo_trends = struct('deflator', cell(16, 1), 'log_deflator', cell(16, 1), 'growth_factor', cell(16, 1), 'log_growth_factor', cell(16, 1));
M_.NNZDerivatives = [60; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([1 5 8 13 16 15 14 5 12 4 5 7 1 9 7 8 2 8 13 6 3 4 6 13 7 16 1 12 15 14 5 7 9 13 9 10 12 4 10 11 11 1 2 3 4 7 4 6 11 10 12 10 12 5 10 12 13 16 14 15 ]);
M_.dynamic_g1_sparse_colval = int32([2 2 4 6 7 8 9 11 11 17 17 17 18 18 19 19 20 20 20 21 22 22 22 22 23 23 24 24 24 25 26 26 26 26 27 27 27 28 28 28 29 30 31 32 33 35 36 36 36 40 40 41 41 42 43 43 49 50 51 52 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 3 3 4 4 5 6 7 8 8 10 10 10 10 10 10 13 15 17 20 21 25 27 30 31 35 38 41 42 43 44 45 46 46 47 50 50 50 50 52 54 55 57 57 57 57 57 57 58 59 60 61 ]);
M_.lhs = {
'gya'; 
'pia'; 
'iras'; 
'xtil'; 
'xe'; 
'r'; 
'pitil'; 
'pi'; 
'xe'; 
're'; 
'ie'; 
'omega*ye+exp(gammaa/400)/(exp(gammaa/400)-beta*eta)*exp(gammaa/400)/(exp(gammaa/400)-eta)*(ye-ye(-1)*eta/exp(gammaa/400))-eta/exp(gammaa/400)*beta*exp(gammaa/400)/(exp(gammaa/400)-beta*eta)*exp(gammaa/400)/(exp(gammaa/400)-eta)*(ye(1)-ye*eta/exp(gammaa/400))'; 
'i'; 
'delta'; 
'gamma'; 
'u'; 
};
M_.static_tmp_nbr = [4; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 14];
M_.block_structure_stat.block(1).variable = [ 9];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 15];
M_.block_structure_stat.block(2).variable = [ 8];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 16];
M_.block_structure_stat.block(3).variable = [ 7];
M_.block_structure_stat.block(4).Simulation_Type = 1;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 10];
M_.block_structure_stat.block(4).variable = [ 12];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 12];
M_.block_structure_stat.block(5).variable = [ 11];
M_.block_structure_stat.block(6).Simulation_Type = 1;
M_.block_structure_stat.block(6).endo_nbr = 1;
M_.block_structure_stat.block(6).mfs = 1;
M_.block_structure_stat.block(6).equation = [ 1];
M_.block_structure_stat.block(6).variable = [ 14];
M_.block_structure_stat.block(7).Simulation_Type = 6;
M_.block_structure_stat.block(7).endo_nbr = 6;
M_.block_structure_stat.block(7).mfs = 6;
M_.block_structure_stat.block(7).equation = [ 7 8 9 4 13 5];
M_.block_structure_stat.block(7).variable = [ 10 3 2 4 6 1];
M_.block_structure_stat.block(8).Simulation_Type = 1;
M_.block_structure_stat.block(8).endo_nbr = 4;
M_.block_structure_stat.block(8).mfs = 4;
M_.block_structure_stat.block(8).equation = [ 2 3 6 11];
M_.block_structure_stat.block(8).variable = [ 15 16 5 13];
M_.block_structure_stat.variable_reordered = [ 9 8 7 12 11 14 10 3 2 4 6 1 15 16 5 13];
M_.block_structure_stat.equation_reordered = [ 14 15 16 10 12 1 7 8 9 4 13 5 2 3 6 11];
M_.block_structure_stat.incidence.sparse_IM = [
 1 8;
 1 14;
 2 4;
 2 15;
 3 6;
 3 16;
 4 4;
 4 6;
 4 12;
 5 1;
 5 2;
 5 10;
 5 11;
 6 4;
 6 5;
 6 6;
 7 1;
 7 3;
 7 7;
 7 10;
 8 3;
 8 4;
 9 2;
 9 10;
 9 11;
 10 8;
 10 9;
 10 12;
 11 4;
 11 12;
 11 13;
 12 8;
 12 9;
 12 11;
 13 4;
 13 6;
 13 10;
 14 9;
 15 8;
 16 7;
];
M_.block_structure_stat.tmp_nbr = 3;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(6).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(6).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(6).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(7).g1_sparse_rowval = int32([1 3 5 6 1 2 3 6 2 4 5 4 5 1 6 ]);
M_.block_structure_stat.block(7).g1_sparse_colval = int32([1 1 1 1 2 2 3 3 4 4 4 5 5 6 6 ]);
M_.block_structure_stat.block(7).g1_sparse_colptr = int32([1 5 7 9 12 14 16 ]);
M_.block_structure_stat.block(8).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(8).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(8).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([5 7 5 9 7 8 2 4 6 8 11 13 6 3 4 6 13 7 16 1 10 12 15 10 12 14 5 7 9 13 5 9 12 4 10 11 11 1 2 3 ]);
M_.static_g1_sparse_colval = int32([1 1 2 2 3 3 4 4 4 4 4 4 5 6 6 6 6 7 7 8 8 8 8 9 9 9 10 10 10 10 11 11 11 12 12 12 13 14 15 16 ]);
M_.static_g1_sparse_colptr = int32([1 3 5 7 13 14 18 20 24 27 31 34 37 38 39 40 41 ]);
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.99;
omega = M_.params(2);
M_.params(3) = 0.0021;
xi = M_.params(3);
M_.params(4) = 0.62;
eta = M_.params(4);
M_.params(5) = 0.48;
zeta = M_.params(5);
M_.params(6) = 0.75;
rho = M_.params(6);
M_.params(7) = 1.14;
phipi = M_.params(7);
M_.params(8) = 1.44;
phix = M_.params(8);
M_.params(9) = 2.38;
pistar = M_.params(9);
M_.params(10) = 1.88;
ra = M_.params(10);
M_.params(11) = 2.93;
gammaa = M_.params(11);
M_.params(12) = 0.91;
rhodelta = M_.params(12);
M_.params(13) = 0.55;
rhogamma = M_.params(13);
M_.params(14) = 0.37;
rhou = M_.params(14);
M_.params(15) = 1.29;
sigmadelta = M_.params(15);
M_.params(16) = 1.88;
sigmagamma = M_.params(16);
M_.params(17) = 0.41;
sigmau = M_.params(17);
M_.params(18) = 0.33;
sigmai = M_.params(18);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
M_.Sigma_e(3, 3) = 1;
M_.Sigma_e(4, 4) = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.graph_format = {'pdf'};
options_.irf = 0;
options_.nograph = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
options_.datafile = 'data_EU_gdpd';
options_.parameter_set = 'calibration';
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
options_.periods = 50;
var_list_ = {'re'};
oo_.forecast = dyn_forecast(var_list_,M_,options_,oo_,'simul');


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'r_star_taylor_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
