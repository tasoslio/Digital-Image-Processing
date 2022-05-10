function x = mydequant(q, w)
%% Digital Image Processing Assignment Part 1
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% This function dequantizes the input q with bandwith w
% VARIABLES
% x = the returned dequantized quantity
% w = the bandwith for dequantization
% q = the input quantized quantity

% Dequantize the q and return the value of x
x = (q.*w);
end