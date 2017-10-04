% Zachary Rump

% Required for octave - can comment out for matlab
pkg load image

% read image from file into matrix
img = imread('in.tif');

% get rows, columns
[M,N] = size(img);

% Average filter
% Window / Filter size
ws = 5
W = ones(ws,ws); % 5x5

% pad all the edges of the image with two layers of zeros. 
% this is for when the filter overlaps with the image edge, we just use 0 for pixel val.
% 2x2 zeros for 5x5 filter size
img_padded = padarray(img,[2 2],0,'both');

for i = 1:M
	for j = 1:N
		window_val = img_padded(i-2:i+2,j-2:j+2);	% Get value of image at window position i,j
		img_smoothed(i,j) = (1/(ws*ws))*sum(sum(window_val));
	end
end

imwrite('out.tif', img_smoothed);





