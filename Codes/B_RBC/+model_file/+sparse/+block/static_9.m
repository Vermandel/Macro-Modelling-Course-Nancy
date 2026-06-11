function [y, T, residual, g1] = static_9(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  T(2)=params(10)*y(12)^params(8);
  T(3)=y(9)^params(7);
  residual(1)=(y(11))-(T(2)*T(3));
  residual(2)=(y(16))-(y(2)*y(1)*y(8)*y(4)*(1-y(13)));
  T(4)=y(13)^params(22);
  residual(3)=(y(8))-(y(9)+y(8)*y(5)*T(4));
  residual(4)=(y(7))-(y(7)*(1-params(25))+y(16)*params(2));
  residual(5)=(y(11))-(y(20)*y(14)*(1-y(5)*(params(22)*y(15)*(1-y(13))+T(4))));
  residual(6)=(y(8))-(y(12)*y(20)*y(14));
  T(5)=exp(y(7)*(-params(21)));
  residual(7)=(y(14))-(T(5));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=1;
g1_v(2)=1;
g1_v(3)=(-(y(2)*y(1)*y(4)*(1-y(13))));
g1_v(4)=1-y(5)*T(4);
g1_v(5)=1;
g1_v(6)=(-(T(2)*getPowerDeriv(y(9),params(7),1)));
g1_v(7)=(-1);
g1_v(8)=1;
g1_v(9)=(-params(2));
g1_v(10)=(-(y(20)*(1-y(5)*(params(22)*y(15)*(1-y(13))+T(4)))));
g1_v(11)=(-(y(20)*y(12)));
g1_v(12)=1;
g1_v(13)=(-(T(3)*params(10)*getPowerDeriv(y(12),params(8),1)));
g1_v(14)=(-(y(20)*y(14)));
g1_v(15)=1-(1-params(25));
g1_v(16)=(-((-params(21))*T(5)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
