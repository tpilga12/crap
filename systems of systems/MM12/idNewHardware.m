% idNewHardware - Identify new sensor hardware without dynamics

clear;
close all;

%% System and controller
% Plant
A = [0 .91; .5 -.17];
B = [0; .2];
C = [1 0];
D = 0;
[n,m] = size(B);
p = size(C,1);

% Noise characteristcs
Eww = 0.05*eye(n); 
Evv = 0.1*eye(p);

% LQG controller
Q = 100*eye(n);
R = eye(m);
L = dlqe(A,eye(n),C,Eww,Evv);  % Notice the sign!
F = -dlqr(A,B,Q,R,zeros(n,m));
ssg = C*inv(eye(n) - A)*B;     % Steady-state gain

% Sanity check
G = ss(A,B,C,D,1);
K = ss(A+B*F+L*C+L*D*F,-L,F,0,1);
KG= minreal(feedback(G,K,+1));
eig(KG.a)


%% Simulate system with controller
nSamples = 1000;
u = zeros(m,nSamples);
x = zeros(n,nSamples);
xh= zeros(n,nSamples);
y = zeros(p,nSamples);
ya= zeros(1,nSamples); % Additional output
yr= [zeros(p,nSamples/4), 5*ones(p,nSamples/4),zeros(p,nSamples/4), ...
     5*ones(p,nSamples/4)] * 1;
v = Evv*randn(p,nSamples);
for t = 1:nSamples-1
    x(:,t+1) = A*x(:,t) + B*u(:,t) + Eww*randn(n,1);
    y(:,t)   = C*x(:,t) + D*u(:,t) + v(:,t);
    xh(:,t+1)= A*xh(:,t) + B*u(:,t) + L*(C*xh(:,t) - y(:,t));
    u(:,t+1) = F*xh(:,t+1) + yr(:,t+1)/ssg;
    
    % Additional sensor
    ya(t) = [1 1]*x(:,t) + 0.02*randn();
end

figure(1)
subplot(311)
plot(1:nSamples,x(1,:),'b',1:nSamples,x(2,:),'g',...
     1:nSamples,xh(1,:),'b-.',1:nSamples,xh(2,:),'g-.');
ylabel('x_t');
subplot(312)
plot(1:nSamples,y(1,:),'b',1:nSamples,yr(1,:),'g');
ylabel('y_t, y_{rt}');
subplot(313)
plot(1:nSamples,u);
xlabel('Sample no.')
ylabel('u_t')


figure(2) 
subplot(211)
plot(1:nSamples,ya,'k')
ylabel('y_{at}')
subplot(212)
plot(1:nSamples,u,'k')
ylabel('u_{t}')
xlabel('Sample no.')


%% Identify additional sensor
invregr = inv([xh; u]*[xh; u]');

cdEst = zeros(n+m,1);
for k = 1:length(xh)
    cdEst = cdEst + invregr*[xh(:,k); u(:,k)]*ya(k);
end

cdEst


%% Examine closed-loop correlations
figure(3) 
subplot(211)
l = 100;
plot(-l:l,xcorr(v,l),'k')
ylabel('autocorr(v)')
subplot(212)
plot(-l:l,xcorr(u,v,l),'k')
ylabel('xcorr(u,v)')
xlabel('Lags')

