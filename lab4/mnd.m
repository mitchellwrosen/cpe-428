function px = mnd(x, u, c)
   centered_x = x - u;

   a = ((2*pi)^(columns(x)/2)) * (det(c)^(0.5));
   b = -0.5 * sum(centered_x / c .* centered_x, 2);
   px = 1/a * exp(b);
end
