pkg load image
format long

%img = imread('images/faces/image_0001.jpg');
%x = rgb2hsv(img)(:,:,1)(:);
x = [.1 : .1 : 1]';

d = 1;
k = 2;

% Initialization.
u = rand(k, d);
for i = 1 : k
   c(:,:,i) = eye(d);
end
a = 1/k * ones(1,k);

%profile clear
%profile on
colors = eye(3); % Hard-coded supports k=1,2,3
for i = 1 : 10
   % E step.
   g_probs = gaussian_probs(x, u, c);
   c_probs = cluster_probs(a, g_probs);

   % Show results so far (hard-coded for one dimension).
   t = sprintf('Segmentation after %d iterations', i);
   figure(i), title(t);
   for j = 1 : k
      [~, indices] = max(c_probs, [], 2);
      xj = x(indices == j);
      scatter(xj, zeros(size(xj)), 10, colors(j,:), 'filled');
      hold
   end

   pause

   % M step.
   old_u = u;
   old_c = c;

   u = update_mean(x, c_probs)
   c = update_covar(x, u, c_probs)
   a = update_alpha(c_probs);

   if old_u == u && old_c == c
      break
   end
end
%profile off
%profshow(profile('info'))

%[~, indices] = max(c_probs, [], 2);
%labeled = reshape(indices, rows(img), columns(img));
%labeled_rgb = label2rgb(labeled);
%imshow(labeled_rgb);
