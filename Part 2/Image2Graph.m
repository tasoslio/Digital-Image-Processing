function [myAffinityMat, dist] = Image2Graph(imIn)
%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% Returns the affinity matrix of an image
%VARIABLES
% myAffinityMat = the affinity matrix to convert image to graph
% imIn = the initial image with dimensions MxNxn


% Initialize the distances array that is going to have the weights
[M, N, n] = size(imIn);
array = imIn(:, :, 1);
array = array';
len = length(array(:));
distances = zeros(len);

% Compute all the weights between of all pixels
for k = 1 : n
    array = imIn(:, :, k);
    array = array';
    len = length(array(:));
    for i = 1:len
        for j = 1 : len
            distances(i, j) = (array(i) - array(j))^2 + distances(i, j);
        end
    end
end

% Compute Affinity matrix
myAffinityMat = exp(-sqrt(distances));

end