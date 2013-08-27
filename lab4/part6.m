%{
   Plot the distributions for skin and non-skin pixels from all 50 images in the
   shifted hue space and normalized G space.
%}
pkg load image

[images, masks] = get_images_masks(.25);
[skin, non_skin] = get_skin_non_skin(images, masks, 2, true);
images_hsv = rgb2hsv_all(images);
clear images
[skin2, non_skin2] = get_skin_non_skin(images_hsv, masks, 1, false);
clear images_hsv
clear masks

figure(1);
subplot(121), scatter(skin2, skin, 1, 'red', '.'), title('Skin');
subplot(122),  scatter(non_skin2, non_skin, 1, 'blue', '.'), title('Non-skin');
pause
