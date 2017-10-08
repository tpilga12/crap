clc
clear all

load('data.mat')

filename = fullfile('vars.txt');
fileID = fopen(filename);
%C = textscan(fileID,'%s','Delimiter',',',...
%    'MultipleDelimsAsOne',1);
C = textscan(fileID,'%s');
fclose(fileID);

vars = C{1}';

for k= 1:129
eval([vars{k} '=   Airflowmanualcalibration001{1:end,k};']);
end
t = 0:10:length(Input.Tsup1)*10-10;
