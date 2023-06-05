% 1. Write a Matlab program to generate a composite signal that contains 20 tones of random frequency 
%    with a max frequency of 5 KHz. Find the spectrum of this composite signal.										(7 + 8 Marks)

% 2. Write a Matlab program to design a third ordered digital Chebychev filter with a ripple of 1 dB in the
%   passband using bilinear transformation to pass signals up to 500 Hz frequency. Assume a sampling frequency
%   of 10 KHz. Find the spectrum of the output of the designed filter by passing the signal generated
%   in Question No. 1 through it.	(12 + 13 Marks)


% to generate a composite signal that contains 20 tones of random frequency 
%    with a max frequency of 5 KHz. Find the spectrum of this composite signal

clc;
sigfreq = 5000 * (rand(1,20))
disp('Press a Key to Continue..')
pause
minfreq = min(sigfreq)
maxfreq = max(sigfreq)
Fs=10000;
T=1/Fs;
signl=[];
for t=0:.1*T:1/minfreq
    sig=0;
    for i=1:10
        sig=sig + sin(2*pi*sigfreq(i)*t);
    end
    signl=[signl,sig];
end
subplot(2,1,1)
t=0:.1*T:1/minfreq;
length(t)
length(signl)
plot(t,signl)
grid
N = 20*length(signl)
sptrum = fft(signl,N);
N=length(sptrum)
subplot(2,1,2)
k = 0: N-1;
freq=Fs*k/N;
%plot(freq,abs(sptrum))
plot(freq,abs(sptrum))
grid
 
