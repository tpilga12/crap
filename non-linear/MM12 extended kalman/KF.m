%KF runs the Kalman filters for the system in LSim.m
% x(i)= a*x(i-1)+b*u(i-1)+w(i-1);
% y(i)= c*x(i)+v(i);
% 
% External input: Data and parameters from LSim.m or NLSim.m

% Time-stamp: <2017-10-11 12:18:36 tk>
% Version 1: 2015
% Version 2: 2016-10-19 06:42:51 tk Error in time update that caused non
%            white residuals corrected (yhm= c*xhp -> yhm= c*xhm)
% Torben Knudsen
% Aalborg University, Dept. of Electronic Systems, Section of Automation
% and Control
% E-mail: tk@es.aau.dk

%% Algorithm

% Initialising
xh0= x0; P0= sigmax0^2; R= sigmav^2; Q= sigmaw^2;
% Using parameter notation from the course
H= c; Phi= a;

XHM= zeros(n,1);
YHM= zeros(n,1);
XHP= zeros(n,1);
KPmPp= [];

xhm= xh0; 
yhm= H*xhm;
Pm= P0;

% KF
for i= 1:n;
  % Collecting output
  XHM(i)= xhm;
  YHM(i)= yhm;
  % Measurement update
  K= Pm*H'/(H*Pm*H'+R);
  xhp= xhm+K*(y(i)-yhm);
  XHP(i)= xhp;                          % Collecting output
  Pp= (1-K*H)*Pm*(1-K*H)'+K*R*K';
  KPmPp= [KPmPp; K Pm Pp];              % Collecting output
  % Time update
  xhm= a*xhp+b*u(i);
  Pm= Phi*Pp*Phi'+Q;
  yhm= H*xhm;
end;

% Generating results
figure(2)
subplot(321)
plot([x XHM XHP])
title('x XHM XHP')
subplot(322)
plot(x-XHM)
title('x-XHM')
subplot(323)
plot(x-XHP)
title('x-XHP')
subplot(324)
plot(y-YHM)
title('y-YHM')
subplot(325)
XCorrtk(y-YHM);
% $$$ % Skip the instationary part of the residuals in the whiteness test
% $$$ subplot(326);
% $$$ Skip= ceil(2/(1-a));
% $$$ XCorrtk(y(Skip+1:end)-YHM(Skip+1:end));
Res= mean([y-YHM x-XHM x-XHP]);
Res= [Res; std([y-YHM x-XHM x-XHP])];
Res= [Res; diag([y-YHM x-XHM x-XHP]'*[y-YHM x-XHM x-XHP]/n)'];
disp(array2table(Res,'RowNames',{'Mean','Std','MSE'},...
                 'VariableNames',{'ytm' 'xtm' 'xtp'}))

figure(3)
subplot(311)
plot(KPmPp(:,1))
title('K')
subplot(312)
plot(KPmPp(:,2))
title('Pm')
subplot(313)
plot(KPmPp(:,3))
title('Pp')
  