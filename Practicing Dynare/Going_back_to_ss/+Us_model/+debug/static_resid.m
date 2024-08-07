function [lhs, rhs] = static_resid(y, x, params)
T = NaN(1, 1);
lhs = NaN(11, 1);
rhs = NaN(11, 1);
T(1) = 1/params(3)*(1-params(2))/(1+params(2));
lhs(1) = y(1)-y(9);
rhs(1) = params(11)*x(1)+params(1)*(y(1)-y(9))+(1-params(4))*(1-params(4)*params(1))/params(4)*y(8);
lhs(2) = y(9);
rhs(2) = y(1)*params(5)+(1-params(5))*y(3);
lhs(3) = y(8);
rhs(3) = y(8)*params(2)/(1+params(2))+y(8)*1/(1+params(2))-T(1)*(y(5)-y(1)-y(4))+params(15)*x(5);
lhs(4) = y(5);
rhs(4) = y(5)*params(6)+(1-params(6))*(y(3)+y(4)+params(7)*(y(2)-y(3))+y(8)*params(8))+params(12)*x(4);
lhs(5) = y(4);
rhs(5) = y(4)*params(9)+params(14)*x(3);
lhs(6) = y(3);
rhs(6) = params(10)+y(7);
lhs(7) = y(7);
rhs(7) = y(7)*params(16)+params(13)*x(2);
lhs(8) = y(2);
rhs(8) = (y(1)+y(1)+y(10)+y(11))/4;
lhs(9) = y(6);
rhs(9) = y(5);
lhs(10) = y(10);
rhs(10) = y(1);
lhs(11) = y(11);
rhs(11) = y(10);
end
