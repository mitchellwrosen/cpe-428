%{
   Plot the distributions for skin and non-skin pixels from all 50 images in the
   normalized g space.
%}
pkg load image

[images, masks] = get_images_masks();
[skin, non_skin,ims] = get_skin_non_skin(images, masks, 2, true);

figure(1);
subplot(121), imhist(skin + 0.2), title('Skin pixels normalized G');
subplot(122), imhist(non_skin + 0.2), title('Non-skin pixels normalized G');
pause
