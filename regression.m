function  [a,yHandle] = regression(basisCell,x,y)
    X = [];
    
    for i=1:length(basisCell)
        currentFunc = basisCell{i};
        if currentFunc(x) == ones(length(x),1)
            addOn = ones(length(x),1);
            X = [X addOn];
        else
            X = [X currentFunc(x)];
        end
    end
    
    a = [];
    yHandle = @(varOrig) 0;
    
    if det(X' * X) ~= 0              % rank(x' *x) == size(x'*x,2) 
        solution = X\y; 
        for i=1:length(solution)
            a = [a; solution(i)];    % the coeffs
        end
        for i=1:length(solution)
            func = basisCell{i};
            yHandle = @(var) yHandle(var) + a(i)*func(var);
        end
    else
        a = [];
        yHandle = [];
    end
    
end