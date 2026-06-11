function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = model_file.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(20, 1);
    residual(1) = (y(8)) - (y(1)*(1+y(3)));
    residual(2) = (y(10)) - (y(3)*(1-params(4)));
    residual(3) = (y(9)) - (y(2)^(1-params(6))*T(1));
    residual(4) = (y(11)) - (y(4)*(1-params(27)));
    residual(5) = (y(12)) - (max(y(11)*T(3),0));
    residual(6) = (y(13)) - (y(5)*(1-params(24)));
    residual(7) = (y(27)) - (1-params(33)+params(33)*y(7)+x(it_, 1));
    residual(8) = (y(17)) - (T(4)*((1+y(28))*y(29)/y(16))^params(7));
    residual(9) = (y(18)) - (T(5)*T(6));
    residual(10) = (y(15)) - (y(19)*y(27)*y(21));
    residual(11) = (y(18)) - (y(27)*y(21)*(1-y(12)*(params(22)*y(22)*(1-y(20))+T(7))));
    residual(12) = (y(20)) - ((params(14)+params(34)*x(it_, 2))^(1/(params(22)-1)));
    residual(13) = (y(23)) - (y(9)*y(8)*y(15)*y(11)*(1-y(20)));
    residual(14) = (y(15)) - (y(16)+y(15)*y(12)*T(7));
    residual(15) = (y(14)) - ((1-params(25))*y(6)+y(23)*params(2));
    residual(16) = (y(24)) - (y(14)*params(37));
    residual(17) = (y(22)) - (params(14)+params(34)*x(it_, 2));
    residual(18) = (y(21)) - (exp(y(6)*(-params(21))));
    residual(19) = (y(25)) - (1000*y(12)*y(22)/(y(11)+1e-8));
    residual(20) = (y(26)) - (y(2)*T(8)*T(9)+params(9)*y(30));

end
