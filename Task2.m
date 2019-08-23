%% Visualisation using pepper.png
%% Encoding dataset
I = imread('peppers.png'); 
[m,n,l] = size(I);
I = im2uint8(I);
I = rgb2lab(I);
Include = zeros([m,n,l+2]);
Include(:,:,1) = I(:,:,1);
Include(:,:,2) = I(:,:,2);
Include(:,:,3) = I(:,:,3);
for i = 1:m                                                            %Encoding coordinats information into data set, row information in                                                                                 
    for j = 1:n                                                          % layer 4 and column information in layer5
        Include(i,j,l+1) = i;
         Include(i,j,l+2) = j;
    end
end
%% Visualize peppers.png in my_kmeans withoutCoordinates;
[ClusterCenter,label]= my_kmeans(I,3);
[ClusterCenter2,label2]= my_kmeans(I,6);
withoutCoordinates = VisualizationKmean(ClusterCenter,label,3);                   %input data set without coordinates information 
withoutCoordinates2 = VisualizationKmean(ClusterCenter2,label2,6);    
figure;
subplot(1,2,1);
imshow(withoutCoordinates);
title('K=3')
subplot(1,2,2);
imshow(withoutCoordinates2);
title('K=6');
%% compare with and without coordinates 
[ClusterCenter,label]= my_kmeans(I,6);
[ClusterCenter2,label2]= my_kmeans(Include,6);
withoutCoordinates = VisualizationKmean(ClusterCenter,label,6);                   %input data set without coordinates information 
withCoordinates2 = VisualizationKmean(ClusterCenter2,label2,6);    
figure;
subplot(1,2,1);
imshow(withoutCoordinates);
title('withoutCoordinates in K-means(pepper.png)')
subplot(1,2,2);
imshow(withCoordinates2);
title('withCoordinates in K-means(pepper.png)');
%% Compare K-means and K-means++ without coordinates;
[ClusterCenter,label]= my_kmeans(I,6);
[ClusterCenter2,label2]= my_KmeansPlus(I,6);
kmeanPepper = VisualizationKmean(ClusterCenter,label,6);                   %input data set without coordinates information 
kmeanPlusPepper = VisualizationKmean(ClusterCenter2,label2,6);    
figure;
subplot(1,2,1);
imshow(kmeanPepper);
title('k-means')
subplot(1,2,2);
imshow(kmeanPlusPepper);
title('k-means++');
%% compare kmeans and kmeans++ with coordinates
[ClusterCenter,label]= my_kmeans(Include,6);
[ClusterCenter2,label2]= my_KmeansPlus(Include,6);
kmeanPepperIn = VisualizationKmean(ClusterCenter,label,6);                   %input data set without coordinates information 
kmeanPlusPepperIn = VisualizationKmean(ClusterCenter2,label2,6);    
figure;
subplot(1,2,1);
imshow(kmeanPepperIn);
title('k-means')
subplot(1,2,2);
imshow(kmeanPlusPepperIn);
title('k-means++');
%% Visualize pepper.png in my_kmeans with coordinates;


%%
%Visualize in mandm.png
%%encoding data
I_ = imread('mandm.png'); 
I_(:,:,1);
[m,n,l] = size(I_);
I_ = rgb2lab(I_);
Include_ = zeros([m,n,l+2]);
Include_(:,:,1) = I_(:,:,1);
Include_(:,:,2) = I_(:,:,2);
Include_(:,:,3) = I_(:,:,3);
for i = 1:m                                                            %Encoding coordinats information into data set, row information in                                                                                 
    for j = 1:n                                                          % layer 4 and column information in layer5
        Include_(i,j,l+1) = i;
         Include_(i,j,l+2) = j;
    end
end

%% Visualize peppers.png in my_kmeans withoutCoordinate
[ClusterCenter_,label_]= my_kmeans(I_,4);
[ClusterCenter2_,label2_]= my_kmeans(I_,7);
withoutCoordinates_ = VisualizationKmean(ClusterCenter_,label_,4);                   %input data set without coordinates information 
withoutCoordinates2_ = VisualizationKmean(ClusterCenter2_,label2_,7);    
figure;
subplot(1,2,1);
imshow(withoutCoordinates_);
title('K=4')
subplot(1,2,2);
imshow(withoutCoordinates2_);
title('K=7');
%% compare with and without coordinates 
[ClusterCenter_,label_]= my_kmeans(I_,7);
[ClusterCenter2_,label2_]= my_kmeans(Include_,7);
withoutCoordinates_ = VisualizationKmean(ClusterCenter_,label_,7);                   %input data set without coordinates information 
withCoordinates_ = VisualizationKmean(ClusterCenter2_,label2_,7);    
figure;
subplot(1,2,1);
imshow(withoutCoordinates_);
title('Compare with and without coordinates(mandm.png)')
subplot(1,2,2);
imshow(withCoordinates_);
title('Compare with and without coordinates(mandm.png)');
%% Compare Kmeans and Kmeans++ without coordinates
[ClusterCenter_,label_]= my_kmeans(I_,7);
[ClusterCenter2_,label2_]= my_KmeansPlus(I_,7);
kmeanMandM = VisualizationKmean(ClusterCenter_,label_,7);                   %input data set without coordinates information 
kmeanPlusMandM = VisualizationKmean(ClusterCenter2_,label2_,7);    
figure;
subplot(1,2,1);
imshow(kmeanMandM);
title('k-means')
subplot(1,2,2);
imshow(kmeanPlusMandM);
title('k-means++');
%% Compare Kmeans and Kmeans++ with coordinates
[ClusterCenter_,label_]= my_kmeans(Include_,7);
[ClusterCenter2_,label2_]= my_KmeansPlus(Include_,7);
kmeanMandMIn = VisualizationKmean(ClusterCenter_,label_,7);                   %input data set without coordinates information 
kmeanPlusMandMIn = VisualizationKmean(ClusterCenter2_,label2_,7);    
figure;
subplot(1,2,1);
imshow(kmeanMandMIn);
title('k-means')
subplot(1,2,2);
imshow(kmeanPlusMandMIn);
title('k-means++');









