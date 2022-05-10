%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo3.m
% This demo script uses the functions for quantization/dequantization and
% present the functionality of the system quantizer/dequantizer.

% clear workspace
clear;

fprintf('\nDemo3 starts here!!!');

% load the image
try
    load('march.mat');
    fprintf('\nImage has been loaded\n');
catch
    fprintf('\nThe Image has not been loaded! Error!!!\n\n');
end

% Bayer to rgb first
fprintf('\nFirst, make the image from bayer filter to rgb\n');
rgb = bayer2rgb(x);
imwrite(rgb, 'Rgb_Image_Before_Quantization.jpg');
fprintf('\nImage has been converted to rgb and has been saved\n');

% Quantize the image with 3 bits
fprintf('\nQuantize the image with 3 bits for each rgb channel\n');
quantized_image = imagequant(rgb, 1/8, 1/8, 1/8);

% Dequantize image with 3 bits
fprintf('\nDequantize the image with 3 bits for each rgb channel\n');
dequantized_image = imagedequant(quantized_image, 1/8, 1/8, 1/8);
fprintf('\nShow and save the dequantized image\n');
image(dequantized_image);
imwrite(dequantized_image, 'Rgb_Image_After_Quantization.jpg');
