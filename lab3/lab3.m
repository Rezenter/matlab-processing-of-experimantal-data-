%lab 3, Жильцов Никита, var = 4

clear all
clc
load Distr4.DAT;
subplot(2,2,1);
hystogram = hist(Distr4, 10);
hist(Distr4, 10)
text(-3.9, 36, strcat('experimental'));
text(-3.9, 33, strcat('unprocessed'));
min = min(Distr4);
max = max(Distr4);
n = 1;
h = (max - min)/10;
x = zeros(1, 11);
tmp = zeros(1, 11);
summ = zeros(1, 11);
xm = mean(Distr4);
s = std(Distr4);
z = zeros(1, 10);
while n < 11
    x(n) = min + (h/2) + (n-1)*h;
    tmp(n) = f((x(n) - xm)/s);
    summ(n) = length(Distr4)*(trapz(tmp) - trapz(tmp(1:n)));
    n = n + 1;
end
subplot(2,2,2);
bar(x(1:10), summ(1:10))
text(-3, 26, strcat('theoretical'));
text(-3, 23, strcat('unprocessed'));
summ(2) = summ(2) + summ(1);
summ(9) = summ(9) + summ(10);
subplot(2,2,4);
bar(x(2:9), summ(2:9))
text(-2.9, 26, strcat('theoretical'));
text(-2.9, 23, strcat('processed'));
subplot(2,2,3);
hystogram(2) = hystogram(2) + hystogram(1);
hystogram(9) = hystogram(9) + hystogram(10);
bar(x(2:9), hystogram(2:9))
text(-2.9, 36, strcat('experimental'));
text(-2.9, 33, strcat('processed'));

k = 8
alpha = 0.05
p = 11.07
n = 1;
res = 0;
while n <= 8
    n = n + 1; %placed before usage of "n" on purpose!
    res = res + ((summ(n) - hystogram(n))^2)/hystogram(n);
end
res
if res < p
     verdict = strcat('Ho true')
else
    verdict = strcat('Ho false')
end
%EOF