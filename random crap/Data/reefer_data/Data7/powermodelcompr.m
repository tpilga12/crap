clc
clear all

load ('sorteddata.mat')
%load('powerpressuredata')
%load('Vetadata.mat')
%%
syms x1 x2
k=1.2;
j=3;
volt = FC.Udc;
current = FC.Idc;
power = volt.*current;
freq = FC.Fact;
psuc = Input.Psuc;
pdis = Input.Pdis;
%n = 4

%% calculation of V*eta for entire length of the data set (get coffee if you plan to run this)
%for n=10:40%length(t)
%res(n,1)=solve(x1*freq2(n,1)*psuc2(n,1)*(k/(k+1))*((pdis2(n,1)/psuc2(n,1))^(k/(k+1)) - 1)==power2(n,1),x1);
%end

%%

for n=19000:length(t)
res(n,1)=solve(x1*freq(n,1)*psuc(n,1)*(k/(k+1))*((pdis(n,1)/psuc(n,1))^(k/(k+1)) - 1)==power(n,1),x1);
end

%%
plot((10:9990)',res)
%%
constant = 38;

for n=1:length(pdis)
Watt(n,1)=constant*freq(n,1)*psuc(n,1)*(k/(k+1))*((pdis(n,1)/psuc(n,1))^(k/(k+1)) - 1);
%Watt2(n,1)=constant*freq2(n,1)*psuc2(n,1)*(k/(k+1))*((pdis2(n,1)/psuc2(n,1))^(k/(k+1)) - 1);
end
%%
figure(10)
plot(t',Watt,t,power)
legend10=legend('Calculated Watt','Measure Watt');

plot(t',Watt,t,power)
legend('Calculated Watt','Measured Watt')

figure(11)
plot(t',Watt2,t,power2)


%%

err = immse(FC.Udc.*FC.Idc,Watt)/length(Watt) %MSE for measured power vs calculated power
%err2 = immse(power2,Watt2)/length(Watt2) %MSE for smoothed measure power vs smoothed calculated power


