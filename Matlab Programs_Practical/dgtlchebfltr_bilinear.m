%   Third ordered digital Chebychev filter with a ripple of 1 dB in the
%   passband using bilinear transformation to pass signals up to 500 Hz frequency. Assume a sampling frequency
%   of 10 KHz. Find the spectrum of the output of the designed filter by passing the signal generated
%   in Question No. 1 through it.

clc;
N=3;
rp=1;
fp=500;
fsamp=10000;
T=1/fsamp;

      wp=2*pi*fp;
      wpdash=2*fsamp*tan(wp/(2*fsamp));
      
      epslon=sqrt(((10^(rp/10))-1));
      wndash=wpdash;
      alfa=(epslon^(-1))+sqrt(1+(epslon^(-2)));
      a=0.5*((alfa^(1/N))-(alfa^(-1/N)));
      b=0.5*((alfa^(1/N))+(alfa^(-1/N)));
      x=a*wndash;
      y=b*wndash;
      
      z=[];
      sk=[];
%      polemag=[];
      for k=0:N-1;
          sk=[sk,-x*sin((2*k+1)*pi/(2*N))+j*y*cos((2*k+1)*pi/(2*N))];
          polemag=[abs(sk)];
%           pause
      end
%       sk;

%       disp('Order of the Filter....')
%       disp(N);
%       disp('Pass Band Edge Frequency in Hz....')
      wn=wp;
      fn=wn/(2*pi);
      fndash=wndash/(2*pi);
%       disp('Poles are....')
%       disp(sk); 
      
      K=1;
      for n=1:N;
          K=K*polemag(n);
      end
%      prod(polemag)
%       disp('Gain....')
%       disp(K);
      [num,den]=zp2tf(z,sk,K);
%       disp('Analog Chebychev Low Pass Filter Numerator Coefficients....')
%       disp(num)
%       disp('Analog Chebychev Low Pass Filter Denominator Coefficients....')
%       disp(den)
   
   disp('Press a Key to Continue.......')
   pause;
   fres=0:0.01:3*max(wn);
   resps = freqs(num,den,fres);
   mags=20*log10(abs(resps));
   Fs=fres/(2*pi);
   figure(1);
   plot(Fs,mags);
   title('Analog Chebychev Low Pass Filter Frequency Response');
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ')
   disp('Press a key to Continue........')
   pause
   
%  Digital Filter Design
   
   disp(' ')
   disp('Bilinear Transformation')
   [BZ,AZ]=bilinear(num,den,fsamp);
%    disp('Digital Chebychev Low Pass Filter Numerator Coefficients....')
%    disp(BZ)
%    disp('Digital Chebychev Low Pass Filter Denominator Coefficients....')
%    disp(AZ)

   [respz,frez]=freqz(BZ,AZ);
   
   magz=20*log10(abs(respz));
   fz=frez*fsamp/(2*pi);
   figure(2)
   plot(fz,magz);
   title('Digital Chebychev Low Pass Filter Frequency Response');
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ')
   disp('Press a Key to Continue...')
   pause
   
% Composite Signal Generation

sigfreq = 3000 * (rand(1,10))
minfreq = min(sigfreq);
maxfreq = max(sigfreq);
signl=[];
for t=0:T:5*1/minfreq
    sig=0;
    for i=1:10
        sig=sig + sin(2*pi*sigfreq(i)*t);
    end
    signl=[signl,sig];
end

figure(3)
%t=0:T:1/minfreq;
t=0:T:5*1/minfreq;
plot(t,signl)
title('Composite Signal')
xlabel('Time in Seconds...')
ylabel('Amplitude')
grid
disp(' ')
disp('Press a Key to Continue...')
pause

% Spectrum of the Composite Signal

N1=length(signl);
M=50*N1;
sptrum = fft(signl,M);
k = 0:M-1;
freq=fsamp*k/M;
figure(4)
plot(freq,abs(sptrum));
title('Spectrum of the Composite Signal')
xlabel('Frequency in Hz..')
ylabel('Amplitude')
grid
disp(' ')
disp('Press a Key to Continue...')
pause

%   Filter Output and its Spectrum

otpt = filter(BZ,AZ,signl);
otpt_sptrum = fft(otpt,M);
%M=length(otpt_sptrum)
figure(6)
p = 0:M-1;
freq1=fsamp*p/M;
plot(freq1,abs(otpt_sptrum))
title('Spectrum of the Filter Output')
xlabel('Frequency in Hz..')
ylabel('Amplitude')
grid
disp(' ')
disp('Press a Key to Continue...')
pause

%   DTFT Plot of the Output of the Filter
omega=0:.001*pi:2*pi;
otpt_sptrum2=freqz(otpt,1,omega);
figure(8)
freq2=omega*fsamp/(2*pi);
plot(freq2,abs(otpt_sptrum2));
title('Spectrum of the Filter output using "freqz" function')
xlabel('Frequency in Hz..')
ylabel('Amplitude')
grid
disp(' ')
disp('Press a Key to Continue...')
pause

