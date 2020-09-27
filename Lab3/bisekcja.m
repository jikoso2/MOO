function [x, p, u] = bisekcja(x0, p0, N)
    x(1) = x0;
    p(1) = p0;

    for i=1:N
        x(i+1) = 1.25*x(i) - 0.125*p(i);
        p(i+1) = p(i) - 2*x(i);
        u(i)   = -0.25*p(i) + 0.5*x(i);
    end
end