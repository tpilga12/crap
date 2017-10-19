clc
clear all

load ('sorteddata.mat')

%% Compressor and fan inputs
figure(1)
subplot(1,3,1)
plot(t,Control.Fcpr)
title1=title('Compressor frequency')

subplot(1,3,2)
plot(t,Control.Mevap)
title1=title('Evaporator fan speed')

subplot(1,3,3)
plot(t,Control.Mcond)
title1=title('Condensor fan speed')

%% Set temperatur and air temperatur at evaporator intake
figure(2)
plot(t,Control.Tset,t,Control.Tsup,t,Input.Tamb,t,Control.Tret)
legend1= legend('Set temperatur','Evaporator supply air temperature','Ambient temperature')
title1=title('Container temperature')

%% Frequency vs power usage
figure(3)

subplot(1,2,1)
plot(t,Freqconvert.Fact)
%ylabel('12')
title1=title('Compressor frequency')

subplot(1,2,2)
plot(t,Freqconvert.Udc.*Freqconvert.Idc)
title2=title('Frequency converter power usage')
%ylabel('Watt');




%% Pressure at compressor suction and discharge

figure(4)

plot(t,Input.Psuc,t,Input.Pdis)
legend4 = legend('Compressor suction','Compressor discharge');

%%

figure(10)
plot(t,Control.VecoPct,t,Control.VexpPct);

figure(11)
plot(t,Input.T0,t,Input.Tc,t,Input.Tc-Input.T0);
legend11 = legend("T0","Tc","Tc-T0")
C = -530;
Gain = 235;

VecoOD = ((Input.Tc-Input.T0).^2.*Gain - C)/1000000 .* Control.VexpPct;
% T0 is the saturated suction temperature at the inlet of the compressor
% Tc is the saturated discharge temperature at the outlet of the compressor
VecoOD = (LimitSignal(VecoOD, [0 100]));
figure(12)
plot(t,VecoOD,t,Control.VecoPct);
legend12 = legend("Calculated OD input econ","Measured OD input econ");







