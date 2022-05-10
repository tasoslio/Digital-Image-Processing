function q = imagequant(x, w1, w2, w3)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% This function quantizes the image x with bandwiths w1, w2, w3 for each rgb channel
% VARIABLES
% x = the input image for quantization
% w1 = the bandwith for quantization for red channel
% w2 = the bandwith for quantization for green channel
% w3 = the bandwith for quantization for blue channel
% q = the returned quantized output image

% Initialize the q 
[height, width, color] = size(x);
q = zeros(height, width, color);

% Quantize each channel
red = myquant(x(:, :, 1), w1);
green = myquant(x(:, :, 2), w2);
blue = myquant(x(:, :, 3), w3);


% Assign quantized rgb channels to q and return
q(:, :, 1) = red;
q(:, :, 2) = green;
q(:, :, 3) = blue;


end