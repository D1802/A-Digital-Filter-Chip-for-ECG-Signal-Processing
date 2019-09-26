clc;
clear all;
close all;
wc=-pi:2*pi/1000:pi;
load('chf03m.mat')
Ecgsignal=(val-0)/200;
Fs=100;
t=(0:length(Ecgsignal)-1)/Fs;
subplot(2,1,1);
%figure(1);
subplot(2,1,1);
plot(t,Ecgsignal);
%v=fft(Ecgsignal);
%subplot(3,1,2);
%plot(t,v)
%Boxcar=1;
%n=-5:0.01:5;
%hideal=sin(wc.*n)./(pi.*n);   
%hnew=hideal.*Boxcar;
%k=cconv(Ecgsignal,hnew);
%m=(0:length(k)-1)/Fs;
%subplot(2,1,2)
%plot(m,k)
%figure(2);
b=fir1(99,[0.005 0.495]);
%freqz(b,1,'whole');
y=filter(b,1,Ecgsignal);
subplot(2,1,2)
plot(t,y)