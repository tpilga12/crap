%MM8 excercise
clc
clear all

syms rho s
% rho belongs to [-1,-1/2] U [1/2,1]
%rho = 1;
A_rho(rho) = [1 rho;
         -4/rho -3];
     
P_rho(rho) = [50+6*rho^2 16*rho;
         16*rho     1+7*rho^2];
     solve(det(s*eye(2)-A_rho),s);
    
 AP(rho)=-transpose(A_rho)*P_rho-P_rho*A_rho
 
 
 aptest = [AP(-1) AP(1)];
 aptest>0
 P_test=[P_rho(-1) P_rho(1)];
 P_test>0
     
%% excercise 2
clc
clear all

rho=-1

A_rho = [-3   -1    0   1;
         rho   1    0   0; 
         0   -rho   1  rho;
         0     0  -rho  1];
     
P = [4  0   0   0;
     -5 -7  -1  1;
     -6 -1  -7  -1;
     -4 1   -1  -7];
 
 AP = -transpose(A_rho)*P-P*A_rho;
 AP>0
