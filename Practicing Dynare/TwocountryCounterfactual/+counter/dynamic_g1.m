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
    T = counter.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(8, 18);
g1(1,5)=1;
g1(1,6)=(-1);
g1(2,5)=exp(y(5))*getPowerDeriv(exp(y(5)),(-params(1)),1);
g1(2,13)=(-(T(3)*params(4)*exp(y(13))*getPowerDeriv(exp(y(13)),(-params(1)),1)));
g1(2,7)=(-(T(1)*params(3)*exp(y(15))*exp(y(7))*getPowerDeriv(exp(y(7)),params(3)-1,1)));
g1(2,15)=(-(T(1)*T(2)));
g1(3,6)=exp(y(6))*getPowerDeriv(exp(y(6)),(-params(1)),1);
g1(3,14)=(-(T(6)*params(4)*exp(y(14))*getPowerDeriv(exp(y(14)),(-params(1)),1)));
g1(3,8)=(-(T(4)*params(3)*exp(y(16))*exp(y(8))*getPowerDeriv(exp(y(8)),params(3)-1,1)));
g1(3,16)=(-(T(4)*T(5)));
g1(4,5)=exp(y(5));
g1(4,6)=exp(y(6));
g1(4,1)=(-(exp(y(1))*(1-params(2))))-T(9);
g1(4,7)=exp(y(7));
g1(4,2)=(-((1-params(2))*exp(y(2))))-T(10);
g1(4,8)=exp(y(8));
g1(4,9)=(-T(7));
g1(4,10)=(-T(8));
g1(5,3)=(-params(5));
g1(5,9)=1;
g1(5,17)=(-1);
g1(6,4)=(-params(5));
g1(6,10)=1;
g1(6,18)=(-1);
g1(7,1)=(-T(9));
g1(7,9)=(-T(7));
g1(7,11)=exp(y(11));
g1(8,2)=(-T(10));
g1(8,10)=(-T(8));
g1(8,12)=exp(y(12));

end
