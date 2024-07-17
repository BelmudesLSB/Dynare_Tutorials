function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = RBC_news_shocks_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(16, 1);
    residual(1) = (exp(y(18))^(-params(3))) - (T(1)*T(4));
    residual(2) = (T(5)/(1-exp(y(20)))) - (exp(y(23)));
    residual(3) = (params(7)*exp(y(19))) - ((1-params(4))*exp(y(3))+exp(y(24)));
    residual(4) = (exp(y(17))) - (exp(y(18))+exp(y(24)));
    residual(5) = (exp(y(17))) - (T(6)*T(7));
    residual(6) = (exp(y(23))) - (exp(y(17))*(1-params(5))/exp(y(20)));
    residual(7) = (y(22)) - (exp(y(17))*params(5)*4/exp(y(3)));
    residual(8) = (y(21)) - (params(6)*y(5)+x(2)+y(16));
    residual(9) = (y(25)) - (x(1));
    residual(10) = (y(26)) - (y(9));
    residual(11) = (y(27)) - (y(10));
    residual(12) = (y(28)) - (y(11));
    residual(13) = (y(29)) - (y(12));
    residual(14) = (y(30)) - (y(13));
    residual(15) = (y(31)) - (y(14));
    residual(16) = (y(32)) - (y(15));
end
