%{
   Calculate P(Xi | Tj) (T is theta, i.e. the mean and covariance of a cluster).

   @param      x  A ixd matrix representing i points, each with dimension d.
               u  A kxd mean matrix, where u(i,j) is the row vector representing
                  the means of cluster x.
               c  A dxdxk covariance matrix, where c(:,:,i) is the covariance
                  matrix of cluster i.

   @returns    p  A ixk matrix, where p(i,j) = P(Xi | Tj)
%}
function p = gaussian_probs(x, u, c)
   a1 = (2*pi)^(columns(x)/2);

   k = rows(u);
   for i = 1 : k
      ith_c = c(:,:,i);

      %diff = bsxfun(@minus, x, u(i,:)); % Matlab version.
      centered_x = x - u(i,:); % Octave version.

      a2 = a1 * det(ith_c)^(0.5);

      % Uses: a * inv(b) == a / b
      % Uses: diag(a * b) == sum(a .* b', 2)
      a3 = -0.5 * sum(centered_x / ith_c .* centered_x, 2);
      p(:,i) = 1/a2 * exp(a3);
   end

   %{
   % Condensed version.
   for i = 1 : rows(u)
      p(:,i) = 1/((2*pi)^(columns(x)/2) * det(c(:,:,i))^(0.5)) * ...
         exp(-0.5 * sum((x - u(i,:)) / c(:,:,i) .* (x - u(i,:)), 2));
   end
   %}
end
