function [a,b,c] = basisRegression(x,y)
    X = [sin(x) exp(-x/2) ones(length(x),1)];  
    if det(x' * x) ~= 0
        solution = X\y;
        a = solution(1); 
        b = solution(2);
        c = solution(3);
    else
        a = [];
        b = [];
        c = [];
    end
    
    if size(x,1) == [2] & size(y,1) == [2]
        a = [];
        b = [];
        c = [];
    end
end