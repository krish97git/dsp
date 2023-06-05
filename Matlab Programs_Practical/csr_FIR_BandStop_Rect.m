% FIR Band Stop Filter Design Using Rectangular Window
% Specification: Pass Band Edge Frequency & Stop Band Edge Frequency
% Assume that the design is using Rrectangular Window;

loop=1;
while (loop==1)
clc;
disp('FIR Band Stop Filter Design Using Rectangular Window')
disp(' ')
disp('Specification: Pass Band Edge Frequency & Stop Band Edge Frequency')
disp(' ')
fp1=input('Enter the Lower Passband Edge Frequency in Hz = ');
fp2=input('Enter the Upper Passband Edge Frequency in Hz = ');
fs1=input('Enter the Lower Stop Band Edge Frequency in Hz = ');
fs2=input('Enter the Upper Stop Band Edge Frequency in Hz = ');
Fs=input('Enter the Sampling Frequency in Hz = ');
wp1=2*pi*fp1/Fs;
wp2=2*pi*fp2/Fs;
ws1=2*pi*fs1/Fs;
ws2=2*pi*fs2/Fs;
wt=abs(ws1-wp1);
wc1=(wp1+ws1)/2;
wc2=(wp2+ws2)/2;
wc=[wc1,wc2];

N=ceil(1.84*pi/wt+1)
if mod(N,2)==0
    N=N+1
end
alpha=(N-1)/2;

%p=[];
hd=[];
for n=0:(N-3)/2;
    hd=[hd,sin(wc1*(n-alpha))/(pi*(n-alpha))-sin(wc2*(n-alpha))/(pi*(n-alpha))];
end
for n=(N-1)/2;
    hd=[hd,1+wc1/pi-wc2/pi];
end
for n=(N+1)/2:N-1
    hd=[hd,sin(wc1*(n-alpha))/(pi*(n-alpha))-sin(wc2*(n-alpha))/(pi*(n-alpha))];
end
wd=[ones(1,N)];
disp('hd = ');
disp(hd);
disp('wd = ');
disp(wd);
n=0:N-1;
stem(n,wd)
title('Window Function')
xlabel('Time Index n')
ylabel('Window Sample Value w(n)')
disp('')
disp('Press a Key to Continue...')
pause
fc=wc*Fs/(2*pi)
hn=hd.*wd
[Resp,omega]=freqz(hn,1);
mag=20*log10(abs(Resp));
freq=omega*Fs/(2*pi);
plot(freq,mag)
title('Magnitude Frequency Response')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid

   disp(' ');
   disp('Press a key to Continue....')
   pause
   disp('  ');
   choice=input('DO YOU WANT TO CONTINUE WITH THE DESIGN...?(Y)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end