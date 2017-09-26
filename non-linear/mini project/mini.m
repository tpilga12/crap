%x1 = theta, x2 = theta_dot

%x1dot = x2

%x2dot = T/m*l^2 + h*cos(x1) -g*sin(x1*1/l - k*x2*1/m
%      = x2-a*sin(x1)-b*x2+c*u+h_nom*cos(x1)  
%0.9 <= l <= 1.1   0.5 <= m <= 1.5   0 <= k <= 0.2    |h| <= 1
g = 9.81;% m/s^2
l_nom = 1;, l_min = 0.9;, l_max = 1.1;
m_nom = 1;, m_min = 0.5;, m_max = 1.5;
k_nom = 0.1;, k_min = 0;, k_max = 0.2;
h_nom = 1; %disturbance

l = l_min+(l_max-l_min)*rand;
m = m_min+(m_max-m_min)*rand;
k = k_min+(k_max-k_min)*rand;

a=g/l
b=k/m
c= 1/(m*l^2)

gain = 1;
x1_dot = x2
x2_dot = x2-a*sin(x1)-b*x2+c*u+h_nom*cos(x1)
delta = ((h*cos(x1))/l)-b*x2-g*sin(x1)-gain*x2;


