%Lab = 1, Жильцов Никита, var = 3

clear all
clc
load ST_3.DAT;
x=ST_3(:,1);
y=ST_3(:,2);

plot(x, y)
xlabel('x')
ylabel('y')
title('y(x)')
%1
fprintf('1) N = %6.1i\n', length(x))
%2f
xm = mean(y);
fprintf('2) Xcp = %4.2f\n', xm)
%3
rn = mean(abs(y-xm));
fprintf('3) rn = %4.2f\n', rn)
%4
fprintf('4) Ssn2 = %4.2f\n', mean(abs(y-xm).^2))
%5
D = sum(abs(y-xm).^2)/(length(y) - 1);
fprintf('5) D = Sn2 = %4.2f\n', D)
%6
Sn = sqrt(D);
fprintf('6) Sn = %4.2f\n', Sn)
%7
fprintf('7) Sa = %4.2f\n', Sn/sqrt(length(y)))
%8
fprintf('8) Std = %4.2f\n', std(y))
%9
fprintf('9) A = %4.2f\n', sum((y - xm).^3)/(length(y)*D^(1.5)))
%10
fprintf('10) E = %4.2f\n', (sum((y - xm).^4)/(length(y)*D^(2))) - 3)
%11
fprintf('11) W = %4.2f\n', Sn*100/xm)
%12
fprintf('12) Sn/rn = %4.2f\n', Sn/rn)