function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = model_file.static_g1_tt(T, y, x, params);
end
g1 = zeros(20, 20);
g1(1,1)=1-(1+y(3));
g1(1,3)=(-y(1));
g1(2,3)=1-(1-params(4));
g1(3,2)=1-T(1)*getPowerDeriv(y(2),1-params(6),1);
g1(4,4)=1-(1-params(27));
g1(5,4)=(-(T(3)*(y(4)*T(3)>0)));
g1(5,5)=1;
g1(5,6)=(-((y(4)*T(3)>0)*y(4)*T(2)));
g1(6,6)=1-(1-params(24));
g1(7,20)=1-params(33);
g1(8,3)=(-(1/params(9)*getPowerDeriv(1+y(3),params(7),1)));
g1(8,10)=1;
g1(9,9)=(-(T(4)*getPowerDeriv(y(9),params(7),1)));
g1(9,11)=1;
g1(9,12)=(-(T(5)*params(10)*getPowerDeriv(y(12),params(8),1)));
g1(10,8)=1;
g1(10,12)=(-(y(20)*y(14)));
g1(10,14)=(-(y(20)*y(12)));
g1(10,20)=(-(y(12)*y(14)));
g1(11,5)=(-(y(20)*y(14)*(-(params(22)*y(15)*(1-y(13))+T(6)))));
g1(11,11)=1;
g1(11,13)=(-(y(20)*y(14)*(-(y(5)*(T(9)-params(22)*y(15))))));
g1(11,14)=(-(y(20)*(1-y(5)*(params(22)*y(15)*(1-y(13))+T(6)))));
g1(11,15)=(-(y(20)*y(14)*(-(y(5)*params(22)*(1-y(13))))));
g1(11,20)=(-(y(14)*(1-y(5)*(params(22)*y(15)*(1-y(13))+T(6)))));
g1(12,13)=1;
g1(13,1)=(-(y(2)*y(8)*y(4)*(1-y(13))));
g1(13,2)=(-(y(1)*y(8)*y(4)*(1-y(13))));
g1(13,4)=(-(y(2)*y(1)*y(8)*(1-y(13))));
g1(13,8)=(-(y(2)*y(1)*y(4)*(1-y(13))));
g1(13,13)=(-(y(2)*y(1)*y(8)*(-y(4))));
g1(13,16)=1;
g1(14,5)=(-(y(8)*T(6)));
g1(14,8)=1-y(5)*T(6);
g1(14,9)=(-1);
g1(14,13)=(-(y(8)*y(5)*T(9)));
g1(15,7)=1-(1-params(25));
g1(15,16)=(-params(2));
g1(16,7)=(-params(37));
g1(16,17)=1;
g1(17,15)=1;
g1(18,7)=(-((-params(21))*exp(y(7)*(-params(21)))));
g1(18,14)=1;
g1(19,4)=(-(1000*(-(y(5)*y(15)))/((y(4)+1e-8)*(y(4)+1e-8))));
g1(19,5)=(-(1000*y(15)/(y(4)+1e-8)));
g1(19,15)=(-(1000*y(5)/(y(4)+1e-8)));
g1(19,18)=1;
g1(20,1)=(-(T(8)*y(2)*getPowerDeriv(y(1),1-params(7),1)));
g1(20,2)=(-(T(7)*T(8)));
g1(20,9)=(-(y(2)*T(7)*1/(1-params(7))*getPowerDeriv(y(9),1-params(7),1)));
g1(20,12)=(-(y(2)*T(7)*(-(params(10)/(1+params(8))*getPowerDeriv(y(12),1+params(8),1)))));
g1(20,19)=1-params(9);

end
