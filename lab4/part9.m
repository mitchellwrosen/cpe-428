pkg load image

%[u_skin, cov_skin, u_non_skin, cov_non_skin] = get_mean_covar('hRG')
u_skin = [0.22762 0.39935 0.30679];
cov_skin = [1.2648e-02 -6.4598e-04 2.6590e-06; -6.4598e-04 1.5298e-03 -1.5140e-04; 2.6590e-06 -1.5140e-04 4.6159e-04];
u_non_skin = [0.45058 0.34940 0.33814];
cov_non_skin = [4.6561e-02 -1.2104e-02 1.4080e-03; -1.2104e-02 8.0093e-03 -7.4396e-04; 1.4080e-03 -7.4396e-04 2.2709e-03];
%u_skin = [0.22762   177.03423   139.06175];
%cov_skin = [1.2648e-02  -7.2990e-01  -4.8165e-01;
            %-7.2990e-01   2.4246e+03 2.0637e+03;
            %-4.8165e-01   2.0637e+03   1.8971e+03];
%u_non_skin = [0.45058   124.50836   123.00914];
%cov_non_skin = [4.6561e-02  -2.9497e+00   4.5480e-01;
                %-2.9497e+00   4.1141e+03   3.7883e+03;
                %4.5480e-01   3.7883e+03   4.0525e+03];

p_skin = 0.12083;
p_non_skin = 0.87917;
%p_skin = 0.5;
%p_non_skin = 0.5;

img = double(imread('images/faces/image_0001.jpg'));
%img = double(imread('lab_images/ryan face shot.jpg'));
%img = double(imread('lab_images/door_shot.jpg'));
imghsv = rgb2hsv(img);

% Bayes classifier.
% Turn the image into a vector for multivariate normal distribution.
x(:,1) = imghsv(:,:,1)(:);
x(:,2) = (img(:,:,1) ./ (img(:,:,1) + img(:,:,2) + img(:,:,3)))(:);
x(:,3) = (img(:,:,2) ./ (img(:,:,1) + img(:,:,2) + img(:,:,3)))(:);

p_x_skin = mnd(x, u_skin, cov_skin);
p_x_skin = reshape(p_x_skin, rows(img), columns(img));

p_x_non_skin = mnd(x, u_non_skin, cov_non_skin);
p_x_non_skin = reshape(p_x_non_skin, rows(img), columns(img));

imshow(p_x_skin * p_skin > p_x_non_skin * p_non_skin)
title('Image segmentation using Bayes classifier with k = 2, P(Skin) = 0.12 and P(Non-skin) = 0.88')
%title('Image segmentation using Bayes classifier with k = 2, P(Skin) = 0.5 and P(Non-skin) = 0.5')
