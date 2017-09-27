function dxdt=xdot(t,x);
g = 9.81;% m/s^2
l_nom = 1;, l_min = 0.9;, l_max = 1.1; % 
m_nom = 1;, m_min = 0.5;, m_max = 1.5; % mass
k_nom = 0.1;, k_min = 0;, k_max = 0.2; % friction
h = cos(t); %disturbance [0;1]
gain = 1;

l = l_min+(l_max-l_min)*rand;
m = m_min+(m_max-m_min)*rand;
k = k_min+(k_max-k_min)*rand;
s=x(2)-gain*x(1);
beta0 = 0.8888;

a=g/l;
a_max =g/l_max;
b=k/m;
b_max = k_max/m_max;
c= 1/(m*l^2);
c_max= 1/(m_max*l_max^2);
epsilon = 0.004;
delta = (((h*cos(x(1)))/l_max)-b_max*x(2)-g*sin(x(1))-gain*x(2))/c_max;

u=(delta+beta0)*sign(s);

dxdt(1,1)= x(2); 
dxdt(2,1)= x(2)-a*sin(x(1))-b*x(2)+c*u+h*cos(x(1));
end