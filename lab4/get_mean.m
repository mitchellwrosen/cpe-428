%{
   Gets the mean of each column of a given matrix.

   @param   m  The matrix.

   @returns u  A row-vector of the means of the columns of matrix |m|.
%}
function u = get_mean(m)
   u = sum(m) / rows(m);
end
