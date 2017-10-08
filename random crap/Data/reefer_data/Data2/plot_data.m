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
plot(t,FC.Fact)
%ylabel('12')
title1=title('Compressor frequency')

subplot(1,2,2)
plot(t,FC.Udc.*FC.Idc)
title2=title('Frequency converter power usage')
%ylabel('Watt');




%% Pressure at compressor suction and discharge

figure(4)

plot(t,Input.Psuc,t,Input.Pdis)
legend4 = legend('Compressor suction','Compressor discharge');








