function x = imagedequant(q, w1, w2, w3)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% This function dequantizes the image q with bandwiths w1, w2, w3 for each rgb channel
% VARIABLES
% q = the input image for dequantization
% w1 = the bandwith for dequantization for red channel
% w2 = the bandwith for dequantization for green channel
% w3 = the bandwith for dequantization for blue channel
% x = the returned dequantized output image

% Initialize the x
[height, width, color] = size(q);
x = zeros(height, width, color);

% Dequantize each channel
red = mydequant(q(:, :, 1), w1);
green = mydequant(q(:, :, 2), w2);
blue = mydequant(q(:, :, 3), w3);

% Assign dequantized rgb channels to x and return
x(:, :, 1) = red;
x(:, :, 2) = green;
x(:, :, 3) = blue;


end