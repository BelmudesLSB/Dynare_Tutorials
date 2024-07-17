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
    T = RBC_news_shocks_model.static_resid_tt(T, y, x, params);
end
residual = zeros(16, 1);
    residual(1) = (T(1)) - (T(2)*T(5));
    residual(2) = (T(6)/(1-exp(y(4)))) - (exp(y(7)));
    residual(3) = (params(7)*exp(y(3))) - (exp(y(3))*(1-params(4))+exp(y(8)));
    residual(4) = (exp(y(1))) - (exp(y(2))+exp(y(8)));
    residual(5) = (exp(y(1))) - (T(7)*T(8));
    residual(6) = (exp(y(7))) - (exp(y(1))*(1-params(5))/exp(y(4)));
    residual(7) = (y(6)) - (exp(y(1))*params(5)*4/exp(y(3)));
    residual(8) = (y(5)) - (y(5)*params(6)+x(2)+y(16));
    residual(9) = (y(9)) - (x(1));
    residual(10) = (y(10)) - (y(9));
    residual(11) = (y(11)) - (y(10));
    residual(12) = (y(12)) - (y(11));
    residual(13) = (y(13)) - (y(12));
    residual(14) = (y(14)) - (y(13));
    residual(15) = (y(15)) - (y(14));
    residual(16) = (y(16)) - (y(15));

end
