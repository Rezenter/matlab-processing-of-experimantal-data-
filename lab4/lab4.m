%lab 4, Жильцов Никита, var = 5

clear all
clc
load A5.DAT;
n = length(A5)
x = 1:n;
scatter(x, A5)
s = std(A5);
q = mean(diff(A5).^2)/2;
v = q/s
vq = 0.578
if v < vq
     verdict = strcat('Critical at level 0.05')
else
    verdict = strcat('Non critical at level 0.05')
end

%EOF