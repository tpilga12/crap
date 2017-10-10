%% non-linear mm1 kalman 10/10
clc
clear all

% x_k+1=Phi*x_k+w_k;
% y_k = h*x_k + v_k
Phi = 0.9;
q = 1;
w = normrnd(0,q);
h = 1;
r = [0.1 1 10];
v = normrnd(0,r);

K(k)
