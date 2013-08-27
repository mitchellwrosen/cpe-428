%{
   Calculate the updated alphas.

   @param      cluster_probs  From cluster_probs.

   @returns    a              A 1xk alpha row vector where a(i) is the alpha of 
                              cluster i.
%}
function a = update_alpha(cluster_probs)
   a = sum(cluster_probs)/rows(cluster_probs);
end
