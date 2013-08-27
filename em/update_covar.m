%{
   Calculate the updated covariance matrices.

   @param      x              An ixd matrix representing i points of dimension
                              d.
               u              A kxd mean matrix, where u(i,j) is the updated
                              mean of the jth dimension of cluster i.
               cluster_probs  From cluster_probs.

   @returns    c              A dxdxk 3D covariance matrix, where c(i,j,k) is
                              the covariance of parameters i and j of cluster k.
%}
function c = update_covar(x, u, cluster_probs)
   %for i = 1 : rows(u)
      %centered_x = x - u(i,:);

      %numerator = centered_x' * centered_x * cluster_probs

      %numerator = (cluster_probs(:,i) .* x)' * x;
      %denominator = sum(cluster_probs(:,i));

      %c(:,:,i) = numerator / denominator;
   %end

   d = columns(x);
   for i = 1 : rows(u)
      c(:,:,i) = zeros(d,d);
      for j = 1 : rows(x)
         centered_x = x(j,:) - u(i,:);
         c(:,:,i) += centered_x' * centered_x .* cluster_probs(j,i);
      end
   end

end
