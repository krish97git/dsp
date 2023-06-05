% DIGITAL BUTTERWORTH FILTER DESIGN USING IMPULSE INVARIANCE TRANSFORMATION
% Pass Band Gain, Stop Band Attenuation
% Pass Band Edge Frequency, Stop Band Edge Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('DIGITAL BUTTERWORTH FILTER DESIGN USING IMPULSE INVARIANCE TRANSFORMATION');
   disp('Specifications are');
   disp('Passband Edge Freq. in Hz and Gain in dB');
   disp('Stopband Edge Freq. in Hz and Attenuation in dB');
   disp('  ');
   disp('	1. LOWPASS FILTER');
   disp('	2. HIGHPASS FILTER');
   disp('	3. BANDPASS FILTER');
   disp('	4. BANDSTOP FILTER');
   disp('  ');
   fltrtype=input('Select the Filter = ');
   switch (fltrtype)
   case 1,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH LOW PASS FILTER DESIGN USING IMPULSE INVARIANCE TRANSFORMATION');
      disp('  ');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      Fs=input('Sampling Frequency in Hz = ');
      wp=2*pi*fp;
      ws=2*pi*fs;
      [N wn]=buttord(wp,ws,rp,rs,'s');
 %     fn=wn/(2*pi)
 %     pause;
      [num,den]=butter(N,wn,'low','s');
      
   case 2,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH HIGH PASS FILTER DESIGN USING IMPULSE INVARIANCE TRANSFORMATION');
      disp('  ');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      Fs=input('Sampling Frequency in Hz = ');
      wp=2*pi*fp;
      ws=2*pi*fs;
      [N wn]=buttord(wp,ws,rp,rs,'s');
%      fn=wn/(2*pi)
%      pause;
      [num,den]=butter(N,wn,'high','s');
      
   case 3,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BAND PASS FILTER DESIGN USING IMPULSE INVARIANCE TRANSFORMATION');
      disp('  ');
      fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
      fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
      fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
      fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      rs=input('Stopband Attenuation in dB = ');
      Fs=input('Sampling Frequency in Hz = ');
      fp=[fp1,fp2];
      fs=[fs1,fs2]
      wp=2*pi*fp;
      ws=2*pi*fs;
      [N wn]=buttord(wp,ws,rp,rs,'s');
%      fn=wn/(2*pi)
%      pause;     
      [num,den]=butter(N,wn,'bandpass','s');
      
   case 4,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BAND STOP FILTER DESIGN USING IMPULSE INVARIANCE TRANSFORMATION');
      disp('  ');
      fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
      fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
      fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
      fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      rs=input('Stopband Attenuation in dB = ');
      Fs=input('Sampling Frequency in Hz = ');
      fp=[fp1,fp2];
      fs=[fs1,fs2]
      wp=2*pi*fp;
      ws=2*pi*fs;
      [N wn]=buttord(wp,ws,rp,rs,'s');
%      fn=wn/(2*pi)
%      pause;
      [num,den]=butter(N,wn,'stop','s');
   end
   
%   disp('Cut Off Frequency..')
%   fn=wn/(2*pi)
%   disp('Press a Key to Continue.......')
%   pause;
  % fre1=0:0.01:2*max(wn);
  % resps=freqs(num,den,fre1);
   [resps,fre1]=freqs(num,den);
   mags=20*log10(abs(resps));
   f1=fre1/(2*pi);
   plot(f1,mags);
   title('Analog Butterworth Filter Frequency Response')
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
%   disp('Press a Key to Continue.......')
   pause
   
%   Impulse Invariance Transformation
   [BZ,AZ]=impinvar(num,den,Fs);
   [respz,fre2]=freqz(BZ,AZ);
   magz=20*log10(abs(respz));
   f2=fre2*Fs/(2*pi);
   plot(f2,magz);
   title('Digital Butterworth Filter Frequency Response')
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
%   disp('Press a Key to Continue.......')
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

   