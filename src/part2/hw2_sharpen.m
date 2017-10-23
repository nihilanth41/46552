%function [ image_output ] = hw2_sharpen( image_input )
%HW2_SHARPEN Summary of this function goes here
%   Detailed explanation goes here

% Required for octave - can comment out for matlab
%pkg load image
image_input='in_smoothed.tif'
% read image from file into matrix
img = imread(image_input);

% get rows, columns
[m,n] = size(img);

% window size
ws = 3;
% window 

W = [ -1 -1 -1; -1 4 -1; -1 -1 -1 ];
W = uint8(W);

c = 1;
% Pad image borders with 0
image_padded = zeros(m+2, n+2);
image_padded = cast(image_padded, class(img)); 
image_padded(2:end-1,2:end-1) = img;

image_output = zeros(size(image_padded));
image_output = cast(image_output, class(img));

for i = 2:1:m+1
    for j = 2:1:n+1
        window_val = image_padded((i-1:1:i+1),(j-1:1:j+1)); % Get value(s) of window at position
        window_val = uint8(window_val);
        window_laplacian = W.*window_val; % Multiply element-wise (i.e. *not* matrix multiplication)
        difference = window_val - window_laplacian;
        image_output(i-1,j-1) = difference(1,1);
        image_output(i-1,j) = difference(1,2);
        image_output(i-1,j+1) = difference(1,3);
        image_output(i,j-1) = difference(2,1);
        image_output(i,j) = difference(2,2);
        image_output(i,j+1) = difference(2,3);
        image_output(i+1,j-1) = difference(3,1);
        image_output(i+1,j) = difference(3,2);
        image_output(i+1,j+1) = difference(3,3);
    end
end

image_output = image_output(2:end-1,2:end-1);
image_output = img + c*image_output;
figure;
imshow(image_output);
imwrite(image_output, 'out.tif', 'TIFF');
%end

