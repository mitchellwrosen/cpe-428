%{
   Plot the distributions for skin and non-skin pixels from all 50 images in the
   shifted hue space.
%}
pkg load image

[images, masks] = get_images_masks();
images_hsv = rgb2hsv_all(images);
[face, non_face] = get_face_non_face(images_hsv, masks, 1, false);

figure(1);
subplot(121), imhist(face + 0.2), title('Skin pixels hue (+ 0.2)');
subplot(122), imhist(non_face + 0.2), title('Non-skin pixels hue (+ 0.2)');
pause
