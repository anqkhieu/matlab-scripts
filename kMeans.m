function clusterList = kMeansClustering(meanList, dataset, k, dist, tol, maxIter)

    clusterList = zeros(size(dataset,1),1);
    meanListOld = meanList + tol*2;  % go through loop once
    iter = 0;
    
    % meanslist is k x d; k is number of means/clusters
    % dataset is n x d
    
    while (any(dist(meanListOld, meanList) > tol)) & (iter < maxIter)
        for i = 1:size(dataset,1)  
            distances = [];

            % which cluster mean is closest via minimal distance
            for j = 1:k
                distances = [distances dist(dataset(i,:), meanList(j,:))];
            end
            [~,kI] = min(abs(distances));
            
            
            clusterList(i) = kI;
        end
        
            meanListOld = meanList;
            
            % updating mean list
            for clusterNum = 1:k
                indices = find(clusterList==clusterNum);
                
                % update mean for respective dimension
                for d = 1:size(meanList,2)  % the number of dimensions
                    if ~isempty(indices)
                        meanList(clusterNum,d) = sum(dataset(indices,d)) / (length(indices));
                    end
                end
            end
            
        iter = iter + 1;
    end
    
end

function [labels1, h1, labels2, h2, labels3, h3] = kMeansTest()
    dist = @(x,y) sqrt(sum((x-y).^2));
    
    h1 = figure();
    hold on
    load('dataKMeans1.mat')
    labels1 = kMeansClustering(testData(1:3,:), testData, 3, dist, 10^-6, 1000)
    c1 = testData(find(labels1==1),:)
    scatter(c1(:,1),c1(:,2))
    c2 = testData(find(labels1==2),:)
    scatter(c2(:,1),c2(:,2))
    c3 = testData(find(labels1==3),:)
    scatter(c3(:,1),c3(:,2))
    hold off
    gcf
end
     