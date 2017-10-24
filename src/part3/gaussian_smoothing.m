function [ image_output ] = gaussian_smoothing( image_m )
%GAUSSIAN_SMOOTHING Perform gaussian smoothing
%   

% Required for octave - can comment out for matlab
%pkg load image

% get rows, columns
[m,n] = size(image_m);

% window parameters
N = 7;
sigma = 2.5;

% Gaussian window 
image_output = conv2(image_m, gaussian2d(N,sigma), 'same');
image_output = round(image_output);
image_output = uint8(image_output);
end




