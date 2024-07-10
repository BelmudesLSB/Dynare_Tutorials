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

% Exogenous variables:
varexo
ei eu edelta egamma;

% Observed endogenous variables:
varobs
gya pia iras;

% Parameters
parameters
beta omega xi eta zeta rho phipi pistar ra gammaa
rhodelta rhogamma rhou sigmadelta sigmagamma sigmau sigmai;

%--------------------------------------------------------------------------
% Set calibrated parameters 
%--------------------------------------------------------------------------
   
% Median estimates calibrated parameters:
beta = 0.99;
omega = 0.94;       
xi = 0.0303;       
eta = 0.47;         
zeta = 0.18;        
rho = 0.81;         
phipi = 1.47;      
      
pistar = 2.39;      
ra = 2.34;         
gammaa = 2.95;
      
rhodelta = 0.63;    
rhogamma = 0.97;    
rhou = 0.89;
        
sigmadelta = 0.78;  
sigmagamma = 1.07;  
sigmau = 0.29;      
sigmai = 0.31;      

%--------------------------------------------------------------------------
% Model
%--------------------------------------------------------------------------

model;

%% Auxiliary: We need to do this because they are an explicit function of the parameters that we will estimate. 
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

% (1) {Equation (2) in the paper}
xtil = xtil(+1) - phigamma^(-1)*(i - pi(+1) - re);

% (2) Euler equation {Definition introduced in the paper}
xe   = etagamma*(y(-1) - ye(-1)) + beta*etagamma*(xe(+1) - etagamma*xe) + xtil;

% (3) Real rate {Definition introduced in the paper}
r    = i - pi(+1);

%% PC block

% (4)Philips curve {Equation (3) in the paper}
pitil = beta*pitil(+1) + xi*(omega*xe + phigamma*xtil) + u;

% (5) Inflation {Definition introduced in the paper}
pi    = zeta*pi(-1) + pitil;

%% Efficient rates {Definition introduced in the paper}
% (6) Efficient output gap
xe = y - ye;

% (7) Efficient real rate {Equation (5) in the paper}
re = gamma(+1) + delta(+1) - omega*(ye(+1)-ye);

ie = re + pi(+1); //{Where is this coming from?}

% (8) Equilibrium equation in efficient model {Equation (4) in the paper}
omega*ye + phigamma*(ye - etagamma*ye(-1)) - beta*phigamma*etagamma*(ye(+1) - etagamma*ye) = phigamma*etagamma*(beta*gamma(+1) - gamma) + ((beta*etagamma)/(1-beta*etagamma))*delta(+1);

%% Policy rules
%W: Wicksellian Rule
i = rho*i(-1) + (1-rho)*(re + phipi*pi) + sigmai/400*ei;


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

stoch_simul(irf=0,order=1,graph_format=pdf, nograph);
calib_smoother(datafile=data_EU_gdpd);
%smoother2histval(outfile = initial_conditions_for_forecasting);
%histval_file(datafile = initial_conditions_for_forecasting);
%forecast(periods=50) re;
%shock_decomposition(nograph);
