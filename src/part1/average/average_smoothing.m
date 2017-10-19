function [ image_output ] = average_smoothing( image_input )
%AVERAGE_SMOOTHING Summary of this function goes here
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
W = ones(ws,ws) / (ws*ws); 

% Pad image borders with 0
image_padded = zeros(m+2, n+2);
image_padded = cast(image_padded, class(img)); 
image_padded(2:end-1,2:end-1) = img;

image_output = zeros(size(image_padded));
image_output = cast(image_output, class(img));

for i = 2:1:m+1
    for j = 2:1:n+1
        val = 0;
        for k=-1:1:1
            for l=-1:1:1
                val = val+image_padded(i+k,j+l)*W(k+2,l+2);
            end
        end
        image_output(i,j) = val;
    end
end

image_output = image_output(2:end-1,2:end-1);

% Ground-truth using imfilter
img_smoothed_control = imfilter(img, W); 
img_smoothed_control = img_smoothed_control;
%figure;
%imshow(img_smoothed_control);
%title('Filtered image');
imwrite(img_smoothed_control, 'control.tif', 'TIFF');

end


