%% generators
gen.a=xlsread('generators.xlsx','B2:B5');
gen.b=xlsread('generators.xlsx','C2:C5');
gen.min=xlsread('generators.xlsx','E2:E5');
gen.max=xlsread('generators.xlsx','F2:F5');


% Total demand for each period
D=xlsread('demand_new.xlsx','D2:D25');
T=length(D);
%%
batt.diseff=[0.8 0.9]'; %eta_p discharging
batt.cheff=[0.8 0.9]'; %eta_n charging
batt.es=[500 400]'; % kWh Es at AC
batt.dispower=[50 40]'; %pmax discharging
batt.chpower=[50 40]'; %pmin charging
batt.soc0=[0.5 0.2]'; %initial state of charge


A= [0 1 0 0 0 1;
    1 0 1 1 0 0;
    0 1 0 0 1 1;
    0 1 0 0 1 0;
    0 0 1 1 0 0;
    1 0 1 0 0 0];

