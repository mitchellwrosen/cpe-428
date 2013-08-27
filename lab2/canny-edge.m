pkg load image

function b = bounded(low, x, hi)
   if x >= low && x < hi
      b = true;
   else
      b = false;
   end
end

function out = apply_filter(filter, img)
   [rows, cols] = size(img);

   out = zeros(rows, cols);
   for i = 2 : rows-1
      for j = 2 : cols-1
         out(i, j) = sum(sum(filter .*
            [img(i-1, j-1) img(i-1, j) img(i-1, j+1);
             img(i, j-1)   img(i, j)   img(i, j+1);
             img(i+1, j-1) img(i+1, j) img(i+1, j+1)]));
      end
   end
end

function out = non_maximum_suppression(mag, ang)
   [rows, cols] = size(mag);

   out = zeros(rows, cols);
   for i = 2 : rows-1
      for j = 2 : cols-1
         a = ang(i, j);
         if a < 0
            a = a + 2*pi;
         end
         if a > pi
            a = a - pi;
         end

         m = mag(i, j);

         % Horizontal gradient
         if bounded(0, a, 1/8*pi) || bounded(7/8*pi, a, pi)
            if m >= mag(i, j-1) && m >= mag(i, j+1)
               out(i, j) = m;
            else
               out(i, j) = 0;
            end
         % Antidiagonal
         elseif bounded(1/8*pi, a, 3/8*pi)
            if m >= mag(i-1, j+1) && m >= mag(i+1, j-1)
               out(i, j) = m;
            else
               out(i, j) = 0;
            end
         % Vertical
         elseif bounded(3/8*pi, a, 5/8*pi)
            if m >= mag(i-1, j) && m >= mag(i+1, j)
               out(i, j) = m;
            else
               out(i, j) = 0;
            end
         % Main diagonal
         else
            if m >= mag(i-1, j-1) && m >= mag(i+1, j+1)
               out(i, j) = m;
            else
               out(i, j) = 0;
            end
         end
      end % for
   end % for
end

i = imread('building.gif');
i = apply_filter(fspecial('gaussian'), i);
ix = apply_filter(fspecial('sobel'), i);
iy = apply_filter(fspecial('sobel')', i);

imag = abs(ix) + abs(iy);
iang = atan(iy ./ ix);

imag2 = non_maximum_suppression(imag, iang);

figure(1)
subplot(131), imshow(i, [0 255]), title('original')
subplot(132), imshow(imag, [0 255]), title('magnitude of gradient')
subplot(133), imshow(imag2, [0 255]), title('magnitude of gradient, non-maximum suppression')
