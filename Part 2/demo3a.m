%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% demo3a.m
% This demo script uses the function muNCuts to split images
% d2a and d2b to clusters with ncut method.

% clear workspace
clear;
rng(1)

fprintf('\nDemo3a starts here!!!\n');

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

% Compute clusters of the 2 image for k = 2, 3, 4 and reshape
clustersk2a = myNCuts(affinity_of_image_d2a, 2);
clustersk2a = reshape(clustersk2a, [50 50]);
clustersk2b = myNCuts(affinity_of_image_d2b, 2);
clustersk2b = reshape(clustersk2b, [50 50]);

clustersk3a = myNCuts(affinity_of_image_d2a, 3);
clustersk3a = reshape(clustersk3a, [50 50]);
clustersk3b = myNCuts(affinity_of_image_d2b, 3);
clustersk3b = reshape(clustersk3b, [50 50]);

clustersk4a = myNCuts(affinity_of_image_d2a, 4);
clustersk4a = reshape(clustersk4a, [50 50]);
clustersk4b = myNCuts(affinity_of_image_d2b, 4);
clustersk4b = reshape(clustersk4b, [50 50]);

% Plot 2 figures
figure_demo3a_imaged2a = figure('Name', 'Ncuts for the 2 images', 'NumberTitle', 'off');
sgtitle('D2a Ncuts')
subplot(2, 2, 1)
imshow(d2a);
title('Initial Image')
subplot(2, 2, 2)
imshow(clustersk2a', [1 2]);
title('D2a Ncuts, k = 2')
subplot(2, 2, 3)
imshow(clustersk3a', [1 3]);
title('D2a Ncuts, k = 3')
subplot(2, 2, 4)
imshow(clustersk4a', [1 4]);
title('D2a Ncuts, k = 4')

figure_demo3a_imaged2b = figure('Name', 'Ncuts for the 2 images', 'NumberTitle', 'off');
sgtitle('D2b Ncuts')
subplot(2, 2, 1)
imshow(d2b);
title('Initial Image')
subplot(2, 2, 2)
imshow(clustersk2b', [1 2]);
title('D2a Ncuts, k = 2')
subplot(2, 2, 3)
imshow(clustersk3b', [1 3]);
title('D2a Ncuts, k = 3')
subplot(2, 2, 4)
imshow(clustersk4b', [1 4]);
title('D2a Ncuts, k = 4')

fprintf('\nDemo3a ends here!!!\n');