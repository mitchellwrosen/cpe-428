pkg load image

function img2 = apply_filter(filter, img)
   [rows, cols] = size(img);

   img2 = zeros(rows, cols);
   for i = 2 : rows-1
      for j = 2 : cols-1
         img2(i, j) = sum(sum(filter .*
            [img(i-1, j-1) img(i-1, j) img(i-1, j+1);
             img(i, j-1)   img(i, j)   img(i, j+1);
             img(i+1, j-1) img(i+1, j) img(i+1, j+1)]));
      end
   end
end

function img2 = median_filter(img)
   [rows, cols] = size(img);

   img2 = zeros(rows, cols);
   for i = 2 : rows-1
      for j = 2 : cols-1
         img2(i, j) = sort([
            img(i-1, j-1) img(i-1, j) img(i-1, j+1)
            img(i, j-1)   img(i, j)   img(i, j+1)
            img(i+1, j-1) img(i+1, j) img(i+1, j+1)])(5);
      end
   end
end

gaussian_filter = [1 2 1; 2 4 2; 1 2 1] ./ 16;
mean_filter = [1 1 1; 1 1 1; 1 1 1] ./ 9;

boat = imread('Boat2.tif');
building = imread('building.gif');

boat_gaussian = apply_filter(gaussian_filter, boat);
boat_mean = apply_filter(mean_filter, boat);
boat_median = median_filter(boat);

building_gaussian = apply_filter(gaussian_filter, building);
building_mean = apply_filter(mean_filter, building);
building_median = median_filter(building);

%img4a = apply_filter(fspecial('sobel'), img);
%img5a = apply_filter(fspecial('prewitt'), img);

subplot(421), imshow(boat), title('original')
subplot(422), imshow(building), title('original')
subplot(423), imshow(boat_gaussian), title('gaussian')
subplot(424), imshow(building_gaussian), title('gaussian')
subplot(425), imshow(boat_mean), title('mean')
subplot(426), imshow(building_mean), title('mean')
subplot(427), imshow(boat_median), title('median')
subplot(428), imshow(building_median), title('median')

pause
