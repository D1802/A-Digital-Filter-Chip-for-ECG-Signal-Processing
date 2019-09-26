clc;
close all;

w=-pi:2*pi/1000:pi;
load('chf03m.mat')
Ecgsignal=(val-0)/200;
Fs=100;
tt=(0:length(Ecgsignal)-1)/Fs;
subplot(2,1,1);

plot(tt,Ecgsignal);

title('Ecgsignal orignal');
xlabel('Time');
ylabel('Amplitude');
t=(0:length(Ecgsignal)-1+1000)/Fs;

z=exp(-1i*w);
k=800;
A=1/4+1/2*z.^-1+1/4.*z.^-2*k;
B=((1-z.^-k)./64.*(1-z.^-2)).*((1-z.^-k)./32.*(1-z.^-2)).*(64.*32/(k/2));
H=z.^-2.*(k-1)-A.*B;
v=ifft(H);
b=abs(v);
c=conv(b,Ecgsignal);
subplot(2,1,2);
plot(t,c);

title('Ecgsignal filter');
xlabel('Time');
ylabel('Amplitude');