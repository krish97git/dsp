% Digital Butterworth Filter Design using Bilinear Transfermation

clear all;
clc;

wp=50;
ws=500;
Ap=0.5;
As=50;
WS=4000;
FS=WS/(2*pi);
T=1/FS;

wpdash=2*FS*tan(wp/(2*FS));
wsdash=2*FS*tan(ws/(2*FS));

N = ceil(log10(((10^(Ap/10)-1)/((10^(As/10)-1))))/(2*log10(wpdash/wsdash)))
wcdash = wpdash/((10^(Ap/10)-1)^(1/(2*N)));

z=[];
for k=0:(N-1)
    Sk(k+1)=wcdash*exp(j*((2*k)+1+N)*pi/(2*N));
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
   title('Analog Butterworth Low Pass Filter Frequency Response');
   xlabel('Frequency in Rads/Sec.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ')
   disp('Press a key to Continue........')
   pause
% Impulse Invariance Transfermation

[numz,denz]=bilinear(nums,dens,FS);
[Respz,Omegaz]=freqz(numz,denz);
magdb=20*log10(abs(Respz));
Omegas=Omegaz*FS;
figure(2)
plot(Omegas,magdb)
title('Digital Butterworth Low Pass Filter Frequency Response')
xlabel('Frequency in Rads/Sec')
ylabel('Magnitude in dB')
grid
zoom
