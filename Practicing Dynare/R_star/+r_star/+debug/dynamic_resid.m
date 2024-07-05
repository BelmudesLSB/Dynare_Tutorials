function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(4, 1);
lhs = NaN(16, 1);
rhs = NaN(16, 1);
T(1) = exp(params(11)/400);
T(2) = T(1)/(T(1)-params(1)*params(4))*T(1)/(T(1)-params(4));
T(3) = params(4)/T(1);
T(4) = T(2)^(-1);
lhs(1) = y(30);
rhs(1) = params(11)+400*(y(18)-y(2)+y(24));
lhs(2) = y(31);
rhs(2) = params(9)+400*y(20);
lhs(3) = y(32);
rhs(3) = params(9)+params(10)+400*y(22);
lhs(4) = y(17);
rhs(4) = y(33)-(y(22)-y(36)-y(28))*T(4);
lhs(5) = y(26);
rhs(5) = y(17)+(y(2)-y(11))*T(3)+params(1)*T(3)*(y(42)-y(26)*T(3));
lhs(6) = y(21);
rhs(6) = y(22)-y(36);
lhs(7) = y(19);
rhs(7) = y(23)+params(1)*y(35)+params(3)*(y(26)*params(2)+y(17)*T(2));
lhs(8) = y(20);
rhs(8) = y(19)+params(5)*y(4);
lhs(9) = y(26);
rhs(9) = y(18)-y(27);
lhs(10) = y(28);
rhs(10) = y(40)+y(41)-params(2)*(y(43)-y(27));
lhs(11) = y(29);
rhs(11) = y(36)+y(28);
lhs(12) = params(2)*y(27)+T(2)*(y(27)-y(11)*T(3))-T(3)*params(1)*T(2)*(y(43)-y(27)*T(3));
rhs(12) = (params(1)*y(40)-y(24))*T(2)*T(3)+y(41)*params(1)*T(3)/(1-params(1)*T(3));
lhs(13) = y(22);
rhs(13) = params(6)*y(6)+(1-params(6))*(y(20)*params(7)+y(26)*params(8)/4)+params(18)/400*x(1);
lhs(14) = y(25);
rhs(14) = params(12)*y(9)+params(15)/400*x(3);
lhs(15) = y(24);
rhs(15) = params(13)*y(8)+params(16)/400*x(4);
lhs(16) = y(23);
rhs(16) = params(14)*y(7)+params(17)/400*x(2);
end