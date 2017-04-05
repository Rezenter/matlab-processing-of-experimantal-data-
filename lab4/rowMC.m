function out = rowMC(j)
%ROWMC Summary of this function goes here
global xj
global n 
global xm
out = n*((xj(j) - xm)^2);
end

