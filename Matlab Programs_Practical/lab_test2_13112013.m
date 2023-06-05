% Second Test Solutions: Nov 13, 2013

% School of Information Sciences, Manipal
% DSP Lab Test – Nov 13, 2013
% Duration: 2.30 Hrs.									Max Marks: 25
% 
% Note: 
% 1.	PART A is compulsory
% 2.	Answer any ONE from PART B (Do not use the built-in functions while designing the filter)
% 
% PART A
% 
% 1.	Answer the following – Signal Generation
% a.	Write a Matlab program & execute to generate and plot a composite signal that contains 20 random 
%       frequencies with a maximum of 5 KHz using a Matlab program.                                             (5 Marks)
% 
% b.	Draw the expected spectrum of the signal generated in Q1a and verify using a Matlab program.            (5 Marks)
% 
% PART B
% 
% 2.	Answer the following – IIR Filter
% a.	Write a Matlab program to design a digital Chebychev filter of third order using bilinear transformation 
%       to pass signals up to 1.5 KHz frequency. Assume a sampling frequency of 20 KHz. 
%       Execute and show the frequency response.                                                                (10 Marks)
% 
% b.	Write a Matlab program to filter the signal generated in Q1a by the Chebychev Filter designed in Q2a. 
%       Draw the expected spectrum of output of the Butterworth filter and verify using a Matlab program.		(5 Marks)
% 
% 
% 3.	Answer the following – FIR Filter (Windowing Technique)
% a.	It is desired to pass high frequencies of an analog signal using a digital linear phase FIR filter. 
%       The 3 dB frequency is 2 KHz, transition width is 500 Hz and the stop band attenuation is 50 dB. 
%       Write a Matlab program to design the filter to meet the above specification using suitable window function. 
%       The filter employs a sampling frequency of 20 KHz. Execute the program.                                 (10 Marks)
% 
% b.	Write a Matlab program to filter the signal generated in Q1a by the FIR filter designed in Q3a. 
%       Draw the expected spectrum of the output of the FIR filter and verify using a Matlab program.           (5 Marks)
% 
% 
% 4.	Answer the following – FIR Filter (Frequency Sampling Technique)
% a.	The desired amplitude response of a certain FIR filter with linear phase is 
%       H(ejf) = 1;	for f ? 500 Hz
%       H(ejf) = 0;	elsewhere
%       The sampling frequency fs = 20 KHz and the impulse response is to be 5.5 mSec long. 
%       Write a Matlab program to design the filter using frequency-sampling technique. Execute the program     (10 Marks)
% 
% b.	Write a Matlab program to filter the signal generated in Q1a by the FIR filter designed in Q4a. 
%       Draw the expected spectrum of the output of the FIR filter and verify using a Matlab program.           (5 Marks)

clc;
clear all;
close all;
fre=5000*rand(1,20)
Fs=20*10^3
T=1/Fs;
Fmn=min(fre)
Fmx=max(fre)
y=[];
t=0:1/Fs:1/Fmn;
x=0;
for r=1:length(fre);
    x=x+sin(2*pi*fre(r)*t);
end
y=[y,x];
Ny=length(y)
N1=10*ceil(Fs/Fmn)
k1=0:N1-1;
frek1=Fs*k1/N1;
sptrm=fft(y,N1);
pause

figure(1)
subplot(2,1,1)
plot(t,y)
title('Generated Signal')
xlabel('Time in Secs...')
ylabel('Signal Strength')
grid
    
subplot(2,1,2)
plot(frek1,abs(sptrm))
title('Spectrum of the Generated Signal')
xlabel('Frequency in Hz...')
ylabel('Spectrum Magnitude')
grid

% Digital IIR Filter Design

N=3;
fc=1.5*10^3;
Ap=-3;
T=1/Fs;
wc=2*pi*fc
eps=sqrt(10^(-Ap/10)-1)
alpha=eps^(-1)+sqrt(1+eps^(-2))
a=.5*(alpha^(1/N)-alpha^(-1/N))
b=.5*(alpha^(1/N)+alpha^(-1/N))
xx=a*wc
yy=b*wc
disp('Press a Key to Continue')
pause

s0=-xx*sin(pi/(2*N))+j*yy*cos(pi/(2*N))
s1=-xx
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
figure(2)
% subplot(2,1,1)
plot(fres,Msdb)
title('Magnitude Response of the Analog Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid
zoom

% ys=filter(ns,ds,y)
% N2=10*length(ys)
% k2=0:N2-1;
% frek2=Fs*k2/N2;
% yssptrm=fft(ys,N2);
% 
% subplot(2,1,2)
% plot(frek2,abs(yssptrm))
% title('Spectrum  of the Output of the Analog IIR Filter')
% xlabel('Frequency in Hz...')
% ylabel('Magnitude of the Spectrum')
% grid
% zoom
% pause

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

figure(3)
subplot(2,1,1)
plot(fre,magdb)
title('Magnitude Response of the Digital Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid
zoom

yz=filter(num,den,y)
N3=10*length(yz)
k3=0:N3-1;
frek3=Fs*k3/N3;
yzsptrm=fft(yz,N3);

subplot(2,1,2)
plot(frek3,abs(yzsptrm))
title('Spectrum  of the Output of the Digital IIR Filter')
xlabel('Frequency in Hz...')
ylabel('Magnitude of the Spectrum')
grid
zoom
pause



