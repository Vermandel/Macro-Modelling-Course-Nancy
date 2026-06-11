function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(23)=y(3)*(1-params(4));
  T(1)=params(3)^params(6);
  y(22)=y(2)^(1-params(6))*T(1);
  y(24)=y(4)*(1-params(27));
  y(26)=y(6)*(1-params(24));
  y(40)=1-params(33)+params(33)*y(20)+x(1);
  y(33)=(params(14)+params(34)*x(2))^(1/(params(22)-1));
  y(35)=params(14)+params(34)*x(2);
  y(21)=y(1)*(1+y(3));
  y(25)=max(y(24)*params(23)/1000/params(22)*y(26),0);
  y(38)=1000*y(25)*y(35)/(y(24)+1e-8);
end
