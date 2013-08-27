%{
   Gets the mean and covariance matrix of skin pixels and non-skin pixels of all
   images in ./images/skins/ (with corresponding masks in ./images/masks/) per
   the specified parameters.

   @param   params      A string of parameters, i.e. 'r' or 'RGhsv'.
                        Acceptable characters are in 'rgbhsvRGB'.  Capital
                        letter means normalize.

   @returns u_skin         A row-vector of means of skin pixels, where u_skin(1)
                           corresponds to the first parameter in |params|, and
                           so on.
            cov_skin       Like u_skin, but variance instead of mean.
            u_non_skin     Like u_skin, but non-skin pixels.
            cov_non_skin   Like u_non_skin, but variance instead of mean.
%}
function [u_skin, cov_skin, u_non_skin, cov_non_skin] = get_mean_covar(params)
   [images, masks] = get_images_masks();

   % Save off an array of hsv images if necessary.
   for i = 1 : length(params)
      if index('hsv', params(i))
         images_hsv = rgb2hsv_all(images);
         break
      end
   end

   for i = 1 : columns(params)
      c = params(i);

      if ((ndx = index('rgb', c)))
         [f, nf] = get_skin_non_skin(images, masks, ndx, false);
      elseif ((ndx = index('RGB', c)))
         [f, nf] = get_skin_non_skin(images, masks, ndx, true);
      elseif ((ndx = index('hsv', c)))
         [f, nf] = get_skin_non_skin(images_hsv, masks, ndx, false);
      else
         printf('Bad parameter: %c\n', c);
         continue
      end

      if c == 'h'
         f = mod(f + 0.2, 1);
         nf = mod(nf + 0.2, 1);
      end

      skin(i,:) = f;
      non_skin(i,:) = nf;
   end

   u_skin = get_mean(skin');
   cov_skin = get_cov(double(skin'));
   u_non_skin = get_mean(non_skin');
   cov_non_skin = get_cov(double(non_skin'));
end
