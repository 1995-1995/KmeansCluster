% Input: image and the number of cluster
%Output:values of final cluster center, cluster labels in corresponding
%coordinates of original image's pixels, T is the times of doing clustering
%T is only for the convenience of analysing difference between kmeans and
%kmeans++, you do not need to use it in visualization part
function [ClusterCenter, label,T] = my_kmeans(img,k) %K is the number of cluster
I = img;
[m,n,l] = size(I);
Reshape = reshape(I,m*n,l);                                  %reshape the matrix to a 2-D one for the convenience of computing
                                                                           %each row index will be the line index of each layer of original image
RandNum = randperm(m*n,k);                                %choose the index of clusters
ClusterCenter = Reshape(RandNum,:);                   %find the center points of input matrix, clumn corresponding to value of every layer
label = zeros(m*n,1);                                             % mark the cluster
T = 0;
while true                                                             % cluster the sample iterately
    initialCluster = ClusterCenter;
    for i = 1:m*n               
            temp = inf;                                               %Temp is aim to contain the best norm of vector
        for j =1:k
            if norm(Reshape(i,:)-ClusterCenter(j,:)) <= temp   %Compare the current difference and the early found best cluster
                temp = norm(Reshape(i,:)-ClusterCenter(j,:));   % if current distance is smaller,  Change temp to current distance
                label(i) = j;                                            % assgn chosen cluster to label
            end
        end
    end
    for i = 1:k                                                         % renew the cluster center for different times
        ClusterCenter(i,:) = sum(Reshape(find(label == i),:),1)/(sum(label == i)); % Using the mean value of clustered fata as new Cluster center
    end
    if ClusterCenter == initialCluster                        % If the cluster center did not change, break the while loop
        break
    end
     T = T+1;
end
label = reshape(label,m,n);                                    %Reshape the cluster to input image size for the convenience of visualization
end

