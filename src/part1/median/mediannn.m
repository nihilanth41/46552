output = median_smoothing('in.tif');
figure;
imshow(output);
title('Output after Median smoothing');
imwrite(output, 'out.tif', 'TIFF');

% Example to compare against 
img = imread('in.tif');
image_blurred = medfilt2(img,[3 3]);
imwrite(image_blurred, 'median_control.tif', 'TIFF');