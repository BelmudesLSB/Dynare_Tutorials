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
    T = Us_model.static_resid_tt(T, y, x, params);
end
residual = zeros(11, 1);
    residual(1) = (y(1)-y(9)) - (params(11)*x(1)+params(1)*(y(1)-y(9))+(1-params(4))*(1-params(4)*params(1))/params(4)*y(8));
    residual(2) = (y(9)) - (y(1)*params(5)+(1-params(5))*y(3));
    residual(3) = (y(8)) - (y(8)*params(2)/(1+params(2))+y(8)*1/(1+params(2))-T(1)*(y(5)-y(1)-y(4))+params(15)*x(5));
    residual(4) = (y(5)) - (y(5)*params(6)+(1-params(6))*(y(3)+y(4)+params(7)*(y(2)-y(3))+y(8)*params(8))+params(12)*x(4));
    residual(5) = (y(4)) - (y(4)*params(9)+params(14)*x(3));
    residual(6) = (y(3)) - (params(10)+y(7));
    residual(7) = (y(7)) - (y(7)*params(16)+params(13)*x(2));
    residual(8) = (y(2)) - ((y(1)+y(1)+y(10)+y(11))/4);
    residual(9) = (y(6)) - (y(5));
    residual(10) = (y(10)) - (y(1));
    residual(11) = (y(11)) - (y(10));

end
