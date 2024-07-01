function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g2
%

if T_flag
    T = GrowthEstimate.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(38,1);
g2_j = zeros(38,1);
g2_v = zeros(38,1);

g2_i(1)=1;
g2_i(2)=1;
g2_i(3)=1;
g2_i(4)=1;
g2_i(5)=1;
g2_i(6)=1;
g2_i(7)=1;
g2_i(8)=1;
g2_i(9)=1;
g2_i(10)=1;
g2_i(11)=1;
g2_i(12)=1;
g2_i(13)=1;
g2_i(14)=1;
g2_i(15)=1;
g2_i(16)=1;
g2_i(17)=1;
g2_i(18)=1;
g2_i(19)=1;
g2_i(20)=1;
g2_i(21)=2;
g2_i(22)=2;
g2_i(23)=2;
g2_i(24)=2;
g2_i(25)=2;
g2_i(26)=2;
g2_i(27)=2;
g2_i(28)=2;
g2_i(29)=2;
g2_i(30)=3;
g2_i(31)=3;
g2_i(32)=3;
g2_i(33)=3;
g2_i(34)=3;
g2_i(35)=3;
g2_i(36)=3;
g2_i(37)=3;
g2_i(38)=3;
g2_j(1)=23;
g2_j(2)=25;
g2_j(3)=43;
g2_j(4)=67;
g2_j(5)=64;
g2_j(6)=37;
g2_j(7)=68;
g2_j(8)=77;
g2_j(9)=69;
g2_j(10)=87;
g2_j(11)=34;
g2_j(12)=38;
g2_j(13)=74;
g2_j(14)=39;
g2_j(15)=84;
g2_j(16)=45;
g2_j(17)=78;
g2_j(18)=79;
g2_j(19)=88;
g2_j(20)=89;
g2_j(21)=1;
g2_j(22)=5;
g2_j(23)=41;
g2_j(24)=6;
g2_j(25)=51;
g2_j(26)=45;
g2_j(27)=46;
g2_j(28)=55;
g2_j(29)=56;
g2_j(30)=1;
g2_j(31)=5;
g2_j(32)=41;
g2_j(33)=6;
g2_j(34)=51;
g2_j(35)=45;
g2_j(36)=46;
g2_j(37)=55;
g2_j(38)=56;
g2_v(1)=(y(3)*y(3)*y(3)*(T(20)*T(2)*getPowerDeriv(y(3),params(5),2)+T(19)*T(19)*T(35))-(y(3)*T(19)*T(20)-T(4))*(y(3)+y(3)))/(y(3)*y(3)*y(3)*y(3));
g2_v(2)=(y(3)*(T(20)*T(18)*T(28)+T(19)*T(1)*T(28)*T(35))-T(20)*T(1)*T(28))/(y(3)*y(3));
g2_v(3)=g2_v(2);
g2_v(4)=(-(T(12)*params(1)*(y(7)*y(7)*y(7)*(T(23)*T(6)*getPowerDeriv(y(7),params(5),2)+T(22)*T(22)*T(36))-(y(7)*T(22)*T(23)-T(8))*(y(7)+y(7)))/(y(7)*y(7)*y(7)*y(7))));
g2_v(5)=(-(T(24)*T(27)));
g2_v(6)=g2_v(5);
g2_v(7)=(-(T(24)*T(34)+T(12)*params(1)*(y(7)*(T(23)*T(21)*T(31)+T(22)*T(5)*T(31)*T(36))-T(23)*T(5)*T(31))/(y(7)*y(7))));
g2_v(8)=g2_v(7);
g2_v(9)=(-(T(10)*T(11)*T(24)));
g2_v(10)=g2_v(9);
g2_v(11)=(-(T(9)*T(11)*params(3)*exp(y(9))*getPowerDeriv(y(4),params(3)-1,2)));
g2_v(12)=(-(T(27)*T(32)+T(9)*T(26)*T(33)));
g2_v(13)=g2_v(12);
g2_v(14)=(-(T(9)*T(27)));
g2_v(15)=g2_v(14);
g2_v(16)=(T(1)*T(28)*T(1)*T(28)*T(35)+T(20)*T(1)*getPowerDeriv(1-y(5),1-params(5),2))/y(3);
g2_v(17)=(-(T(32)*T(34)+T(12)*params(1)*(T(5)*T(31)*T(5)*T(31)*T(36)+T(23)*T(5)*getPowerDeriv(1-y(8),1-params(5),2))/y(7)+T(32)*T(34)+T(9)*T(10)*getPowerDeriv(y(8),1-params(3),2)));
g2_v(18)=(-(T(9)*T(34)+T(10)*T(11)*T(32)));
g2_v(19)=g2_v(18);
g2_v(20)=(-(T(9)*T(10)*T(11)));
g2_v(21)=(-((1-y(5))*T(15)*T(13)*T(37)));
g2_v(22)=(-((1-y(5))*T(13)*T(25)*T(29)-T(15)*T(13)*T(25)));
g2_v(23)=g2_v(22);
g2_v(24)=(-((1-y(5))*T(15)*T(13)*T(25)));
g2_v(25)=g2_v(24);
g2_v(26)=(-((1-y(5))*T(13)*T(14)*getPowerDeriv(y(5),(-params(3)),2)-T(13)*T(14)*T(29)-T(13)*T(14)*T(29)));
g2_v(27)=(-((1-y(5))*T(13)*T(14)*T(29)-T(13)*T(14)*T(15)));
g2_v(28)=g2_v(27);
g2_v(29)=(-T(16));
g2_v(30)=(-(T(17)*exp(y(6))*T(37)));
g2_v(31)=(-(exp(y(6))*T(25)*T(30)));
g2_v(32)=g2_v(31);
g2_v(33)=(-(T(17)*exp(y(6))*T(25)));
g2_v(34)=g2_v(33);
g2_v(35)=(-(exp(y(6))*T(14)*getPowerDeriv(y(5),1-params(3),2)));
g2_v(36)=(-(exp(y(6))*T(14)*T(30)));
g2_v(37)=g2_v(36);
g2_v(38)=(-(exp(y(6))*T(14)*T(17)));
g2 = sparse(g2_i,g2_j,g2_v,4,100);
end
