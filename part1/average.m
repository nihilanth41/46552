output = average_smoothing('in.tif');
figure;
imshow(output); 
title('Output Image');
imwrite(output, 'out.tif', 'TIFF');