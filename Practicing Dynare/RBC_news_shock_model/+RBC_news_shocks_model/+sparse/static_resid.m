function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = RBC_news_shocks_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(16, 1);
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
