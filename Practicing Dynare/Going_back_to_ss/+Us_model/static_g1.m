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
    T = Us_model.static_g1_tt(T, y, x, params);
end
g1 = zeros(11, 11);
g1(1,1)=1-params(1);
g1(1,8)=(-((1-params(4))*(1-params(4)*params(1))/params(4)));
g1(1,9)=params(1)-1;
g1(2,1)=(-params(5));
g1(2,3)=(-(1-params(5)));
g1(2,9)=1;
g1(3,1)=(-T(1));
g1(3,4)=(-T(1));
g1(3,5)=T(1);
g1(3,8)=1-(params(2)/(1+params(2))+1/(1+params(2)));
g1(4,2)=(-((1-params(6))*params(7)));
g1(4,3)=(-((1-params(6))*(1-params(7))));
g1(4,4)=(-(1-params(6)));
g1(4,5)=1-params(6);
g1(4,8)=(-((1-params(6))*params(8)));
g1(5,4)=1-params(9);
g1(6,3)=1;
g1(6,7)=(-1);
g1(7,7)=1-params(16);
g1(8,1)=(-0.5);
g1(8,2)=1;
g1(8,10)=(-0.25);
g1(8,11)=(-0.25);
g1(9,5)=(-1);
g1(9,6)=1;
g1(10,1)=(-1);
g1(10,10)=1;
g1(11,10)=(-1);
g1(11,11)=1;

end
