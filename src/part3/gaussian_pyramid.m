% Required for octave - can comment out for matlab
%pkg load image

% read image from file into matrix
img = imread('input/Lenna.tif');
[m,n] = size(img);

g1 = gaussian_smoothing(img);
p1 = g1(1:2:end,1:2:end);
g2 = gaussian_smoothing(p1);
p2 = g2(1:2:end,1:2:end);
g3 = gaussian_smoothing(p2);
p3 = g3(1:2:end,1:2:end);
g4 = gaussian_smoothing(p3);
p4 = g4(1:2:end,1:2:end);
g5 = gaussian_smoothing(p4);
p5 = g5(1:2:end,1:2:end);

imwrite(p1, 'out1.tif');
imwrite(p2, 'out2.tif');
imwrite(p3, 'out3.tif');
imwrite(p4, 'out4.tif');
imwrite(p5, 'out5.tif');

% Should have been fairly simple to stitch images together but i got hung
% up on matlab syntax so opted to do it this way instead. Commented out so
% it doesn't cause an error.
%command = 'convert input/Lena.tif out1.tif out2.tif out3.tif out4.tif out5.tif +append result.tif'
%system(command);
