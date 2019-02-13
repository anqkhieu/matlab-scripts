function sortedArray = Shellsort(doubleArray,gapArray)
    if gapArray(1) == 1
        sortedArray = stinsertion(doubleArray);
        return
    end
    
    sortedArray = doubleArray;
    for i = 1:length(gapArray)
        sortedArray = tryme(sortedArray,gapArray(i));
    end
        
end

function sArray = tryme(doubleArray,gapArray)
    n = length(doubleArray);
    sArray = zeros(1,length(doubleArray));
    i = 1;
        %   break and sort
        while ~all(sArray) 
            chunkArray = doubleArray(i:gapArray(1):n);
            sortedChunk = stinsertion(chunkArray);
            for j = 1:length(sortedChunk)
                sArray(i+((j-1)*gapArray(1))) = sortedChunk(j);
            end
            i = i + 1;
        end        
end