function y=bsearch(x,key,left,right)

% Input sorted vector x and key
% Input initial array indices
% Output vector y=[left right] of the left and right index of x
% such that key lies in the domain (x(k),x(k+1))
% Use binary search with recursion
% Use bisection

if(left < right-1) 
    mid = floor((left+right)*0.5);  
    if((key-x(left))*(key-x(mid)) <= 0)    
        y = bsearch(x,key,left,mid);  
    elseif((key-x(mid))*(key-x(right)) <= 0)    
        y = bsearch(x,key,mid,right);  
    elseif((x(right) >= x(left) & key > x(right)) | ...         
            (x(left) >= x(right) & key < x(left)))    
        y = [right nan];  
    else
        y = [nan left];
    end
else
    y = [left right];
end
