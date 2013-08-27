%{
   Extracs the skin and non-skin pixels from the provided images, on the
   specified plane.

   @param      images      A 4-d array of all images in ./images/faces/, assumed
                           to be of the proper type (rgb, hsv).
               masks       A 4-d array of all masks in ./images/masks/.
               plane       The plane to extract information of (1:3).
               normalize   Whether or not to normalize the parameter (only
                           valid for RGB).

   @returns    skin        A vector of skin pixels of parameter |param|.
               non_skin    Like |skin|, but non-skin pixels.
%}
function [skin, non_skin,ims] = get_skin_non_skin(images, masks, plane, normalize)
   if normalize
      for i = 1 : size(images)(4)
         ims(:,:,1,i) = double(images(:,:,plane,i)) ./ ...
                  (double(images(:,:,1,i)) + double(images(:,:,2,i)) + ...
                   double(images(:,:,3,i)));
      end

      % Replace NaNs with 0.
      ims(isnan(ims)) = 0;
   else
      ims = images(:,:,plane,:);
   end

   skin = ims(masks == 1);
   non_skin = ims(masks == 0);
end
