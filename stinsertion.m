function sortedArray = stinsertion(doubleArray)

% Determine the length of the vector
n = length(doubleArray);

% Initialize output vector
sortedArray = zeros(1,n);

% Insert first number
sortedArray(1) = doubleArray(1);

% Sort in ascending order
for k=1:n-1               % number of data after first number is inserted  
    l=1; 
    while (l <= k & doubleArray(k+1) > sortedArray(l) )    
        l = l+1;  
    end
    for m=l:k                               % number of data to be shifted    
        sortedArray(k-m+l+1) = sortedArray(k-m+l);  
    end
    sortedArray(l) = doubleArray(k+1);      % insert new entryend
end