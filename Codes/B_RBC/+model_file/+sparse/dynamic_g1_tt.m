function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = model_file.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 18
    T = [T; NaN(18 - size(T, 1), 1)];
end
T(10) = getPowerDeriv(y(1),1-params(7),1);
T(11) = y(49)/y(29);
T(12) = getPowerDeriv((1+y(43))*y(49)/y(29),params(7),1);
T(13) = (-((1+y(43))*y(49)))/(y(29)*y(29));
T(14) = getPowerDeriv(y(29),params(7),1);
T(15) = 1/(1-params(7))*getPowerDeriv(y(29),1-params(7),1);
T(16) = params(10)*getPowerDeriv(y(32),params(8),1);
T(17) = (-(params(10)/(1+params(8))*getPowerDeriv(y(32),1+params(8),1)));
T(18) = getPowerDeriv(y(33),params(22),1);
end
