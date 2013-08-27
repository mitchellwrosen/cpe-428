%{
   Returns a vector of hsv images, given a vector of rgb images.

   @param      images      The vector of images.

   @returns    images_hsc  The corresponding vector of hsv images.
%}
function images_hsv = rgb2hsv_all(images)
   for i = 1 : size(images)(4)
      images_hsv(:,:,:,i) = rgb2hsv(images(:,:,:,i));
   end
end
