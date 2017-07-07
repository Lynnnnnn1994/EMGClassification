clc
clear
close all

addpath('.\utils');

load test

%Data input
Data_ch1=tb_ch1{10};
Data_ch2=tb_ch2{10};
% Data_ch1=point_ch1{7};
% Data_ch2=point_ch2{7};

%CNN forward
Class=Classify(Data_ch1,Data_ch2);

%Display
disp(['Predicted type: ',Class]);

%Plot
figure
plot(Data_ch1,'b');
hold on
plot(Data_ch2,'r');
grid on
xlabel('Time');
ylabel('Amplitude');
title(['Predicted type: ',Class]);