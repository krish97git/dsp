% Buttorworth Filter Design using Impulse Invariance Transformation
% A third ordered Butterworth lowpass filter with 3 dB frequency of 5k Hz 
% is to be realized using digital system. The sampling period is 10x10^-6 sec. 
% Realize the filter using Impulse Invariance technique.

clc;
disp('Butterworth Filter Design using Impulse Invariance Transformation')
disp(' ')
disp('Spec: N = 3, fc = 5 KHz, Ap = -3 dB, Fsamp = 100 KHz')
N=3;
fc=5*10^3;
Ap=-3;
T=10*10^(-6);
Fs=1/T;
wc=2*pi*fc;

K=wc^N;
z=[];
sk=[];
for k=0:N-1;
    sk=[sk,wc*exp(j*(2*k+1+N)*pi/(2*N))];
end

disp('Press a Key to Continue')
pause

bs1=abs(sk(2));
as1=[1,-sk(2)]
Hs1=tf(bs1,as1)
disp('Press a Key to Continue')
pause

bs2=abs(sk(1))*abs(sk(3));
as2=[1,2*abs(real(sk(1))),bs2]
Hs2=tf(bs2,as2)
disp('Press a Key to Continue')
pause

Hs=Hs1*Hs2
disp('Press a Key to Continue')
pause

[ns,ds]=tfdata(Hs,'v');
[Rs,Oms]=freqs(ns,ds);
fres=Oms/(2*pi);
Msdb=20*log10(abs(Rs));
figure(1)
plot(fres,Msdb)
title('Magnitude Response of the Analog Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid
zoom
pause

A=K/((sk(1)-sk(2))*(sk(1)-sk(3)))
B=K/((sk(2)-sk(1))*(sk(2)-sk(3)))
C=K/((sk(3)-sk(1))*(sk(3)-sk(2)))
disp('Press a Key to Continue')
pause

Bz0=B
Az0=[1,-exp(sk(2)*T)]
Hz0=tf(Bz0,Az0)

Bz1=[A+C,-(A*exp(sk(3)*T)+C*exp(sk(1)*T))]
Az1=[1,-(exp(sk(1)*T)+exp(sk(3)*T)),exp((sk(1)+sk(3))*T)]
Hz1=tf(Bz1,Az1)

Hz= T*(Hz0+Hz1)
disp('Press a Key to Continue')
pause

[num,den]=tfdata(Hz,'v')
[Resp,Omega]=freqz(num,den);
magdb=20*log10(abs(Resp));
fre=Omega*Fs/(2*pi);
figure(2)
plot(fre,magdb)
title('Magnitude Response of the Digital Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid
zoom