function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = r_star_taylor.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(16, 1);
lhs = y(21);
rhs = params(11)+400*(y(9)-y(1)+y(15));
residual(1) = lhs - rhs;
lhs = y(22);
rhs = params(9)+400*y(11);
residual(2) = lhs - rhs;
lhs = y(23);
rhs = params(9)+params(10)+400*y(13);
residual(3) = lhs - rhs;
lhs = y(8);
rhs = y(24)-(y(13)-y(26)-y(19))*T(4);
residual(4) = lhs - rhs;
lhs = y(17);
rhs = y(8)+(y(1)-y(7))*T(3)+params(1)*T(3)*(y(29)-y(17)*T(3));
residual(5) = lhs - rhs;
lhs = y(12);
rhs = y(13)-y(26);
residual(6) = lhs - rhs;
lhs = y(10);
rhs = y(14)+params(1)*y(25)+params(3)*(y(17)*params(2)+y(8)*T(2));
residual(7) = lhs - rhs;
lhs = y(11);
rhs = y(10)+params(5)*y(2);
residual(8) = lhs - rhs;
lhs = y(17);
rhs = y(9)-y(18);
residual(9) = lhs - rhs;
lhs = y(19);
rhs = y(27)+y(28)-params(2)*(y(30)-y(18));
residual(10) = lhs - rhs;
lhs = y(20);
rhs = y(26)+y(19);
residual(11) = lhs - rhs;
lhs = params(2)*y(18)+T(2)*(y(18)-y(7)*T(3))-T(3)*params(1)*T(2)*(y(30)-y(18)*T(3));
rhs = (params(1)*y(27)-y(15))*T(2)*T(3)+y(28)*params(1)*T(3)/(1-params(1)*T(3));
residual(12) = lhs - rhs;
lhs = y(13);
rhs = params(6)*y(3)+(1-params(6))*(y(11)*params(7)+y(17)*params(8)/4)+params(18)/400*x(it_, 1);
residual(13) = lhs - rhs;
lhs = y(16);
rhs = params(12)*y(6)+params(15)/400*x(it_, 3);
residual(14) = lhs - rhs;
lhs = y(15);
rhs = params(13)*y(5)+params(16)/400*x(it_, 4);
residual(15) = lhs - rhs;
lhs = y(14);
rhs = params(14)*y(4)+params(17)/400*x(it_, 2);
residual(16) = lhs - rhs;

end
