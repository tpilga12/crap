clc
clear all

%x1 = theta, x2 = theta_dot

%x1dot = x2

%x2dot = T/m*l^2 + h*cos(x1) -g*sin(x1*1/l - k*x2*1/m
%      = x2-a*sin(x1)-b*x2+c*u+h_nom*cos(x1)  
%0.9 <= l <= 1.1   0.5 <= m <= 1.5   0 <= k <= 0.2    |h| <= 1
global  l m k a a_max b b_max c_max gain g h
g = 9.81;% m/s^2
l_nom = 1;, l_min = 0.9;, l_max = 1.1; % 
m_nom = 1;, m_min = 0.5;, m_max = 1.5; % mass
k_nom = 0.1;, k_min = 0;, k_max = 0.2; % friction
%h = 1; %disturbance [0;1]

l = l_min+(l_max-l_min)*rand;
m = m_min+(m_max-m_min)*rand;
k = k_min+(k_max-k_min)*rand;

a=g/l;
a_max =g/l_max;
b=k/m;
b_max = k_max/m_max;
c= 1/(m*l^2);
c_max= 1/(m_max*l_max^2);
gain = 1;
t = 0:0.1:50;


[t,x] = ode45(@xdot, t, [0.5; 0.5]);

function dx=xdot(t,x)
global  a b b_max c_max gain g h m l k
h = sin(t);
%epsilon = 0.004;
%delta = (((h*cos(x(1)))/l_max)-b_max*x(2)-g*sin(x(1))-gain*x(2))/c_max;
s=x(2)+gain*x(1);
%u=(delta+beta0)*sign(s);
u = -1*(16.1865*abs(x(1))+1.815*abs(x(2))+2)*sign(s);

dx(1,1)= x(2); 
%dx(2,1)= x(2)-a*sin(x(1))-b*x(2)+c*u+h*cos(x(1));
dx(2,1) = (1/(m*l))*(m*h*cos(x(1)) - k*l*x(2) - m*g*l*sin(x(1))) + (1/(m*l^2))*u;
end



%delta = ((h*cos(x1))/l)-b*x2-g*sin(x1)-gain*x2;
%s= x2-gain*x1;
%y=[x0_dot; x1_dot; x2_dot]


