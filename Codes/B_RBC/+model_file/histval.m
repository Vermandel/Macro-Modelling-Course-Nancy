function [ys0_] = histval(oo_, M_)
ys0_ = oo_.steady_state;
oo_.initial_exo_steady_state = oo_.exo_steady_state;
ys0_(1) = M_.params(5);
ys0_(2) = M_.params(13);
ys0_(3) = M_.params(26);
ys0_(7) = M_.params(1);
ys0_(6) = M_.params(15);
ys0_(5) = M_.params(18);
ys0_(8) = M_.params(20);
ys0_(4) = M_.params(28);
end
