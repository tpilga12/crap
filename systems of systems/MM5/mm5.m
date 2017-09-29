%% MM5 Systems of Systems excercices
%test i slide
clc
clear all

A = [-1 0; 2 -2];
P = sdpvar(2,2,'symmetric');
objective = 1;
constraint1 = A'*P + P*A <= 0;
constraint2 = P >= 0;
optimize([constraint1,constraint2],objective);

%% excercise 1
clc
clear all

% 12x^2 - 6.3x^4 + x^6 + 3xy - 12y^2 + 12y^4
x = sdpvar(1,1);
y = sdpvar(1,1);
c = sdpvar(1,1);
p = 12*x^2 - 6.3*x^4 + x^6 + 3*x*y - 12*y^2 + 12*y^4;

con = sos(p-c); %sos = sum of squares
ans = optimize(con,-c) % udnytter at optimize altid vil forsøge at finde p >= 0
return

surf(p,[-2,2])
