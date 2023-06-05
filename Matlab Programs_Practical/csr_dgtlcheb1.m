% Digital Chebychev Filter Design using Impulse Invariance
clear all;
clc;

wp=50;
ws=500;
Ap=0.5;
As=50;
WS=4000;
FS=WS/(2*pi);
T=2*pi/WS;

eps=sqrt(10^(Ap/10)-1);
wc=wp;
N=ceil((As-20*log10(eps)+6)/(6+20*log10(ws/wc)))

alpha=eps^(-1)+sqrt(1+eps^(-2))
a=.5*(alpha^(1/N)-alpha^(-1/N))
b=.5*(alpha^(1/N)+alpha^(-1/N))
x=a*wc
y=b*wc
disp('Press a Key to Continue')
pause

z=[];
for k=0:(N-1)
    Sk(k+1)=-x*sin((2*k+1)*pi/(2*N))+j*y*cos((2*k+1)*pi/(2*N));
end
Sk

Skmag=abs(Sk);
K=prod(Skmag);
[nums,dens]=zp2tf(z,Sk,K);
   
disp('Press a Key to Continue.......')
   pause;
   [Resps,fres] = freqs(nums,dens);
   mags=20*log10(abs(Resps));
   figure(1);
   plot(fres,mags);
   title('Analog Chebychev Low Pass Filter Frequency Response');
   xlabel('Frequency in Rads/Sec.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ')
   disp('Press a key to Continue........')
   pause
% Impulse Invariance Transfermation

[numz,denz]=impinvar(nums,dens,FS);
[Respz,Omegaz]=freqz(numz,denz);
magdb=20*log10(abs(Respz));
Omegas=Omegaz*FS;
figure(2)
plot(Omegas,magdb)
title('Digital Chebychev Low Pass Filter Frequency Response')
xlabel('Frequency in Rads/Sec')
ylabel('Magnitude in dB')
grid
zoom
