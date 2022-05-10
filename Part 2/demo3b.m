%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo3b.m
% This demo script uses the function muNCutsRec once to split images
% d2a and d2b to clusters with ncut method.

% clear workspace
clear;
rng(1)

fprintf('\nDemo3b starts here!!!\n');

% load the image
try
    load('dip_hw_2.mat');
    fprintf('\nData have been loaded\n');
catch
    fprintf('\nThe data have not been loaded! Error!!!\n\n');
    
end

% Compute affinity matrix for the 2 images
affinity_of_image_d2a = Image2Graph(d2a);
affinity_of_image_d2b = Image2Graph(d2b);

% Spectral clustering with k = 2 and Ncuts with recursion
clustersk2a = mySpectralClustering(affinity_of_image_d2a, 2);
clustersk2a = reshape(clustersk2a, [50 50]);
clustersk2b = mySpectralClustering(affinity_of_image_d2b, 2);
clustersk2b = reshape(clustersk2b, [50 50]);

clusterska_rec = myNCutsRec(affinity_of_image_d2a, 0, 0, 0.2, 5, 1);
clusterska_rec = reshape(clusterska_rec, [50 50]);
clusterskb_rec = myNCutsRec(affinity_of_image_d2b, 0, 0, 0.2, 5, 1);
clusterskb_rec = reshape(clusterskb_rec, [50 50]);

figure_demo3b_d2a = figure('Name', 'Ncuts Recursion for d2a', 'NumberTitle', 'off');
sgtitle('Recursion Ncut d2a')
subplot(1, 3, 1)
imshow(d2a);
title('Initial Image')
subplot(1, 3, 2)
imshow(clusterska_rec', [1 max(max(clusterska_rec))]);
title('NcutsRec one time');
subplot(1, 3, 3)
imshow(clustersk2a', [1 2]);
title('Spectral for k = 2');


figure_demo3b_d2b = figure('Name', 'Ncuts Recursion for d2b', 'NumberTitle', 'off');
sgtitle('Recursion Ncut d2b')
subplot(1, 3, 1)
imshow(d2b);
title('Initial Image')
subplot(1, 3, 2)
imshow(clusterskb_rec', [1 max(max(clusterskb_rec))]);
title('NcutsRec one time');
subplot(1, 3, 3)
imshow(clustersk2b', [1 2]);
title('Spectral for k = 2');

fprintf('\nDemo3b ends here!!!\n');