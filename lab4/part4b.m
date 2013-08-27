pkg load image

%[u_skin, cov_skin, u_non_skin, cov_non_skin] = get_mean_covar('h')
u_skin  = [0.22762, 0.30679];
cov_skin = [0.012648 0.0000026590; 0.0000026590 0.00046159];
u_non_skin = [0.45058 0.33814];
cov_non_skin = [0.0465614 0.0014080; 0.0014080, 0.0022709];

p_skin = 0.12083;
p_non_skin = 0.87917;
%p_skin = 0.5;
%p_non_skin = 0.5;

%img = double(imread('images/faces/image_0001.jpg'));
%img = double(imread('lab_images/ryan face shot.jpg'));
img = double(imread('lab_images/door_shot.jpg'));
imghsv = rgb2hsv(img);

% Bayes classifier.
% Turn the image into a vector for multivariate normal distribution.
x(:,1) = imghsv(:,:,1)(:);
x(:,2) = (img(:,:,2) ./ (img(:,:,1) + img(:,:,2) + img(:,:,3)))(:);

p_x_skin = mnd(x, u_skin, cov_skin);
p_x_skin = reshape(p_x_skin, rows(img), columns(img));

p_x_non_skin = mnd(x, u_non_skin, cov_non_skin);
p_x_non_skin = reshape(p_x_non_skin, rows(img), columns(img));

imshow(p_x_skin * p_skin > p_x_non_skin * p_non_skin)
title('Image segmentation using Bayes classifier with k = 2, P(Skin) = 0.12 and P(Non-skin) = 0.88')
%title('Image segmentation using Bayes classifier with k = 2, P(Skin) = 0.5 and P(Non-skin) = 0.5')
