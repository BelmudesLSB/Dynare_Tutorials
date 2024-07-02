function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = TwocountryVardec.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 20
    T = [T; NaN(20 - size(T, 1), 1)];
end
T(9) = exp(y(9))*getPowerDeriv(exp(y(9)),(-params(1)),1);
T(10) = exp(y(17))*getPowerDeriv(exp(y(17)),(-params(1)),1);
T(11) = exp(y(10))*getPowerDeriv(exp(y(10)),(-params(1)),1);
T(12) = exp(y(18))*getPowerDeriv(exp(y(18)),(-params(1)),1);
T(13) = exp(y(3))*getPowerDeriv(exp(y(3)),params(3),1);
T(14) = exp(y(13))*T(13);
T(15) = exp(y(11))*getPowerDeriv(exp(y(11)),params(3)-1,1);
T(16) = params(3)*exp(y(21))*T(15);
T(17) = exp(y(4))*getPowerDeriv(exp(y(4)),params(3),1);
T(18) = exp(y(14))*T(17);
T(19) = exp(y(12))*getPowerDeriv(exp(y(12)),params(3)-1,1);
T(20) = params(3)*exp(y(22))*T(19);
end
