%{
   Gets all the images and masks in ./images/faces/ and ./images/masks/.

   @returns images   A 4-d array of images.
            masks    A 4-d array of masks.
%}
function [images, masks] = get_images_masks()
   images_dir = dir('images/faces');
   masks_dir = dir('images/masks');
   assert(size(images_dir) == size(masks_dir));

   for i = 1 : length(images_dir)
      if ~images_dir(i).isdir
         imname = images_dir(i).name;

         images(:,:,:,i-2) = imread(strcat('images/faces/', imname));
         masks(:,:,:,i-2) = imread(strcat('images/masks/', imname));

         %images(:,:,:,i-2) = imresize( ...
                                %imread(strcat('images/faces/', imname)), ...
                                %factor ...
                             %);

         %masks(:,:,:,i-2) = imresize( ...
                               %imread(strcat('images/masks/', imname)), ...
                               %factor ...
                            %);
      end
   end
end
