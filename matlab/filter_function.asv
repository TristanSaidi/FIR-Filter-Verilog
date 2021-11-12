function y = filter_function(x,b)
    
    y = zeros(size(x));
    nx = length(x);
    
    for n=1:nx
        for i = 1:64
            if (i < n)
                y(n) = y(n) + b(i)*x(n-i);
            end
        end
    end
end