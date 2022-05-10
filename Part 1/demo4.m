%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo4.m
% This demo script uses the all the functions of the first assingment of dip in
% order to present the pipeline of the assingment. 

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
fprintf('\nFirst, make the image from bayer filter to rgb and save it\n');
rgb = bayer2rgb(x);
imwrite(rgb, 'Rgb_pipeline.jpg');

% Then, downsampling with height = 150 and width = 200 with billinear
% interpolation 
fprintf('\nDownsampling the rgb image with height = 150 and width = 200 with billinear interpolation and save the image\n');
down_billinear_img = myresize(rgb, 150, 200, 'linear');
imwrite(down_billinear_img, 'Downsampled_billinear_pipeline.jpg');


% Continue with quantizing the image with 3 bits for each rgb channel
fprintf('\nQuantizing the downsampled image with 3 bits for each rgb channel\n');
quantized_img = imagequant(down_billinear_img, 1/8, 1/8, 1/8);


% Finally, save the quantized image in ppm format and show the image
fprintf('Finally, save the image to ppm format and save it\n');
saveasppm(quantized_img, 'dip_is_fun.ppm', 8);
imshow('dip_is_fun.ppm');


