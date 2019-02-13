function sortedArray = mergeSort(doubleArray)
    % divide into halves
    arr1 = doubleArray(:,1:floor(end/2));
    arr2 = doubleArray(:,floor(end/2)+1:end);
    
    if size(doubleArray,2) == 1
        sortedArray = doubleArray;
    end
    if size(doubleArray,2) == 2
        if arr2(1,1) < arr1(1,1)
            sortedArray = [arr2 arr1];
        else
            sortedArray = [arr1 arr2];
        end
    end
    
    if size(doubleArray,2) > 2
        half1 = [mergeSort(arr1)];
        half2 = [mergeSort(arr2)];
        sortedArray = [];
        for i = 1:size(half1,2)
            for j = 1:size(half2,2)
                if half1(1,i) < half2(1,j)
                    half2 = [half2(:,1:j-1) half1(:,i) half2(:,j:end)];
                    break;
                elseif j == size(half2,2)  % already compared with all #s in half2
                    half2 = [half2 half1(:,i)];
                    break;
                end
            end
        end
        sortedArray = half2;
    end 
end