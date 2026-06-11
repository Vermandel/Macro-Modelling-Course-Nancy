function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 8);

T(1) = params(3)^params(6);
T(2) = params(23)/1000/params(22);
T(3) = T(2)*y(6);
T(4) = params(10)*y(12)^params(8);
T(5) = y(9)^params(7);
T(6) = y(13)^params(22);
T(7) = y(1)^(1-params(7));
T(8) = 1/(1-params(7))*y(9)^(1-params(7))-params(10)/(1+params(8))*y(12)^(1+params(8));

end
