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
    T = TwocountryEst.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(42,1);
g2_j = zeros(42,1);
g2_v = zeros(42,1);

g2_i(1)=2;
g2_i(2)=2;
g2_i(3)=2;
g2_i(4)=2;
g2_i(5)=2;
g2_i(6)=2;
g2_i(7)=2;
g2_i(8)=2;
g2_i(9)=2;
g2_i(10)=2;
g2_i(11)=3;
g2_i(12)=3;
g2_i(13)=3;
g2_i(14)=3;
g2_i(15)=3;
g2_i(16)=3;
g2_i(17)=3;
g2_i(18)=3;
g2_i(19)=3;
g2_i(20)=3;
g2_i(21)=4;
g2_i(22)=4;
g2_i(23)=4;
g2_i(24)=4;
g2_i(25)=4;
g2_i(26)=4;
g2_i(27)=4;
g2_i(28)=4;
g2_i(29)=4;
g2_i(30)=4;
g2_i(31)=4;
g2_i(32)=4;
g2_i(33)=7;
g2_i(34)=7;
g2_i(35)=7;
g2_i(36)=7;
g2_i(37)=7;
g2_i(38)=8;
g2_i(39)=8;
g2_i(40)=8;
g2_i(41)=8;
g2_i(42)=8;
g2_j(1)=77;
g2_j(2)=229;
g2_j(3)=223;
g2_j(4)=121;
g2_j(5)=231;
g2_j(6)=265;
g2_j(7)=115;
g2_j(8)=123;
g2_j(9)=259;
g2_j(10)=267;
g2_j(11)=96;
g2_j(12)=248;
g2_j(13)=242;
g2_j(14)=140;
g2_j(15)=250;
g2_j(16)=284;
g2_j(17)=134;
g2_j(18)=142;
g2_j(19)=278;
g2_j(20)=286;
g2_j(21)=77;
g2_j(22)=96;
g2_j(23)=1;
g2_j(24)=9;
g2_j(25)=145;
g2_j(26)=115;
g2_j(27)=20;
g2_j(28)=28;
g2_j(29)=164;
g2_j(30)=134;
g2_j(31)=153;
g2_j(32)=172;
g2_j(33)=1;
g2_j(34)=9;
g2_j(35)=145;
g2_j(36)=153;
g2_j(37)=191;
g2_j(38)=20;
g2_j(39)=28;
g2_j(40)=164;
g2_j(41)=172;
g2_j(42)=210;
g2_v(1)=T(9)+exp(y(5))*exp(y(5))*getPowerDeriv(exp(y(5)),(-params(1)),2);
g2_v(2)=(-(T(3)*params(4)*(T(10)+exp(y(13))*exp(y(13))*getPowerDeriv(exp(y(13)),(-params(1)),2))));
g2_v(3)=(-(params(4)*T(10)*T(16)));
g2_v(4)=g2_v(3);
g2_v(5)=(-(T(2)*params(4)*T(10)));
g2_v(6)=g2_v(5);
g2_v(7)=(-(T(1)*params(3)*exp(y(15))*(T(15)+exp(y(7))*exp(y(7))*getPowerDeriv(exp(y(7)),params(3)-1,2))));
g2_v(8)=(-(T(1)*T(16)));
g2_v(9)=g2_v(8);
g2_v(10)=(-(T(1)*T(2)));
g2_v(11)=T(11)+exp(y(6))*exp(y(6))*getPowerDeriv(exp(y(6)),(-params(1)),2);
g2_v(12)=(-(T(6)*params(4)*(T(12)+exp(y(14))*exp(y(14))*getPowerDeriv(exp(y(14)),(-params(1)),2))));
g2_v(13)=(-(params(4)*T(12)*T(20)));
g2_v(14)=g2_v(13);
g2_v(15)=(-(T(5)*params(4)*T(12)));
g2_v(16)=g2_v(15);
g2_v(17)=(-(T(4)*params(3)*exp(y(16))*(T(19)+exp(y(8))*exp(y(8))*getPowerDeriv(exp(y(8)),params(3)-1,2))));
g2_v(18)=(-(T(4)*T(20)));
g2_v(19)=g2_v(18);
g2_v(20)=(-(T(4)*T(5)));
g2_v(21)=exp(y(5));
g2_v(22)=exp(y(6));
g2_v(23)=(-(exp(y(1))*(1-params(2))))-T(21);
g2_v(24)=(-T(14));
g2_v(25)=g2_v(24);
g2_v(26)=exp(y(7));
g2_v(27)=(-((1-params(2))*exp(y(2))))-T(22);
g2_v(28)=(-T(18));
g2_v(29)=g2_v(28);
g2_v(30)=exp(y(8));
g2_v(31)=(-T(7));
g2_v(32)=(-T(8));
g2_v(33)=(-T(21));
g2_v(34)=(-T(14));
g2_v(35)=g2_v(34);
g2_v(36)=(-T(7));
g2_v(37)=exp(y(11));
g2_v(38)=(-T(22));
g2_v(39)=(-T(18));
g2_v(40)=g2_v(39);
g2_v(41)=(-T(8));
g2_v(42)=exp(y(12));
g2 = sparse(g2_i,g2_j,g2_v,8,324);
end
