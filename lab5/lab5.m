%lab 5, Жильцов Никита, var = 1

clear all
clc
load E1.DAT;
hist(E1);
suspicious = strcat('правая точка')
firstMethod = strcat('критерий Романовского, т.к. n = 14 < 20')
E1 = sort(E1);
%Romanovsky
rom = (abs(E1(length(E1)) - mean(E1(1:(length(E1)-1)))))/std(E1(1:(length(E1)-1)))
if rom < 1.77
     romVerdict = strcat('Romanovsky => Ho true; q =0.1')
elseif rom < 2.16
    romVerdict = strcat('Romanovsky => Ho false; q =0.1')
    romVerdict = strcat('Romanovsky => Ho true; q =0.05')
elseif rom < 3.01
    romVerdict = strcat('Romanovsky => Ho false; q =0.1')
    romVerdict = strcat('Romanovsky => Ho false; q =0.05')
    romVerdict = strcat('Romanovsky => Ho true; q =0.01')
else
    romVerdict = strcat('Romanovsky => Ho false; q =0.01')
end
%Dickson
Dickson = (E1(length(E1)) - E1(length(E1) - 2))/(E1(length(E1)) - E1(3))
if Dickson < 0.29
     DVerdict = strcat('Dickson => Ho true; q =0.1')
elseif Dickson < 0.35
    DVerdict = strcat('Dickson => Ho false; q =0.1')
    DVerdict = strcat('Dickson => Ho true; q =0.05')
elseif Dickson < 0.41
    DVerdict = strcat('Dickson => Ho false; q =0.1')
    DVerdict = strcat('Dickson => Ho false; q =0.05')
    DVerdict = strcat('Dickson => Ho true; q =0.02')
elseif Dickson < 0.45
    DVerdict = strcat('Dickson => Ho false; q =0.1')
    DVerdict = strcat('Dickson => Ho false; q =0.05')
    DVerdict = strcat('Dickson => Ho false; q =0.02')
    DVerdict = strcat('Dickson => Ho true; q =0.01')
else
    DVerdict = strcat('Dickson => Ho false; q =0.01')
end
%Shovene
m = mean(E1);
s = std(E1);
crit = (E1(length(E1)) - m)/s

c = 1;
tmp = zeros(1,1000);
x = zeros(1, 1000);
while c < 1000
    x(c) = crit + c*0.01;
    tmp(c) = f(x(c));
    c = c + 1;
end
nExp = length(E1)*trapz(x, tmp)
if nExp >= 0.5
    shovVerdict = strcat('Shovene => Ho true')
else 
    shovVerdict = strcat('Shovene => Ho false')
end
%EOF