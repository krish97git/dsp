% Low Pass CHEBYCHEV FILTER DESIGN using Impulse Invariance Technique
% Pass Band Gain, Stop Band Attenuation
% Pass Band Edge Frequency, Stop Band Edge Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('CHEBYCHEV LOW PASS FILTER DESIGN using Impulse Invariance Technique');
   disp('Specifications are');
   disp('Passband Edge Freq. in Hz and Gain in dB');
   disp('Stopband Edge Freq. in Hz and Attenuation in dB');
   disp('  ');
      fp=5*10^3;
      rp=3;
      N=3
%      fs=input('Stopband Edge Frequency in Hz. = ');
%      rs=input('Stopband Attenuation in dB (Positive Value Only) = ');
      fsamp=10^5;
      wp=2*pi*fp;
%      ws=2*pi*fs;
      
      epslon=sqrt(((10^(rp/10))-1))
      wn=wp
%      N=ceil((rs-20*log10(epslon)+6)/(6+20*log10(ws/wp)))
      alfa=(epslon^(-1))+sqrt(1+(epslon^(-2)))
      a=0.5*((alfa^(1/N))-(alfa^(-1/N)))
      b=0.5*((alfa^(1/N))+(alfa^(-1/N)))
      x=a*wn
      y=b*wn
      
      z=[];
      sk=[];
      for k=0:N-1;
          sk=[sk,-x*sin((2*k+1)*pi/(2*N))+j*y*cos((2*k+1)*pi/(2*N))]
      end
      sk
      polemag=abs(sk)
      disp('Order of the Filter....')
      disp(N);
      disp('Pass Band Edge Frequency in Hz....')
      fn=wn/(2*pi)
      disp('Poles are....')
      disp(sk); 
      
      K=1;
      for n=1:N;
          K=K*polemag(n);
      end
      
      disp('Gain....')
      disp(K);
      [num,den]=zp2tf(z,sk,K);
      disp('Analog Chebychev Low Pass Filter Numerator Coefficients....')
      disp(num)
      disp('Analog Chebychev Low Pass Filter Denominator Coefficients....')
      disp(den)
   
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
   disp('Press a key to Continue........')
   pause
   
%  Digital Filter Design
   
   disp('Impulse Invariance Transformation')
   [BZ,AZ]=impinvar(num,den,fsamp);
   disp('Digital Chebychev Low Pass Filter Numerator Coefficients....')
   disp(BZ)
   disp('Digital Chebychev Low Pass Filter Denominator Coefficients....')
   disp(AZ)

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
   disp('Press a Key to Continue.......')
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

   