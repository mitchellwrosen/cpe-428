%{
   Gets the covariance matrix of a given matrix.

   @param   m  The matrix.

   @returns s  The covariance matrix of matrix |m|.
%}
function c = get_cov(m)
   m2 = bsxfun(@minus, m, mean(m));
   c = m2' * m2 / (rows(m) - 1);
end
