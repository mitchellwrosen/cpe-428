function [p_skin, p_non_skin] = get_p_skin_non_skin()
   masks_dir = dir('images/masks');

   skin_pixels = 0;
   total_pixels = 0;
   for i = 1 : length(masks_dir)
      if ~masks_dir(i).isdir
         mask = logical(imread(strcat('images/masks/', masks_dir(i).name)));
         skin_pixels += sum(sum(mask));
         total_pixels += prod(size(mask));
      end
   end

   p_skin = skin_pixels / total_pixels;
   p_non_skin = 1 - p_skin;
end
