function xrgbres = myresize(xrgb, N, M, method)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% This function is downsampling the input image.
%VARIABLES
% xrgb = image with rgb values.
% N, M = the new dimensions.
% method = the method to assign the right values to the pixels of the new
% image. 'nearest' for nearest neighbor method and 'linear' for bilinear
% interpolation.
% xrgbres = the returned resized image


% Initialize the xrgbres
[x, y, color] = size(xrgb);
xrgbres = zeros(N, M, color);

% Scale the initial image
tx = x / N;
ty = y / M;

if isequal(method, 'nearest') % nearest neighbor method
    for k = 1 : N
        for j = 1 : M
           % Compute nearest neighbor
           new_x = ceil(tx * k);
           new_y = ceil(ty * j);
           xrgbres(k, j, 1) = xrgb(new_x, new_y, 1);
           xrgbres(k, j, 2) = xrgb(new_x, new_y, 2);
           xrgbres(k, j, 3) = xrgb(new_x, new_y, 3);
        end
    end
    
elseif isequal(method, 'linear') % bilinear interpolation method
    for k = 1 : N
        for j = 1 : M
           new_x = floor(tx * k);
           new_y = floor(ty * j);
           
           if new_x >= x
              new_x = new_x - 1; 
           end
           
           if new_x <= 1
              new_x = 1; 
           end
           
           if new_y <= 1
              new_y = 1; 
           end
           
           if new_y >= y
              new_y = new_y - 1; 
           end
           
           x_diff = ((tx * k) - new_x);
           y_diff = ((ty * j) - new_y);
           
           % Compute the color with the interpolation of the 4 neighbors
           red1 = xrgb(new_x, new_y, 1) * (1 - x_diff) * (1 - y_diff);
           red2 = xrgb(new_x, new_y + 1, 1) * (1 - x_diff) * y_diff;
           red3 = xrgb(new_x + 1, new_y, 1) * x_diff * (1 - y_diff);
           red4 = xrgb(new_x + 1, new_y + 1, 1) * x_diff * y_diff;
           
           green1 = xrgb(new_x, new_y, 2) * (1 - x_diff) * (1 - y_diff);
           green2 = xrgb(new_x, new_y + 1, 2) * (1 - x_diff) * y_diff;
           green3 = xrgb(new_x + 1, new_y, 2) * x_diff * (1 - y_diff);
           green4 = xrgb(new_x + 1, new_y + 1, 2) * x_diff * y_diff;
           
           blue1 = xrgb(new_x, new_y, 3) * (1 - x_diff) * (1 - y_diff);
           blue2 = xrgb(new_x, new_y + 1, 3) * (1 - x_diff) * y_diff;
           blue3 = xrgb(new_x + 1, new_y, 3) * x_diff * (1 - y_diff);
           blue4 = xrgb(new_x + 1, new_y + 1, 3) * x_diff * y_diff;
           
           xrgbres(k, j, 1) = red1 + red2 + red3 + red4;
           xrgbres(k, j, 2) = green1 + green2 + green3 + green4;
           xrgbres(k, j, 3) = blue1 + blue2 + blue3 + blue4;
        end
    end
    
else 
    % If method input is not valid, inform user
    fprintf('\nNo valid method. Select either nearest or linear for method\n');
    
end




end