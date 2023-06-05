% A third ordered Chebychev lowpass filter with 3 dB frequency of 5k Hz 
% is to be realized using digital system. The sampling period is 10x10^-6 sec. 
% Realize the filter using Impulse Invariance technique.
clc;
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
pause
disp('Press a Key to Continue')
s0=-x*sin(pi/(2*N))+j*y*cos(pi/(2*N))
s1=-x
s2=conj(s0)
mags0=abs(s0)
mags1=abs(s1)
mags2=abs(s2)
pause
disp('Press a Key to Continue')

bs0=mags0
as0=[1,-s0]
Hs0=tf(bs0,as0)
pause
disp('Press a Key to Continue')

bs1=mags1
as1=[1,-s1]
Hs1=tf(bs1,as1)
pause
disp('Press a Key to Continue')

bs2=mags2
as2=[1,-s2]
Hs2=tf(bs2,as2)

Hs=Hs0*Hs1*Hs2
pause
disp('Press a Key to Continue')

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
pause

magpoles=mags0*mags1*mags2

A=magpoles/((s0-s1)*(s0-s2))
B=magpoles/((s1-s0)*(s1-s2))
C=magpoles/((s2-s0)*(s2-s1))
pause
disp('Press a Key to Continue')

bz0=A
az0=[1,-exp(s0*T)]
Hz0=tf(bz0,az0)
pause
disp('Press a Key to Continue')

bz1=B
az1=[1,-exp(s1*T)]
Hz1=tf(bz1,az1)
pause
disp('Press a Key to Continue')

bz2=C
az2=[1,-exp(s2*T)]
Hz2=tf(bz2,az2)
pause
disp('Press a Key to Continue')

Hz=T*(Hz0+Hz1+Hz2)
pause
disp('Press a Key to Continue')

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