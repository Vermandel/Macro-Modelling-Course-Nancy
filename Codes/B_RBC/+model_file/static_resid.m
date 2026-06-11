function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = model_file.static_resid_tt(T, y, x, params);
end
residual = zeros(20, 1);
    residual(1) = (y(1)) - (y(1)*(1+y(3)));
    residual(2) = (y(3)) - (y(3)*(1-params(4)));
    residual(3) = (y(2)) - (y(2)^(1-params(6))*T(1));
    residual(4) = (y(4)) - (y(4)*(1-params(27)));
    residual(5) = (y(5)) - (max(y(4)*T(3),0));
    residual(6) = (y(6)) - (y(6)*(1-params(24)));
    residual(7) = (y(20)) - (1-params(33)+y(20)*params(33)+x(1));
    residual(8) = (y(10)) - (1/params(9)*(1+y(3))^params(7));
    residual(9) = (y(11)) - (T(4)*T(5));
    residual(10) = (y(8)) - (y(12)*y(20)*y(14));
    residual(11) = (y(11)) - (y(20)*y(14)*(1-y(5)*(params(22)*y(15)*(1-y(13))+T(6))));
    residual(12) = (y(13)) - ((params(14)+params(34)*x(2))^(1/(params(22)-1)));
    residual(13) = (y(16)) - (y(2)*y(1)*y(8)*y(4)*(1-y(13)));
    residual(14) = (y(8)) - (y(9)+y(8)*y(5)*T(6));
    residual(15) = (y(7)) - (y(7)*(1-params(25))+y(16)*params(2));
    residual(16) = (y(17)) - (y(7)*params(37));
    residual(17) = (y(15)) - (params(14)+params(34)*x(2));
    residual(18) = (y(14)) - (exp(y(7)*(-params(21))));
    residual(19) = (y(18)) - (1000*y(5)*y(15)/(y(4)+1e-8));
    residual(20) = (y(19)) - (y(2)*T(7)*T(8)+params(9)*y(19));

end
