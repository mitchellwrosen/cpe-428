pkg load image

function partA(imgname)
    % Read and display.
    img = imread(imgname);
    figure, imshow(img);

    % Convert to grayscale.
    gs = rgb2gray(img);

    % Find min and max intensities and their corresponding spatial coords.
    minVal = min(min(gs));
    [minX, minY] = find(gs == minVal);
    maxVal = max(max(gs));
    [maxX, maxY] = find(gs == maxVal);

    whos gs

    % Scale down
    gs2 = gs(1:2:end, 1:2:end);
    gs3 = gs(1:4:end, 1:4:end);
    gs4 = gs(1:8:end, 1:8:end);
    gs5 = gs(1:16:end, 1:16:end);
    figure, imshow(gs2)
    figure, imshow(gs3)
    figure, imshow(gs4)
    figure, imshow(gs5)
endfunction

partA('landscape.jpg');
pause()
%partA('IMG_1677.jpg');


