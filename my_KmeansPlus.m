% Input: image and the number of cluster
%Output:values of final cluster center, cluster labels in corresponding
%coordinates of original image's pixels, T is the times of doing clustering
%T is only for the convenience of analysing difference between kmeans and
%kmeans++, you do not need to use it in visualization part
function [ClusterCenter,label,T] = my_KmeansPlus(Img,k)
I = Img;
[m,n,l] = size(I);
Distance = zeros(m*n,3);                                        %Make a container to store distance
Reshape = reshape(I,m*n,l);                                  %reshape the matrix to a 2-D one for the convenience of computing
                                                                           %each row index will be the line index of each layer of original image      
RandNum = randperm(m*n,1);                                %choose the first cluster
[x,y] = ind2sub(I(:,:,1),RandNum);                           %Find the pixel location
Recx = zeros(size(I(:,:,1)))+x;
Recy = zeros(size(I(:,:,1)))+y;
Realx = zeros(size(I(:,:,1)));
Realy = zeros(size(I(:,:,1)));                                   % make matrix to store selected center's location
for i = 1:m
    for j = 1:n
        Realx(i,j) = i;                                                %make matrix to store pixel location
        Realy(i,j) = j;
    end
end
T =  (Realy-Recy).^2+ (Realx-Recx).^2;                  %Find D^2, using matrix to compute can be more quikly
Distance(:,1) = reshape(T,m*n,1);                          
SumDistance = sum(Distance(:,1));
Distance(:,2) = Distance(:,1)./SumDistance;           %Find possibility Di^2/sum(D)^2
Distance(:,3) = cumsum(Distance(:,2));                  %compute weight 
ClusterIndex = zeros(k,1);
ClusterIndex(1) = RandNum;                                  % Select the seconde center
for r = 2:k                                                             % repeat the step to find other cluster centers;
    P = rand(1);
    Ind = 0;
for i = 1:m*n-1
    if Distance(i,3)<P&&Distance(i+1,3)>P
         Ind=i+1;
         break;
    end
end
 ClusterIndex(r) = Ind;
 [x_,y_] = ind2sub(I(:,:,1),RandNum);
Recx = zeros(size(I(:,:,1)))+x_;
Recy = zeros(size(I(:,:,1)))+y_;
T =  (Realy-Recy).^2+ (Realx-Recx).^2;
Distance(:,1) = reshape(T,m*n,1);
SumDistance = sum(Distance(:,1));
Distance(:,2) = Distance(:,1)./SumDistance;
Distance(:,3) = cumsum(Distance(:,2));
end
for i = 1:k
    ClusterCenter(i,:) = Reshape(ClusterIndex(i),:);
end 
label = zeros(m*n,1);                                             % mark the cluster
T=0;
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
    if ClusterCenter == initialCluster                         % If thi cluster center did not change, break the while loop
        break
    end
    T=T+1;
end
label = reshape(label,m,n);                                    %Reshape the cluster to input image size for the convenience of visualization
end

