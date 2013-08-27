%{
   Calculate P(Cj | Xi).

   @param      a        A 1xk alpha row vector where a(i) is the alpha of 
                        cluster i.
               probs    An ixk matrix from gaussian_probs().

   @returns    p  An ixk matrix, where p(i,j) = P(Cj | Xi)
%}
function p = cluster_probs(a, probs)
   % Get the weighted probability of each point.
   numerator = bsxfun(@times, a, probs);
   denominator = (a * probs')';

   p = bsxfun(@rdivide, numerator, denominator);
end
