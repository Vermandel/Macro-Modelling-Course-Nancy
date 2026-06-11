function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 9
    T = [T; NaN(9 - size(T, 1), 1)];
end
T(1) = params(3)^params(6);
T(2) = params(23)/1000/params(22);
T(3) = T(2)*y(26);
T(4) = 1/params(9);
T(5) = params(10)*y(32)^params(8);
T(6) = y(29)^params(7);
T(7) = y(33)^params(22);
T(8) = y(1)^(1-params(7));
T(9) = 1/(1-params(7))*y(29)^(1-params(7))-params(10)/(1+params(8))*y(32)^(1+params(8));
end
