function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(9, 1);
end
[T_order, T] = model_file.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(20, 1);
    residual(1) = (y(21)) - (y(1)*(1+y(3)));
    residual(2) = (y(23)) - (y(3)*(1-params(4)));
    residual(3) = (y(22)) - (y(2)^(1-params(6))*T(1));
    residual(4) = (y(24)) - (y(4)*(1-params(27)));
    residual(5) = (y(25)) - (max(y(24)*T(3),0));
    residual(6) = (y(26)) - (y(6)*(1-params(24)));
    residual(7) = (y(40)) - (1-params(33)+params(33)*y(20)+x(1));
    residual(8) = (y(30)) - (T(4)*((1+y(43))*y(49)/y(29))^params(7));
    residual(9) = (y(31)) - (T(5)*T(6));
    residual(10) = (y(28)) - (y(32)*y(40)*y(34));
    residual(11) = (y(31)) - (y(40)*y(34)*(1-y(25)*(params(22)*y(35)*(1-y(33))+T(7))));
    residual(12) = (y(33)) - ((params(14)+params(34)*x(2))^(1/(params(22)-1)));
    residual(13) = (y(36)) - (y(22)*y(21)*y(28)*y(24)*(1-y(33)));
    residual(14) = (y(28)) - (y(29)+y(28)*y(25)*T(7));
    residual(15) = (y(27)) - ((1-params(25))*y(7)+y(36)*params(2));
    residual(16) = (y(37)) - (y(27)*params(37));
    residual(17) = (y(35)) - (params(14)+params(34)*x(2));
    residual(18) = (y(34)) - (exp(y(7)*(-params(21))));
    residual(19) = (y(38)) - (1000*y(25)*y(35)/(y(24)+1e-8));
    residual(20) = (y(39)) - (y(2)*T(8)*T(9)+params(9)*y(59));
end
