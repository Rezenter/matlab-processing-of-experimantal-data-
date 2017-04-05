function out = rowBC(i)
%ROWBC calculates (x(i, j) - xj)^2 for row i
global F5
global xj
[n, s] = size(F5);
out = ((sum((F5(i,:) - xj).^2))/(n-1));

end

