pkg load image

%[u_skin, cov_skin, u_non_skin, cov_non_skin] = get_mean_covar('h')
u_skin = 0.22762;
cov_skin = 0.012648;
u_non_skin = 0.45058;
cov_non_skin = 0.046561;

%[p_skin, p_non_skin] = get_p_skin_non_skin();
p_skin = 0.12083;
p_non_skin = 0.87917;
%p_skin = 0.5;
%p_non_skin = 0.5;

%img = imread('images/faces/image_0001.jpg');
%img = imread('ryan face shot.jpg');
img = imread('lab_images/door_shot.jpg');

imghsv = rgb2hsv(img);

% Bayes classifier
% Turn the image into a vector for multivariate normal distribution.
% For now, hard-code the h-color space.
x = imghsv(:,:,1)(:);

p_x_skin = mnd(x, u_skin, cov_skin);
p_x_skin = reshape(p_x_skin, rows(img), columns(img));

p_x_non_skin = mnd(x, u_non_skin, cov_non_skin);
p_x_non_skin = reshape(p_x_non_skin, rows(img), columns(img));

imshow(p_x_skin * p_skin > p_x_non_skin * p_non_skin)
title('Image segmentation using Bayes classifier with k = 2, P(Skin) = 0.12 and P(Non-skin) = 0.88')
%title('Image segmentation using Bayes classifier with k = 2, P(Skin) = 0.5 and P(Non-skin) = 0.5')
