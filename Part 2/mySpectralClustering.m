function clusterIdx = mySpectralClustering(anAffinityMat , k)
%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% Returns the labels that shows the cluster where every node belongs from an affinity matrix 
%VARIABLES
% anAffinityMat = the affinity matrix for spectral clustering
% k = the numbers of clusters
% clusterIdx = the clusters' labels where every node belongs to

% Compute Laplacian
W = anAffinityMat;
D = diag(sum(W(:, :)));
L = D - W;

% Compute the Eigenvectors with eigs
[U, ~] = eigs(L, k, 'smallestreal');

% Perfom the k means algorithm to find the clusters
clusterIdx = kmeans(U, k);
end
