function bayes_classifier(img, u_skin, cov_skin, u_non_skin, cov_non_skin, ...
                          p_skin, p_non_skin)
   % Turn the image into a vector for multivariate normal distribution.
   % For now, hard-code the h-color space (assume img is hsv).
   x = img(:,:,1)(:);

   p_x_skin = mnd(x, u_skin, cov_skin);
   p_x_skin = reshape(p_x_skin, rows(img), columns(img));

   p_x_non_skin = mnd(x, u_non_skin, cov_non_skin);
   p_x_non_skin = reshape(p_x_non_skin, rows(img), columns(img));

   imshow(p_x_skin * p_skin > p_x_non_skin * p_non_skin);
end
