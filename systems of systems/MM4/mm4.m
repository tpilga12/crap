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

%k = 1;
%lambda(0) = 1;
x(:,1) = [0 0 0 0 0 0 0 0];
N = 10;
for k = 1:N
%fun = @(x)alfa*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]' + lambda_init*(A*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]' - b);
fun = @(x)alfa*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]' + lambda_init*(A*[x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]' - b);
x(:,k+1) = fmincon(fun,x(:,k),-eye(8),zeros(8,1))
var(:,k) = [x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)]
end

