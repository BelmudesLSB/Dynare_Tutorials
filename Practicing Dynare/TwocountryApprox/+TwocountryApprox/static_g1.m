function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = TwocountryApprox.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,1)=1;
g1(1,2)=(-1);
g1(2,1)=T(9)-T(3)*params(4)*T(9);
g1(2,3)=(-(T(1)*params(4)*params(3)*exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3)-1,1)));
g1(2,5)=(-(T(1)*params(4)*T(2)));
g1(3,2)=T(10)-T(6)*params(4)*T(10);
g1(3,4)=(-(params(4)*T(4)*params(3)*exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3)-1,1)));
g1(3,6)=(-(params(4)*T(4)*T(5)));
g1(4,1)=exp(y(1));
g1(4,2)=exp(y(2));
g1(4,3)=exp(y(3))-exp(y(3))*(1-params(2))-T(11);
g1(4,4)=exp(y(4))-exp(y(4))*(1-params(2))-T(12);
g1(4,5)=(-T(7));
g1(4,6)=(-T(8));
g1(5,5)=1-params(5);
g1(6,6)=1-params(5);
g1(7,3)=(-T(11));
g1(7,5)=(-T(7));
g1(7,7)=exp(y(7));
g1(8,4)=(-T(12));
g1(8,6)=(-T(8));
g1(8,8)=exp(y(8));

end