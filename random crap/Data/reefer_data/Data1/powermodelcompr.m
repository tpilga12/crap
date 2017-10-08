clc
clear all
%%
load ('sorteddata.mat')
load('powerpressuredata')
load('Vetadata.mat')
%%
syms x1 x2
k=1.2;
j=3;
%n = 4
%%

for n=10:length(t)
res(n,1)=solve(x1*freq2(n,1)*psuc2(n,1)*(k/(k+1))*((pdis2(n,1)/psuc2(n,1))^(k/(k+1)) - 1)==power2(n,1),x1);
end
%%
plot((10:9990)',res)
%%
constant = 38;
for n=1:length(pdis)
Watt(n,1)=constant*freq(n,1)*psuc(n,1)*(k/(k+1))*((pdis(n,1)/psuc(n,1))^(k/(k+1)) - 1);
Watt2(n,1)=constant*freq2(n,1)*psuc2(n,1)*(k/(k+1))*((pdis2(n,1)/psuc2(n,1))^(k/(k+1)) - 1);
end
%%
figure(10)
plot(t',Watt2,t,power2)

%%
err = immse(Freqconvert.Udc.*Freqconvert.Idc,Watt)/length(Watt)
err2 = immse(power2,Watt)/length(Watt)

