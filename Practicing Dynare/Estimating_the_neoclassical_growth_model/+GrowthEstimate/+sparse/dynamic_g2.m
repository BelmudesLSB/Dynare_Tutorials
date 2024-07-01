function [g2_v, T_order, T] = dynamic_g2(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(37, 1);
end
[T_order, T] = GrowthEstimate.sparse.dynamic_g2_tt(y, x, params, steady_state, T_order, T);
g2_v = NaN(25, 1);
g2_v(1)=(y(5)*y(5)*y(5)*(T(20)*T(2)*getPowerDeriv(y(5),params(5),2)+T(19)*T(19)*T(35))-(y(5)*T(19)*T(20)-T(4))*(y(5)+y(5)))/(y(5)*y(5)*y(5)*y(5));
g2_v(2)=(y(5)*(T(20)*T(18)*T(28)+T(19)*T(1)*T(28)*T(35))-T(20)*T(1)*T(28))/(y(5)*y(5));
g2_v(3)=(-(T(12)*params(1)*(y(9)*y(9)*y(9)*(T(23)*T(6)*getPowerDeriv(y(9),params(5),2)+T(22)*T(22)*T(36))-(y(9)*T(22)*T(23)-T(8))*(y(9)+y(9)))/(y(9)*y(9)*y(9)*y(9))));
g2_v(4)=(-(T(24)*T(27)));
g2_v(5)=(-(T(24)*T(34)+T(12)*params(1)*(y(9)*(T(23)*T(21)*T(31)+T(22)*T(5)*T(31)*T(36))-T(23)*T(5)*T(31))/(y(9)*y(9))));
g2_v(6)=(-(T(10)*T(11)*T(24)));
g2_v(7)=(-(T(9)*T(11)*params(3)*exp(y(12))*getPowerDeriv(y(6),params(3)-1,2)));
g2_v(8)=(-(T(27)*T(32)+T(9)*T(26)*T(33)));
g2_v(9)=(-(T(9)*T(27)));
g2_v(10)=(T(1)*T(28)*T(1)*T(28)*T(35)+T(20)*T(1)*getPowerDeriv(1-y(7),1-params(5),2))/y(5);
g2_v(11)=(-(T(32)*T(34)+T(12)*params(1)*(T(5)*T(31)*T(5)*T(31)*T(36)+T(23)*T(5)*getPowerDeriv(1-y(11),1-params(5),2))/y(9)+T(32)*T(34)+T(9)*T(10)*getPowerDeriv(y(11),1-params(3),2)));
g2_v(12)=(-(T(9)*T(34)+T(10)*T(11)*T(32)));
g2_v(13)=(-(T(9)*T(10)*T(11)));
g2_v(14)=(-((1-y(7))*T(15)*T(13)*T(37)));
g2_v(15)=(-((1-y(7))*T(13)*T(25)*T(29)-T(15)*T(13)*T(25)));
g2_v(16)=(-((1-y(7))*T(15)*T(13)*T(25)));
g2_v(17)=(-((1-y(7))*T(13)*T(14)*getPowerDeriv(y(7),(-params(3)),2)-T(13)*T(14)*T(29)-T(13)*T(14)*T(29)));
g2_v(18)=(-((1-y(7))*T(13)*T(14)*T(29)-T(13)*T(14)*T(15)));
g2_v(19)=(-T(16));
g2_v(20)=(-(T(17)*exp(y(8))*T(37)));
g2_v(21)=(-(exp(y(8))*T(25)*T(30)));
g2_v(22)=(-(T(17)*exp(y(8))*T(25)));
g2_v(23)=(-(exp(y(8))*T(14)*getPowerDeriv(y(7),1-params(3),2)));
g2_v(24)=(-(exp(y(8))*T(14)*T(30)));
g2_v(25)=(-(exp(y(8))*T(14)*T(17)));
end
