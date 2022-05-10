function nCutValue = calculateNcut(anAffinityMat , clusterIdx)
%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% Returns the value of the cost of the ncut method
%VARIABLES
% anAffinityMat = the affinity matrix for calculating the ncut cost
% nCutValue = the cost of ncut algorithm
% clusterIdx = the clusters' labels where every node belongs to

% Main diagonial = 0 
W = anAffinityMat - diag(diag(anAffinityMat));

% Split the matrix W based on the clusterIdx 
cluster_A = clusterIdx == 1;
cluster_B = clusterIdx == 2;

% Compute assocAA,assocAV,assocBB,assocBV based on the paper
assocAA = sum(sum(W(cluster_A, cluster_A)));
assocAV = sum(sum(W(cluster_A, :)));
assocBB = sum(sum(W(cluster_B, cluster_B)));
assocBV = sum(sum(W(cluster_B, :)));

% Compute NassocAB based on the paper
NassocAB = (assocAA / assocAV) + (assocBB / assocBV);

% Return nCutValue
NcutAB = 2 - NassocAB;
nCutValue = NcutAB;
end