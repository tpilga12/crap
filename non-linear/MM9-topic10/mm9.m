clc
clear all

p1 = 1;
p2 = 2;
A1 = [-1 0; p1 -p1];
A2 = [-1 0; p2 -p2];

P = sdpvar(2,2,'symmetric');

objective = 1;
constraint1 = A1'*P + P*A1 <= 0;
constraint2 = A2'*P + P*A2 <= 0;
constraint3 = P >= 0;
res = optimize([constraint1,constraint2,constraint3],objective);
return
double(P)