function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = model_file.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 20
    T = [T; NaN(20 - size(T, 1), 1)];
end
T(19) = getPowerDeriv((1+y(43))*y(49)/y(29),params(7),2);
T(20) = y(25)*getPowerDeriv(y(33),params(22),2);
end
