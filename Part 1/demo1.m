%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo1.m
% This demo script uses the bayer2rgb function to present the result of the
% image and the kernels that they have been used.

% clear workspace
clear;

fprintf('\nDemo1 starts here!!!');

% load the image
try
    load('march.mat');
    fprintf('\nImage has been loaded\n');
catch
    fprintf('\nThe Image has not been loaded! Error!!!\n\n');
end

% Present Kernels
fprintf('\nFirst, present the kernels that used for convolution!\n');
green_kernel = [0 1/4 0; 1/4 0 1/4; 0 1/4 0];
red_and_blue_kernel = [1/4 1/2 1/4; 1/2 0 1/2; 1/4 1/2 1/4];
green_kernel
red_and_blue_kernel

% Create rgb image and show it.
fprintf('\nShow the rgb image\n');
rgb_image = bayer2rgb(x);
image(rgb_image);
imwrite(rgb_image, 'Bayer2RGBImage.jpg');
