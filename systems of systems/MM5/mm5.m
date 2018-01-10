%% MM5 Systems of Systems excercices
%test i slide 6
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
% x = sdpvar(1,1);
% y = sdpvar(1,1);
% c = sdpvar(1,1);
options = sdpsettings('sos.model',2,'solver','mosek');
sdpvar x y c
p = 12*x^2 - 6.3*x^4 + x^6 + 3*x*y - 12*y^2 + 12*y^4;

con = sos(p-c); %sos = sum of squares

ans = optimize(con,-c,options) % udnytter at optimize altid vil forsøge at finde p >= 0 
value(c)
return


%%
syms x y
f = 12*x^2 - 6.3*x^4 + x^6 + 3*x*y - 12*y^2 + 12*y^4;
fsurf(f);

%% excercise 2
clc
clear all

% Define  state  variable
x  =  sdpvar(1,1);
x1 = sdpvar(1,1);
x2 = sdpvar(1,1);
% Specify maximal degree of Lyapunov function
dV = 2 ;
% Define the unknown Lyapunov function
[V,cV] = polynomial(x,dV);
% Define the vector  f i e l d
f = -x^3 ;
% f = [ -x1+0.5*x2-x1^3; 0.5*x1-2*x2-x2^3];
% Specify Lyapunov conditions
con = [sos(V); sos(-jacobian(V,x)*f)];
options = sdpsettings('solver','mosek') ;
optimize(con,1,options,[cV]) ;
% Get c o e f f i c i e n t s  of the Lyapunov function
cV  =  double(cV);
X  =  sdpvar(1,1);
vv  = monolist(X,dV);
% Compute the symbolic Lyapunov function
Vpoly =  vectorize(sdisplay(cV' * vv)) ;
