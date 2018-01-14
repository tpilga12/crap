%systems of systems 25/10 mm4
clc
clear all

alfa = [ 1 2 2.3 2.5 3 2.4 2.1 2.2];
A = [1 -1 -1  0  0  0  0  0;
     0  1  0 -1 -1  0  0  0;
     0  0  1  0  0 -1 -1  0;
     0  0  0  0 -1 -1  0  1;
     0  0  0  1  0  0  0  0;
     0  0  0  0  0  0  1  0;
     0  0  0  0  0  0  0  1];
 
b = [0 0 0 0 1 2 3]';
lambda_init = ones(1,7);
lambda = lambda_init;

x(:,1) = [1 1 1 1 1 1 1 1];
rho = 0.001;
k = 1;
epsilon = 0.01;
compare = 10;
while compare > epsilon    
%lagrangian augmented form
fun = @(x)alfa*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]' + lambda*(A*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]' - b);
f = @(x)alfa*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]';
xout(:,k) = x; 
x = fmincon(fun,x,-eye(8),zeros(8,1)); % calculate/find primal value x*


lambdaout(:,k) = lambda';
lambda = lambda + rho*(A*x-b)';

compare = norm(fun(x) -f(x)) % limit
compareout(k) = compare;
k = k+1;

end

