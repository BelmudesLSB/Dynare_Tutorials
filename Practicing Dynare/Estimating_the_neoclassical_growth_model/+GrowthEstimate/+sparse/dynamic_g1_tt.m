function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = GrowthEstimate.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 34
    T = [T; NaN(34 - size(T, 1), 1)];
end
T(18) = getPowerDeriv(y(5),params(5),1);
T(19) = T(2)*T(18);
T(20) = getPowerDeriv(T(3),1-params(6),1);
T(21) = getPowerDeriv(y(9),params(5),1);
T(22) = T(6)*T(21);
T(23) = getPowerDeriv(T(7),1-params(6),1);
T(24) = params(1)*(y(9)*T(22)*T(23)-T(8))/(y(9)*y(9));
T(25) = getPowerDeriv(y(2),params(3),1);
T(26) = params(3)*exp(y(12))*getPowerDeriv(y(6),params(3)-1,1);
T(27) = T(11)*T(26);
T(28) = (-(getPowerDeriv(1-y(7),1-params(5),1)));
T(29) = getPowerDeriv(y(7),(-params(3)),1);
T(30) = getPowerDeriv(y(7),1-params(3),1);
T(31) = (-(getPowerDeriv(1-y(11),1-params(5),1)));
T(32) = params(1)*T(23)*T(5)*T(31)/y(9);
T(33) = getPowerDeriv(y(11),1-params(3),1);
T(34) = T(10)*T(33);
end
