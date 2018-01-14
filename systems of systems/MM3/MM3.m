%% MM1 Exercise 1 %% 
clear all, close all

%G1
G1 = [0 0 0 0 0; -1 1 0 0 0; 0 -1 1 0 0 ; 0 0 -1 1 0; 0 0 0 -1 1]
G1M = (G1+G1')/2
eig(G1M)

tspan = [0 10];
x0 = [5 2 3 4 1];
L = G1;
[t,x] = ode45(@(t,x) dynamics(x, L), tspan, x0);
figure
plot(t,x)
% G2
%%% Convergens rate e^-kt
G2 = [2 -1 0 -1; -1 3 -1 -1; 0 -1 1 0; -1 -1 0 2]
eig(G2)

tspan = [0 10];
x0 = [5 2 3 4];
L = G2;
[t,x] = ode45(@(t,x) dynamics(x, L), tspan, x0);
figure(2)
plot(t,x)

%% MM1 Exercise 2 %% 
clear all, close all
%G1
%%% Convergens rate e^-kt
G1 = [2 -1 0 -1; -1 3 -1 -1; 0 -1 2 -1; -1 -1 -1 3];
eG1=eig(G1)
tspan = [0 10];
x0 = [1 2 3 4];
L = G1;
[t,x] = ode45(@(t,x) dynamics(x, L), tspan, x0);
figure(1)
G1_avg = 1/length(x0)*sum(x0);
avg1=ones(length(t),1)*G1_avg;
plot(t,x,t,avg1,'*')

% G2
LG2 = [2 0 -1 -1 0 0; -1 1 0 0 0 0; 0 -1 2 -1 0 0; -1 0 0 2 -1 0; 0 0 0 0 1 -1; 0 0 -1 0 0 1]; 
MG2 = (LG2+LG2')./2
eG2=eig(MG2)
tspan = [0 10];
x0 = [1 2 3 4 5 6];
L = MG2;
[t,x] = ode45(@(t,x) dynamics(x, L), tspan, x0);
figure(2)
G2_avg = 1/length(x0)*sum(x0);
avg2=ones(length(t),1)*G2_avg;
plot(t,x,t,avg2,'*')

%% G2

G2_mirrow = [3 -1 -1 -1 0 0;
            -1 2 -1 0 0 0;
            -1 -1 4 -1 0 -1;
            -1 0 -1 3 -1 0;
            0 0 0 -1 2 -1;
            0 0 -1 0 -1 2];
 G2_eig=eig(G2_mirrow)       

tspan = [0 10];
x0 = [1 2 3 4 5 1];

L = [2 0 -1 -1 0 0;
    -1 1 0 0 0 0;
    0 -1 2 -1 0 0;
    -1 0 0 2 -1 0;
    0 0 0 0 1 -1;
    0 0 -1 0 0 1];

[t,x] = ode45(@(t,x) dynamics(x, L), tspan, x0);

figure
plot(t,x)
