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
    T = r_star.static_g1_tt(T, y, x, params);
end
g1 = zeros(16, 16);
g1(1,8)=(-400);
g1(1,14)=1;
g1(2,4)=(-400);
g1(2,15)=1;
g1(3,6)=(-400);
g1(3,16)=1;
g1(4,4)=(-T(4));
g1(4,6)=T(4);
g1(4,12)=(-T(4));
g1(5,1)=(-1);
g1(5,2)=(-T(3));
g1(5,10)=1-params(1)*T(3)*(1-T(3));
g1(5,11)=T(3);
g1(6,4)=1;
g1(6,5)=1;
g1(6,6)=(-1);
g1(7,1)=(-(T(2)*params(3)));
g1(7,3)=1-params(1);
g1(7,7)=(-1);
g1(7,10)=(-(params(3)*params(2)));
g1(8,3)=(-1);
g1(8,4)=1-params(5);
g1(9,2)=(-1);
g1(9,10)=1;
g1(9,11)=1;
g1(10,8)=(-1);
g1(10,9)=(-1);
g1(10,12)=1;
g1(11,4)=(-1);
g1(11,12)=(-1);
g1(11,13)=1;
g1(12,8)=(-(T(2)*T(3)*(params(1)-1)));
g1(12,9)=(-(params(1)*T(3)/(1-params(1)*T(3))));
g1(12,11)=params(2)+T(2)*(1-T(3))-T(3)*params(1)*T(2)*(1-T(3));
g1(13,4)=(-((1-params(6))*params(7)));
g1(13,6)=1-params(6);
g1(13,10)=(-((1-params(6))*params(8)/4));
g1(14,9)=1-params(12);
g1(15,8)=1-params(13);
g1(16,7)=1-params(14);

end
