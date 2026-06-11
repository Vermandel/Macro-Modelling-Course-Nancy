function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = model_file.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(20, 32);
g1(1,1)=(-(1+y(3)));
g1(1,8)=1;
g1(1,3)=(-y(1));
g1(2,3)=(-(1-params(4)));
g1(2,10)=1;
g1(3,2)=(-(T(1)*getPowerDeriv(y(2),1-params(6),1)));
g1(3,9)=1;
g1(4,4)=(-(1-params(27)));
g1(4,11)=1;
g1(5,11)=(-(T(3)*(y(11)*T(3)>0)));
g1(5,12)=1;
g1(5,13)=(-((y(11)*T(3)>0)*y(11)*T(2)));
g1(6,5)=(-(1-params(24)));
g1(6,13)=1;
g1(7,7)=(-params(33));
g1(7,27)=1;
g1(7,31)=(-1);
g1(8,28)=(-(T(4)*T(11)*T(12)));
g1(8,16)=(-(T(4)*T(12)*T(13)));
g1(8,29)=(-(T(4)*T(12)*(1+y(28))/y(16)));
g1(8,17)=1;
g1(9,16)=(-(T(5)*T(14)));
g1(9,18)=1;
g1(9,19)=(-(T(6)*T(16)));
g1(10,15)=1;
g1(10,19)=(-(y(27)*y(21)));
g1(10,21)=(-(y(27)*y(19)));
g1(10,27)=(-(y(19)*y(21)));
g1(11,12)=(-(y(27)*y(21)*(-(params(22)*y(22)*(1-y(20))+T(7)))));
g1(11,18)=1;
g1(11,20)=(-(y(27)*y(21)*(-(y(12)*(T(18)-params(22)*y(22))))));
g1(11,21)=(-(y(27)*(1-y(12)*(params(22)*y(22)*(1-y(20))+T(7)))));
g1(11,22)=(-(y(27)*y(21)*(-(y(12)*params(22)*(1-y(20))))));
g1(11,27)=(-(y(21)*(1-y(12)*(params(22)*y(22)*(1-y(20))+T(7)))));
g1(12,20)=1;
g1(12,32)=(-(params(34)*getPowerDeriv(params(14)+params(34)*x(it_, 2),1/(params(22)-1),1)));
g1(13,8)=(-(y(9)*y(15)*y(11)*(1-y(20))));
g1(13,9)=(-(y(8)*y(15)*y(11)*(1-y(20))));
g1(13,11)=(-(y(9)*y(8)*y(15)*(1-y(20))));
g1(13,15)=(-(y(9)*y(8)*y(11)*(1-y(20))));
g1(13,20)=(-(y(9)*y(8)*y(15)*(-y(11))));
g1(13,23)=1;
g1(14,12)=(-(y(15)*T(7)));
g1(14,15)=1-y(12)*T(7);
g1(14,16)=(-1);
g1(14,20)=(-(y(15)*y(12)*T(18)));
g1(15,6)=(-(1-params(25)));
g1(15,14)=1;
g1(15,23)=(-params(2));
g1(16,14)=(-params(37));
g1(16,24)=1;
g1(17,22)=1;
g1(17,32)=(-params(34));
g1(18,6)=(-((-params(21))*exp(y(6)*(-params(21)))));
g1(18,21)=1;
g1(19,11)=(-(1000*(-(y(12)*y(22)))/((y(11)+1e-8)*(y(11)+1e-8))));
g1(19,12)=(-(1000*y(22)/(y(11)+1e-8)));
g1(19,22)=(-(1000*y(12)/(y(11)+1e-8)));
g1(19,25)=1;
g1(20,1)=(-(T(9)*y(2)*T(10)));
g1(20,2)=(-(T(8)*T(9)));
g1(20,16)=(-(y(2)*T(8)*T(15)));
g1(20,19)=(-(y(2)*T(8)*T(17)));
g1(20,26)=1;
g1(20,30)=(-params(9));

end
