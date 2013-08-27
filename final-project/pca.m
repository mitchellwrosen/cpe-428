function out = pca(data, n)
   out = normalize_data(data);

   [eigVecs, eigVals] = eig(out * out');
   [eigVals, s] = sort(-diag(eigVals));
   eigVecs = eigVecs(:, s);

   out = eigVecs(:,[1:n])' * out;
end
