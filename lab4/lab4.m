%lab 4, Жильцов Никита, var = 5

clear all
clc

%abbe
method = strcat('Abbe')
load A5.DAT
global n
n = length(A5)
x = 1:(n);
scatter(x, A5)
s2 = std(A5);
q2 = (mean(diff(A5).^2))/2;
v = q2/s2
vCritical = 0.295
if v < vCritical
     verdict = strcat('Critical at level 0.001')
else
    verdict = strcat('Non critical at level 0.001')
end
strcat('correct answer: v = 0.11')

%fisher
method = strcat('Fisher')
clear all
global F5
load F5.dat
global n
[n, s] = size(F5)
k1 = s - 1
k2 = n*s - s
global xj
xj = mean(F5, 1);
global xm
xm = mean(mean(F5))
sigmaBC2 = mean(arrayfun(@rowBC,(1:s)))
sigmaMC2 = sum(arrayfun(@rowMC,(1:s)))/(s-1)
F = sigmaMC2/sigmaBC2
FCritical = 2.53
if F > FCritical
     verdict = strcat('Critical at level 0.05')
else
    verdict = strcat('Non critical at level 0.05')
end
FCritical = 3.7
if F > FCritical
     verdict = strcat('Critical at level 0.01')
else
    verdict = strcat('Non critical at level 0.01')
end
correctAnswer = 3.20
%EOF