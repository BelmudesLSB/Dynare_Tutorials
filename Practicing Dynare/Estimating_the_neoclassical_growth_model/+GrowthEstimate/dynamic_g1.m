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
    T = GrowthEstimate.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(4, 10);
g1(1,3)=(y(3)*T(19)*T(20)-T(4))/(y(3)*y(3));
g1(1,7)=(-(T(12)*T(24)));
g1(1,4)=(-(T(9)*T(27)));
g1(1,5)=T(20)*T(1)*T(28)/y(3);
g1(1,8)=(-(T(12)*T(32)+T(9)*T(34)));
g1(1,9)=(-(T(9)*T(10)*T(11)));
g1(2,3)=1;
g1(2,1)=(-((1-y(5))*T(15)*T(13)*T(25)));
g1(2,5)=(-((1-y(5))*T(13)*T(14)*T(29)-T(13)*T(14)*T(15)));
g1(2,6)=(-T(16));
g1(3,3)=1;
g1(3,1)=(-(1-params(2)+T(17)*exp(y(6))*T(25)));
g1(3,4)=1;
g1(3,5)=(-(exp(y(6))*T(14)*T(30)));
g1(3,6)=(-(exp(y(6))*T(14)*T(17)));
g1(4,2)=(-params(4));
g1(4,6)=1;
g1(4,10)=(-params(7));

end
