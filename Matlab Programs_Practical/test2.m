clc;
bs0=9.3814*10^3;
as0=[1,9.3814*10^3];
Hs0=tf(bs0,as0)
bs1=8.2823*10^8;
as1=[1,9.3814*10^3,8.2823*10^8];
Hs1=tf(bs1,as1)
Hs=Hs0*Hs1
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
T=10*(10^(-6));
Fs=1/T;
b1=9.3814*10^3;
a1=[1,-.9105];
H1=tf(b1,a1)
b2=[-9.3815*10^3,9.0074*10^3];
a2=[1,-1.8319,.9105];
H2=tf(b2,a2)
H=T*(H1+H2)
[num,den]=tfdata(H,'v')
[Resp,Omega]=freqz(num,den);
magdb=20*log10(abs(Resp));
fre=Omega*Fs/(2*pi);
figure(2)
plot(fre,magdb)
title('Magnitude Response of the Digital Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid