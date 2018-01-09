clc
clear all

A = [0 1; 4 -7];
B = [0; 1];
C = [1 0];
D = [0 0];
m = 2;
F1 = [ -8.12 -1.14];
L1 = [10.7; -5.68];
Utilde1 = ss(A + L1*C, -L1, F1, 0);
Vtilde1 = ss(A + L1*C, -B -L1*D, F1, eye(m));