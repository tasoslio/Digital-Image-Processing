%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo3c.m
% This demo script uses the function muNCuts recursive to split images
% d2a and d2b to clusters with ncut method.

% clear workspace
clear;
rng(1)

fprintf('\nDemo3c starts here!!!\n');

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

% Spectral clustering, ncuts with k = 2,3 and Ncuts with recursion
clustersk2a = mySpectralClustering(affinity_of_image_d2a, 2);
clustersk2a = reshape(clustersk2a, [50 50]);
clustersk2b = mySpectralClustering(affinity_of_image_d2b, 2);
clustersk2b = reshape(clustersk2b, [50 50]);

clustersk3a = mySpectralClustering(affinity_of_image_d2a, 3);
clustersk3a = reshape(clustersk3a, [50 50]);
clustersk3b = mySpectralClustering(affinity_of_image_d2b, 3);
clustersk3b = reshape(clustersk3b, [50 50]);

clustersk2a_ncuts = myNCuts(affinity_of_image_d2a, 2);
clustersk2a_ncuts = reshape(clustersk2a_ncuts, [50 50]);
clustersk2b_ncuts = myNCuts(affinity_of_image_d2b, 2);
clustersk2b_ncuts = reshape(clustersk2b_ncuts, [50 50]);

clustersk3a_ncuts = myNCuts(affinity_of_image_d2a, 3);
clustersk3a_ncuts = reshape(clustersk3a_ncuts, [50 50]);
clustersk3b_ncuts = myNCuts(affinity_of_image_d2b, 3);
clustersk3b_ncuts = reshape(clustersk3b_ncuts, [50 50]);


clusterska_rec = myNCutsRec(affinity_of_image_d2a, 0, 0, 0.51, 5, 0);
clusterska_rec = reshape(clusterska_rec, [50 50]);
clusterskb_rec = myNCutsRec(affinity_of_image_d2b, 0, 0, 0.79, 5, 0);
clusterskb_rec = reshape(clusterskb_rec, [50 50]);

figure_demo3c_d2a = figure('Name', 'NCutRec d2a', 'NumberTitle', 'off');
sgtitle('Ncut (Recursive) Clustering d2a')
subplot(2, 3, 1)
imshow(d2a)
title('Initial Image')
subplot(2, 3, 2)
imshow(clustersk2a', [1 2]);
title('Spectral, k = 2')
subplot(2, 3, 3)
imshow(clustersk3a', [1 3]);
title('Spectral, k = 3')
subplot(2, 3, 4)
imshow(clusterska_rec', [1 max(max(clusterska_rec))]);
title('NCutsRec')
subplot(2, 3, 5)
imshow(clustersk2a_ncuts', [1 2]);
title('Ncuts, k = 2')
subplot(2, 3, 6)
imshow(clustersk3a_ncuts', [1 3]);
title('Ncuts, k = 3')


figure_demo3c_d2b = figure('Name', 'NCutRec d2b', 'NumberTitle', 'off');
sgtitle('Ncut (Recursive) Clustering d2b')
subplot(2, 3, 1)
imshow(d2b)
title('Initial Image')
subplot(2, 3, 2)
imshow(clustersk2b', [1 2]);
title('Spectral, k = 2')
subplot(2, 3, 3)
imshow(clustersk3b', [1 3]);
title('Spectral, k = 3')
subplot(2, 3, 4)
imshow(clusterskb_rec', [1 max(max(clusterskb_rec))]);
title('NCutsRec')
subplot(2, 3, 5)
imshow(clustersk2b_ncuts', [1 2]);
title('Ncuts, k = 2')
subplot(2, 3, 6)
imshow(clustersk3b_ncuts', [1 3]);
title('Ncuts, k = 3')

fprintf('\nDemo3c ends here!!!\n');