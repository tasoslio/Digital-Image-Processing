function saveasppm(x, filename , K)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% This function is converting a quantized image to ppm and save it.
%VARIABLES
% x = the quantized image for ppm
% filename = the name for the saved ppm file 
% K = the biggest value of the brightness that a pixel can take

% Get the dimensions of x for usng it later
[height, width, color] = size(x);

% K must between [0,65536]
if K >= 0 && K <= 65536
    % one byte for K<256
    if K < 256
        one_byte_x = uint8(x);
        byte = 'uint8';
        
        % Open the file to write the ppm form
        ppm_file = fopen(filename, 'w');
        fprintf(ppm_file, 'P6 %d %d %d\n', width, height, K);
        
        red_channel = reshape(one_byte_x(:, :, 1)', [], 1);
        green_channel = reshape(one_byte_x(:, :, 2)', [], 1);
        blue_channel = reshape(one_byte_x(:, :, 3)', [], 1);
        
        
        write_ppm = reshape([red_channel green_channel blue_channel].', 1, []);
        fwrite(ppm_file, write_ppm, byte, 'b');
        fclose(ppm_file);
        
        
        
    else
    % two bytes for K>256
    
        two_byte_x = uint16(x);
        byte = 'uint16';
        
        % Open the file to write the ppm form
        ppm_file = fopen(filename, 'w');
        fprintf(ppm_file, 'P6 %d %d %d\n', width, height, K);
        
        red_channel = reshape(two_byte_x(:, :, 1)', [], 1);
        green_channel = reshape(two_byte_x(:, :, 2)', [], 1);
        blue_channel = reshape(two_byte_x(:, :, 3)', [], 1);
        
        
        write_ppm = reshape([red_channel green_channel blue_channel].', 1, []);
        fwrite(ppm_file, write_ppm, byte, 'b');
        fclose(ppm_file);

    end

else
    % Error if K is not the right one
    fprintf('\n Error for K. K must be between [0,65536]');

end


end