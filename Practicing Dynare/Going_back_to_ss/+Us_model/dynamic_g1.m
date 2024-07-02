function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = Us_model.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(11, 26);
g1(1,8)=1;
g1(1,19)=(-params(1));
g1(1,15)=(-((1-params(4))*(1-params(4)*params(1))/params(4)));
g1(1,16)=(-1);
g1(1,21)=params(1);
g1(1,22)=(-params(11));
g1(2,1)=(-params(5));
g1(2,10)=(-(1-params(5)));
g1(2,16)=1;
g1(3,19)=(-T(1));
g1(3,11)=(-T(1));
g1(3,12)=T(1);
g1(3,5)=(-(params(2)/(1+params(2))));
g1(3,15)=1;
g1(3,20)=(-(1/(1+params(2))));
g1(3,26)=(-params(15));
g1(4,9)=(-((1-params(6))*params(7)));
g1(4,10)=(-((1-params(6))*(1-params(7))));
g1(4,11)=(-(1-params(6)));
g1(4,3)=(-params(6));
g1(4,12)=1;
g1(4,15)=(-((1-params(6))*params(8)));
g1(4,25)=(-params(12));
g1(5,2)=(-params(9));
g1(5,11)=1;
g1(5,24)=(-params(14));
g1(6,10)=1;
g1(6,14)=(-1);
g1(7,4)=(-params(16));
g1(7,14)=1;
g1(7,23)=(-params(13));
g1(8,1)=(-0.25);
g1(8,8)=(-0.25);
g1(8,9)=1;
g1(8,6)=(-0.25);
g1(8,7)=(-0.25);
g1(9,12)=(-1);
g1(9,13)=1;
g1(10,1)=(-1);
g1(10,17)=1;
g1(11,6)=(-1);
g1(11,18)=1;

end
