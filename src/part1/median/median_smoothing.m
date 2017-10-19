function [ image_output ] = median_smoothing( image_input )
%MEDIAN_SMOOTHING Summary of this function goes here
%   Detailed explanation goes here

% Required for octave - can comment out for matlab
%pkg load image

% read image from file into matrix
img = imread(image_input);

% get rows, columns
[m,n] = size(img);

% window size
ws = 3;
% window 
W = ones(ws,ws);

% Pad image borders with 0
image_padded = zeros(m+2, n+2);
image_padded = cast(image_padded, class(img)); 
image_padded(2:end-1,2:end-1) = img;

image_output = zeros(size(image_padded));
image_output = cast(image_output, class(img));

for i = 2:1:m+1
    for j = 2:1:n+1
        window_val = image_padded((i-1:1:i+1),(j-1:1:j+1)); 
        [rows,cols] = size(window_val);
        vals = reshape(window_val,[1,rows*cols]);
        M = median(vals);
        image_output(i,j) = M;
    end
end

image_output = image_output(2:end-1,2:end-1);
end

