function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = model_file.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(20, 1);
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
