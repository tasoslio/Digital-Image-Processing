function xrgb = bayer2rgb(xb)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% Converts the bayer image to rgb with convolution.
%VARIABLES
% xrgb = the converted image with rgb values.
% xb = the initial image with the bayer filter.

%Initialize xrgb with the dimensions of xb
[x,y] = size(xb);
xrgb = zeros(x, y, 3);

%Create 3 arrays for the rgb values
red_color = zeros(x, y);
green_color = zeros(x, y);
blue_color = zeros(x, y);

%Put the right values of xb in the colors array
for k = 1 : 2 : x
   for j = 1 : 2 : y
       green_color(k, j) = xb(k, j);
       if j + 1 <= y && k + 1 <= x
       green_color(k + 1, j + 1) = xb(k + 1, j + 1);
       end
   end
end

for k = 1 : 2 : x
   for j = 2 : 2 : y
       blue_color(k, j) = xb(k, j);
   end
end

for k = 2 : 2 : x
   for j = 1 : 2 : y
       red_color(k, j) = xb(k, j);
   end
end

%Make convolutions in order to find the other values for colors with the
%right kernels
green_kernel = [0 1/4 0; 1/4 0 1/4; 0 1/4 0];
red_and_blue_kernel = [1/4 1/2 1/4; 1/2 0 1/2; 1/4 1/2 1/4];

conv_green = conv2(green_color, green_kernel, 'same');
conv_red = conv2(red_color, red_and_blue_kernel, 'same');
conv_blue = conv2(blue_color, red_and_blue_kernel, 'same');

%Fix the edges after convolution
conv_green(2 : x - 1, 1) = 4 / 3 * conv_green(2 : x - 1, 1);
conv_green(2 : x - 1, y) = 4 / 3 * conv_green(2 : x - 1, y);
conv_red(1, :) = 2 * conv_red(1, :);
conv_blue(:, 1) = 2 * conv_blue(:, 1);
conv_green(1, 2 : y - 1) = 4 / 3 * conv_green(1, 2 : y - 1);
conv_green(x, 2 : y - 1) = 4 / 3 * conv_green(x, 2 : y - 1);

if mod(x, 2) == 0 && mod(y, 2) == 0 %x, y are even
    conv_red(:, y) = 2 * conv_red(:, y);
    conv_blue(x, :) = 2 * conv_blue(x, :);
    conv_green(x, 1) = 2 * conv_green(x, 1);
    conv_green(1, y) = 2 * conv_green(1, y);
    
elseif mod(x, 2) == 0 && mod(y, 2) == 1 %x is even, y is odd
    conv_blue(:, y) = 2 * conv_blue(:, y);
    conv_blue(x, :) = 2 * conv_blue(x, :);
    conv_green(x, 1) = 2 * conv_green(x, 1);
    conv_green(x, y) = 2 * conv_green(x, y);
    
elseif mod(x, 2) == 1 && mod(y, 2) == 0 %x is odd, y is even
    conv_red(x, :) = 2 * conv_red(x, :);
    conv_red(:, y) = 2 * conv_red(:, y);
    conv_green(1, y) = 2 * conv_green(1, y);
    conv_green(x, y) = 2 * conv_green(x, y);
 
elseif mod(x, 2) == 1 && mod(y, 2) == 1 %x, y is odd
    conv_red(x, :) = 2 * conv_red(x, :);
    conv_blue(:, y) = 2 * conv_blue(:, y);
    
end


%Compute the total colors
total_green = conv_green + green_color;
total_blue = conv_blue + blue_color;
total_red = conv_red + red_color;

%Insert the total colors to the return value
xrgb(:, :, 1) = total_red;
xrgb(:, :, 2) = total_green;
xrgb(:, :, 3) = total_blue;

end