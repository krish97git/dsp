% 1. Write a Matlab program to generate a composite signal that contains 10 tones of random frequency 
%    with a max frequency of 3 KHz. Find the spectrum of this composite signal.										(7 + 8 Marks)

% 2. Write a Matlab program to design a third ordered digital Chebychev filter with a ripple of 1 dB in the
%   passband using bilinear transformation to pass signals up to 500 Hz frequency. Assume a sampling frequency
%   of 10 KHz. Find the spectrum of the output of the designed filter by passing the signal generated
%   in Question No. 1 through it.	(12 + 13 Marks)


clear ALL

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
      for k=0:N-1;
          sk=[sk,-x*sin((2*k+1)*pi/(2*N))+j*y*cos((2*k+1)*pi/(2*N))];
      end
      polemag=abs(sk);
      disp('Poles of the Filter...')
      disp(sk)
      disp('Magnitudes of the Poles...')
      disp(polemag)
      disp(' ')
      disp('Press a Key to Continue.....')
      pause

      K=1;
      for n=1:N;
          K=K*polemag(n);
      end
   
   % Frequency Response of Digital Filter
   [num,den]=zp2tf(z,sk,K);

   fres=0:0.01:3*max(wndash);
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
   
% Frequency Response of Digital Filter
   
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
   disp('Press a Key to Continue.....')
   pause

% Composite Signal Generation and Filtering

signlfre = 3000 * (rand(1,20))
minfre = min(signlfre);
maxfre = max(signlfre);

compsignl = [];
for t = 0:T:5*1/minfre
    signl = 0;
    for i = 1:length(signlfre)
        signl = signl + sin(2*pi*signlfre(i)*t);
    end
    compsignl = [compsignl,signl];
end

% Composite Signal Plot

figure(3)
t = 0:T:5*1/minfre;
plot(t,compsignl)
title('Composite Signal...')
xlabel('Time in Seconds...')
ylabel('Amplitude...')
disp(' ')
disp('Press a Key to Continue.....')
pause

% Spectrum of Composite Signal

M = 10 * length(compsignl);
sptrum1 = fft(compsignl,M);
figure(4)
b = 0:M-1;
freq1 = fsamp*b/M;
plot(freq1,abs(sptrum1))
title('Spectrum of Composite Signal...')
xlabel('Frequency in Hz...')
ylabel('Spectrum Amplitude...')
disp(' ')
disp('Press a Key to Continue.....')
pause

% Filtering 
otpt = filter(BZ,AZ,compsignl);
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
    
    