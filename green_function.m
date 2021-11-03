function value = f(r,R)
    if R/r <= 0
        value = 0;
    else
        value = log(R/r)/(2*pi);
end