function Img = VisualizationKmean(ClusterCenter,label,k)  %%input value of clustercenters, cluster musks and number of centers
[m,n] = size(label);
I_Clustered = zeros([m,n,3]);
L = I_Clustered(:,:,1);
A = I_Clustered(:,:,2);
B = I_Clustered(:,:,3);
for i=1:k
    Index = find(label==i);                                       %%assign value of cluster center to corresponding space
    L(Index) = ClusterCenter(i,1);
    A(Index) = ClusterCenter(i,2);
    B(Index) = ClusterCenter(i,3);
end
I_Clustered(:,:,1) = L;
I_Clustered(:,:,2) = A;
I_Clustered(:,:,3) = B;
Img = lab2rgb(I_Clustered);
end