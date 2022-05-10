function clusterIdx = myNCutsRec(anAffinityMat, oldClusterIdx, k, T1, T2, isonce)
%% Digital Image Processing Assignment Part 2
% Full Name : Liolios Anastasios
% Email : lioliosaa@ece.auth.gr
% AEM : 9171
%% Returns the labels that shows the cluster where every node belongs from an affinity matrix  with recursive ncut method
%VARIABLES
% anAffinityMat = the affinity matrix for recursive ncut method
% k = the max label for cluster
% clusterIdx = the clusters' labels where every node belongs to
% T1 = the first threshold value
% T2 = the second threshold value
% oldClusterIdx = the old cluster before recursive n cut

% Split first to 2 clusters
clusterIdx = myNCuts(anAffinityMat, 2);

% Find the 2 clusters and calculate the ncutValue
cluster_A = clusterIdx == 1;
labels_A = sum(cluster_A(:) == 1);

cluster_B = clusterIdx == 2; 
labels_B = sum(cluster_B(:) == 1);
nCutValue = calculateNcut(anAffinityMat, clusterIdx);
fprintf('Ncut cost: %d\n',nCutValue);

% Check if ncut is correct
if nCutValue > T1 || labels_A < T2 || labels_B < T2
    if oldClusterIdx == 0
        return
    else 
        clusterIdx = oldClusterIdx;
        return
    end
    
else
    if isonce == 0
        % Fix the labels
        clusterIdx = clusterIdx + k;
        % Create 2 affinity matrixes for the splitted clusters
        cluster_A_affinity = anAffinityMat(cluster_A, cluster_A);
        cluster_B_affinity = anAffinityMat(cluster_B, cluster_B);
        % Call myNcutsRec for recursive method
        new_k = max(clusterIdx);
        % First for cluster A
        clusterIdx(cluster_A) = myNCutsRec(cluster_A_affinity, clusterIdx(cluster_A), new_k, T1, T2, 0);
        % Fix k after ncut to cluster_A
        new_k = max(clusterIdx);
        % Now for cluster B
        clusterIdx(cluster_B) = myNCutsRec(cluster_B_affinity, clusterIdx(cluster_B), new_k, T1, T2, 0);
    end
    
end
    

end