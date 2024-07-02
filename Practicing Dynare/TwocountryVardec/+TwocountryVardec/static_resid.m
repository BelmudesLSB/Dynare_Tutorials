function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = TwocountryVardec.static_resid_tt(T, y, x, params);
end
residual = zeros(8, 1);
    residual(1) = (y(1)) - (y(2));
    residual(2) = (T(1)) - (T(1)*params(4)*T(3));
    residual(3) = (T(4)) - (params(4)*T(4)*T(6));
    residual(4) = (exp(y(4))+exp(y(3))+exp(y(1))+exp(y(2))-exp(y(3))*(1-params(2))-exp(y(4))*(1-params(2))) - (T(7)+T(8));
    residual(5) = (y(5)) - (y(5)*params(5)+x(1));
    residual(6) = (y(6)) - (y(6)*params(5)+x(2));
    residual(7) = (exp(y(7))) - (T(7));
    residual(8) = (exp(y(8))) - (T(8));

end
