%lab 2, Жильцов Никита, var = 3 => p = C*exp(x); 0 <= x <= 1

clear all
clc
y = rand(1, 10000);
c = 1/(exp(1)-1);
x = log(1 + (y/c));
subplot(1,2,1);
hist(x, 100)
text(0, 160, strcat('mean = ', num2str(mean(x))));
text(0, 150, strcat('std = ', num2str(std(x))));
yy = rand(100, 100);
xtmp = log(1 + (yy/c));
xx = mean(xtmp);
subplot(1,2,2);
hist(xx, 35)
text(0.5, 8, strcat('mean = ', num2str(mean(xx))));
text(0.5, 7.5, strcat('std = ', num2str(std(xx))));

%EOF
