%{
   Calculate the updated means.

   @param      x              An ixd matrix representing i points of dimension
                              d.
               cluster_probs  An ixk matrix from cluster_probs.

   @returns    u              A kxd mean matrix, where u(i,j) is the mean of the
                              jth dimension of cluster i.
%}
function u = update_mean(x, cluster_probs)
   % Gets a kxd matrix: SUM(from 1 to i)(P(Cj | Xi) * Xi)
   numerator = cluster_probs' * x;

   % Gets a kx1 matrix: SUM(from 1 to i)(P(Cj | Xi)
   denominator = sum(cluster_probs)';

   % Normalize each row of the numerator.
   %u = bsxfun(@rdivide, numerator, denominator);
   u = numerator ./ denominator;
end
