function [m,b] = linearRegression(x,y)
    X = [ones(length(x),1) x];  
    if det(x' * x) ~= 0
        solution = inv(X'*X)*(X'*y);  % or X\y
        b = solution(1); % the y-int
        m = solution(2); % the slope
    else
        m = [];
        b = [];
    end
end
