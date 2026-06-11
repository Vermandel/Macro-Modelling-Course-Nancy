function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 18);

T = model_file.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(10) = getPowerDeriv(y(1),1-params(7),1);
T(11) = y(29)/y(16);
T(12) = getPowerDeriv((1+y(28))*y(29)/y(16),params(7),1);
T(13) = (-((1+y(28))*y(29)))/(y(16)*y(16));
T(14) = getPowerDeriv(y(16),params(7),1);
T(15) = 1/(1-params(7))*getPowerDeriv(y(16),1-params(7),1);
T(16) = params(10)*getPowerDeriv(y(19),params(8),1);
T(17) = (-(params(10)/(1+params(8))*getPowerDeriv(y(19),1+params(8),1)));
T(18) = getPowerDeriv(y(20),params(22),1);

end
