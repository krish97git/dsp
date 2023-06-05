% Chebychev Filter Design using Impulse Invariance Transformation
% A third ordered Chebychev lowpass filter with 3 dB frequency of 5k Hz 
% is to be realized using digital system. The sampling period is 10x10^-6 sec. 
% Realize the filter using Impulse Invariance technique.

clc;
disp('Chebychev Filter Design using Impulse Invariance Transformation')
disp(' ')
disp('Spec: N = 3, fc = 5 K Hz, Ap = -3 dB, Fsamp = 100 KHz')
N=3;
fc=5*10^3;
Ap=-3;
T=10*10^(-6);
Fs=1/T;
wc=2*pi*fc
eps=sqrt(10^(-Ap/10)-1)
alpha=eps^(-1)+sqrt(1+eps^(-2))
a=.5*(alpha^(1/N)-alpha^(-1/N))
b=.5*(alpha^(1/N)+alpha^(-1/N))
x=a*wc
y=b*wc
disp('Press a Key to Continue')
pause

s0=-x*sin(pi/(2*N))+j*y*cos(pi/(2*N))
s1=-x
s2=conj(s0)
mags0=abs(s0)
mags1=abs(s1)
mags2=abs(s2)
disp('Press a Key to Continue')
pause

bs1=mags1
as1=[1,-s1]
Hs1=tf(bs1,as1)
disp('Press a Key to Continue')
pause

bs2=mags0*mags2
as2=[1,2*abs(real(s0)),bs2]
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

magpoles=mags0*mags1*mags2

A=magpoles/((s0-s1)*(s0-s2))
B=magpoles/((s1-s0)*(s1-s2))
C=magpoles/((s2-s0)*(s2-s1))
disp('Press a Key to Continue')
pause

Bz0=B
Az0=[1,-exp(s1*T)]
Hz0=tf(Bz0,Az0)

Bz1=[A+C,-(A*exp(s2*T)+C*exp(s0*T))]
Az1=[1,-(exp(s0*T)+exp(s2*T)),exp((s0+s2)*T)]
Hz1=tf(Bz1,Az1)

Hz=T*(Hz0+Hz1)
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