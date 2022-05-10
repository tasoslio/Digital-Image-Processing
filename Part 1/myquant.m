function q = myquant(x, w)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% This function quantizes the input x with bandwith w
% VARIABLES
% x = the input for quantization
% w = the bandwith for quantization
% q = the returned quantized output

% Quantize the x and return the result
q = floor(x ./ w);

end