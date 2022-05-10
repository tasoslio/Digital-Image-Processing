%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo1.m
% This demo script uses the function mySpectralClustering to split an image
% with affinity matrix d1a to clusters

% clear workspace
clear;
rng(1)

fprintf('\nDemo1 starts here!!!\n');

% load the image
try
    load('dip_hw_2.mat');
    fprintf('\nData have been loaded\n');
catch
    fprintf('\nThe data have not been loaded! Error!!!\n\n');
end

% Make Spectral Clustering in affinitymatrix d1a for k = 2,3,4
fprintf('\nPrint clusters for spectral clustering for k = 2\n');
clustersk2 = mySpectralClustering(d1a, 2);
disp(clustersk2);
clustersk2 = reshape(clustersk2, [3 4]);
figure_demo1 = figure('Name', 'Spectral Clustering in affinity matrix d1a','Numbertitle', 'off');
sgtitle = ('D1a Spectral Clustering');
subplot(2, 2, 1)
imshow(d1a);
title('Affinity matrix d1a')
subplot(2, 2, 2)
imshow(clustersk2', [1, 2]);
title('Spectral Clustering, k = 2')
fprintf('\nPrint clusters for spectral clustering for k = 3\n');
clustersk3 = mySpectralClustering(d1a, 3);
disp(clustersk3);
clustersk3 = reshape(clustersk3, [3 4]);
subplot(2, 2, 3)
imshow(clustersk3', [1, 3]);
title('Spectral Clustering, k = 3')
fprintf('\nPrint clusters for spectral clustering for k = 4\n');
clustersk4 = mySpectralClustering(d1a, 4);
disp(clustersk3);
clustersk4 = reshape(clustersk4, [3 4]);
subplot(2, 2, 4)
imshow(clustersk4', [1, 4]);
title('Spectral Clustering, k = 4')

fprintf('\nDemo1 ends here!!!\n');