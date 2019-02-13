function S = damping(k1,k2,initialGuess)
    tol = 1e-7;
    f = @(t) k1 * cos(pi*t) * exp(-t/(k2*pi));
    df = @(t) -k1*pi*exp(-t/(k2*pi))*sin(pi*t) - (k1*exp(-t/(k2*pi))*cos(pi*t))/(k2*pi)
    S(1).newton = myNewton(f, df, initialGuess, tol)
    S(1).bisect_root = bisection(f, initialGuess+0.5, initialGuess-0.5, tol)
    S(1).fzero_root = fzero(f,initialGuess)
end

function newton_root = myNewton(f, df, x0, tol)
	oldApprox = x0
	newApprox = oldApprox - (f(oldApprox)/df(oldApprox))
	while abs((oldApprox-newApprox)/newApprox) > tol
    	oldApprox = newApprox
    	newApprox = oldApprox - (f(oldApprox)/df(oldApprox))
	end
	newton_root = newApprox
end


function bisect_root = bisection(f, a, b, tol)
    x_right = a;
    x_left = b;
    
    while x_right - x_left > tol
        x_middle = (x_right + x_left) / 2;  
        if sign(f(x_right)) == sign(f(x_middle))
            x_right = x_middle;
        else % then x_left's sign == x_middle's sign
            x_left = x_middle;
        end       
    end
    
    if x_right - x_left <= tol
        bisect_root = x_middle;
    end
end

