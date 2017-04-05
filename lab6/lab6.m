%lab 6, Жильцов Никита, var = 2

clear all
clc

load x2.DAT
load y2.DAT

subplot(2,2,1);
hist(x2, 10);
title('x');

subplot(2,2,2);
hist(y2, 10);
title('y');

px = hist(x2);
%EOF