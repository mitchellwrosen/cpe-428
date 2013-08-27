pkg load image

% Separate bacteria from background.
i = imread('bacteria.bmp');
b = i <= 100;

% Display the grayscale image and the binary image.
imshow(i)
imshow(b)

% Compute the total area of the bacteria in the image.
cc = bwconncomp(b, 4);
props = regionprops(b, 'Area')
totalArea = sum([props.Area])

imshow(label2rgb(bwlabel(b)))

pause
