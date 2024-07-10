%==========================================================================
% Dynare replication file for Curdia et al. (2015)
% "Has US Monetary Policy Tracked its Efficient Rate?"
% MD 06/15
%==========================================================================
global ctry smpl

%--------------------------------------------------------------------------
% Model options
%--------------------------------------------------------------------------

smpl = 1;          % 1 = 1985Q1-2017Q1, %2 = 1985Q1-2016Q2.

%--------------------------------------------------------------------------
% Declare variables / parameters
%--------------------------------------------------------------------------

% Endogenous variables
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
re          %(12)
ie          %(13)
gya         %(14) Growth rate of output
pia         %(15) Inflation rate
iras;       %(16) Shadow interest rate

%re_1y re_5y;

% Exogenous variables
varexo
ei eu edelta egamma;

% Observed endogenous variables
varobs
gya pia iras;

% Parameters
parameters
beta omega xi eta zeta rho phipi phix pistar ra gammaa
rhodelta rhogamma rhou sigmadelta sigmagamma sigmau sigmai;

%--------------------------------------------------------------------------
% Set calibrated parameters and priors for estimated parameters
%--------------------------------------------------------------------------

% Calibrated parameters
beta = 0.99;

%get_parameters;

omega = 0.9435;
xi = 0.0004;
eta = 0.7919;
zeta = 0.4813;
rho = 0.7969;
phipi = 1.4414;
phix = 0.5110;
pistar = 2.2251;
ra = 1.6378;
gammaa = 2.2555;
rhodelta = 0.9665;
rhogamma = 0.7232;
rhou = 0.2108;
sigmadelta = 1.0209;
sigmagamma = 0.8365;
sigmau = 0.4249;
sigmai = 0.4837;

%--------------------------------------------------------------------------
% Model
%--------------------------------------------------------------------------

model;

%% Auxiliary

#gam = gammaa/400;  % This is log(gamma)
#phigammatil = exp(gam)/(exp(gam)-beta*eta);
#etagammatil = exp(gam)/(exp(gam)-eta);
#phigamma = phigammatil*etagammatil;
#etagamma = eta/exp(gam);

%% Observation equations
gya  = gammaa + 400*(y - y(-1) + gamma);
pia  = pistar + 400*pi;
iras = (ra + pistar) + 400*i;

%% IS block

% (1)
xtil = xtil(+1) - phigamma^(-1)*(i - pi(+1) - re);

% (2) Euler equation
xe   = etagamma*(y(-1) - ye(-1)) + beta*etagamma*(xe(+1) - etagamma*xe) + xtil;

% (3) Real rate
r    = i - pi(+1);

%% PC block

% (4)Philips curve
pitil = beta*pitil(+1) + xi*(omega*xe + phigamma*xtil) + u;

% (5) Inflation
pi    = zeta*pi(-1) + pitil;

%% Efficient rates
% (6) Efficient output gap
xe = y - ye;

% (7) Efficient real rate
re = gamma(+1) + delta(+1) - omega*(ye(+1)-ye);

ie = re + pi(+1);
% This equation seems to be wrong (PCB)
%phigamma*(ye - etagamma*(ye(-1) - gamma) + beta*etagamma*(ye(+1) + gamma(+1) - etagamma*ye)) = beta*etagamma/ (1-beta*etagamma)*delta(+1) - omega*ye;

% (8) Equilibrium equation in efficient model
omega*ye + phigamma*(ye - etagamma*ye(-1)) - beta*phigamma*etagamma*(ye(+1) - etagamma*ye) = phigamma*etagamma*(beta*gamma(+1) - gamma) + ((beta*etagamma)/(1-beta*etagamma))*delta(+1);

%% Policy rules
% (9) T: Taylor Rule
i = rho*i(-1) + (1-rho)*(phipi*pi + phix/4*xe) + sigmai/400*ei;
% W: Wicksellian Rule
%i = rho*i(-1) + (1-rho)*(re + phipi*pi) + sigmai/400*ei;
% T + W
%i = rho*i(-1) + (1-rho)*(re + phipi*pi + phix/4*xe) + sigmai/400*ei;

%% Shocks: (10) - (12)
delta = rhodelta*delta(-1) + sigmadelta/400*edelta;
gamma = rhogamma*gamma(-1) + sigmagamma/400*egamma;
u     = rhou*u(-1) + sigmau/400*eu;

end;

%--------------------------------------------------------------------------
% Shocks
%--------------------------------------------------------------------------

shocks;
var egamma = 1;
var edelta = 1;
var ei     = 1;
var eu     = 1;
end;

steady;

% get_parameters;

check;

stoch_simul(irf=40,order=1,periods=0,conditional_variance_decomposition=140,nograph,graph_format=pdf);
calib_smoother(datafile=data_eu_gdpd);


% % Set historical values for simulation
% histval;
% y(0)     = y2017(2);
% pi(0)    = y2017(4);
% i(0)     = y2017(6);
% u(0)     = y2017(7);
% gamma(0) = y2017(8);
% delta(0) = y2017(9);
% ye(0)    = y2017(11);
% end;
% 
% stoch_simul(order=1,periods=40,drop=0,irf=0,nograph);
% y2017 = M_.endo_histval;
% fcast2017 = simult_(y2017,oo_.dr,0*oo_.exo_simul,1);
% 
% 
% histval;
% y(0)     = y2016(2);
% pi(0)    = y2016(4);
% i(0)     = y2016(6);
% u(0)     = y2016(7);
% gamma(0) = y2016(8);
% delta(0) = y2016(9);
% ye(0)    = y2016(11);
% end;
% 
% stoch_simul(order=1,periods=44,drop=0,irf=0,nograph);
% y2016 = M_.endo_histval;
% fcast2016 = simult_(y2016,oo_.dr,0*oo_.exo_simul,1);
% 
% 
% 
% close all;
% %%
% 
% ie_afe_ss = oo_afe_.posterior_mean.parameters.ra + oo_afe_.posterior_mean.parameters.pistar;
% 
% re_afe_ss = oo_afe_.posterior_mean.parameters.ra;
% 
% % Collect smoothed estimates of ie from posterior draws
% collect_posterior_draws;
% 
% %%
% 
%     xdates = (1985:0.25:2017.5+40/4); %% update
%     
%     
%     % Arrange p5 and p95 for credible set band
%     XX = [xdates(1:131) fliplr(xdates(1:131)) ]; %% update
%     YY = [ie_afe_ss + 400*ie_p5 fliplr(ie_afe_ss + 400*ie_p95)];
%     YY_re = [re_afe_ss + 400*re_p5 fliplr(re_afe_ss + 400*re_p95)];
% 
%    % Construct natural rate in levels     
%    re_afe = re_afe_ss + oo_afe_.SmoothedVariables.re*400;
% 
% % Matrix with dates, re, re 5% and re 95%
%     re_out = [re_afe, re_afe_ss + 400*re_p5', re_afe_ss + 400*re_p95' ];
%     % Forecast from 2017Q2 onwards
%     fout2017 = [re_afe_ss+400*fcast2017(12,2:end)'];
%     % Forecast from 2016Q3 onwards
%     fout2016 = [re_afe_ss+400*fcast2016(12,2:end)']; 


