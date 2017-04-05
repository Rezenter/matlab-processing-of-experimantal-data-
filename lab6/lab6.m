%lab 6, Жильцов Никита, var = 2

clear all
clc

load x2.DAT
load y2.DAT

subplot(3,2,1);
hist(x2, 10);
title('x');

subplot(3,2,2);
hist(y2, 10);
title('y');

[px, xm] = hist(x2,10);
px = px/length(x2);
subplot(3,2,3);
bar(xm, px);
title('Px');
xlabel('Xmi')
ylabel('Pxi')

[py, ym] = hist(y2,10);
py = py/length(y2);
subplot(3,2,4);
bar(ym, py);
title('Py');
xlabel('Ymi')
ylabel('Pyi')

k = 1;
z = zeros(20, 2);
for i1 = 1:10
    for i2 = 1:10
        z(k, 1) = xm(i1) + ym(i2);
        z(k, 2) = px(i1)*py(i2);
        k = k + 1;
    end
end
z = sortrows(z, 1);
f = zeros(1, 20);
for c = 1:k-1
    if c == 1
        f(c) = z(c, 2);
    else
        f(c) = f(c - 1) + z(c, 2);
    end
end
subplot(3,2,5);
plot(z(:,1), f);
ylim([0,1]);
title('F');
ylabel('F(z)')
xlabel('z')

quantile = 1;
index = 100;
while quantile > 0.95
    index = index - 1;
    quantile = f(index);
end
quantileMin = z(index, 1)
%real quantile here
quantileMax = z(index + 1, 1)
%EOF