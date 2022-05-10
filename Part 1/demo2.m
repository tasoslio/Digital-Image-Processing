%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo2.m
% This demo script uses the myresize function to make downsampling to the
% returned rgb image from bayer2rgb function.

% clear workspace
clear;

fprintf('\nDemo2 starts here!!!');

% load the image
try
    load('march.mat');
    fprintf('\nImage has been loaded\n');
catch
    fprintf('\nThe Image has not been loaded! Error!!!\n\n');
end

% Compute the rgb image first
rgb_image = bayer2rgb(x);

% Downsampling with nearest neighbor
fprintf('\nRgb Image computed. Downsampling it with the nearest neighbor and bilinear interpolation methods\n');
fprintf('\nNearest Neighbor method with height=240 and width=320\n');
nearest_img = myresize(rgb_image, 240, 320, 'nearest');
% Show and save the image with nearest neighbor method
image(nearest_img);
imwrite(nearest_img, 'Nearest_Neighbor_Image.jpg');
fprintf('\nNearest Neighbor image saved\n');

% Downsampling with bilinear interpolation
fprintf('\nBilinear Interpolation method with height=200 and width=300\n');
linear_img = myresize(rgb_image, 200, 300, 'linear');
% Show and save the image with bilinear interpolation method
image(linear_img);
imwrite(linear_img, 'Bilinear_Interpolation_Image.jpg');
fprintf('\nBilinear Interpolation image saved\n');


