% DIGITAL BUTTERWORTH FILTER DESIGN
% Pass Band Gain, Stop Band Attenuation
% Pass Band Edge Frequency, Stop Band Edge Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('DIGITAL BUTTERWORTH FILTER DESIGN');
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
      disp('DIGITAL BUTTERWORTH LOWPASS FILTER DESIGN');
      disp('  ');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      fsamp=input('Sampling Frequency in Hz = ');
      wp=2*pi*fp/(pi*fsamp);
      ws=2*pi*fs/(pi*fsamp);
      [N wn]=buttord(wp,ws,rp,rs);
 %     fn=wn/(2*pi)
 %     pause;
      [num,den]=butter(N,wn);
      
   case 2,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH HIGHPASS FILTER DESIGN');
      disp('  ');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      fsamp=input('Sampling Frequency in Hz = ');      
      wp=2*pi*fp/(pi*fsamp);
      ws=2*pi*fs/(pi*fsamp);
      [N wn]=buttord(wp,ws,rp,rs);
%      fn=wn/(2*pi)
%      pause;
      [num,den]=butter(N,wn,'high');
      
   case 3,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BANDPASS FILTER DESIGN');
      disp('  ');
      fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
      fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
      fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
      fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      rs=input('Stopband Attenuation in dB = ');
      fsamp=input('Sampling Frequency in Hz = ');      
      fp=[fp1,fp2];
      fs=[fs1,fs2]
      wp=2*pi*fp/(pi*fsamp);
      ws=2*pi*fs/(pi*fsamp);
      [N wn]=buttord(wp,ws,rp,rs);
%      fn=wn/(2*pi)
%      pause;     
      [num,den]=butter(N,wn,'bandpass');
      
   case 4,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BANDSTOP FILTER DESIGN');
      disp('  ');
      fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
      fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
      fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
      fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      rs=input('Stopband Attenuation in dB = ');
      fsamp=input('Sampling Frequency in Hz = ');      
      fp=[fp1,fp2];
      fs=[fs1,fs2]
      wp=2*pi*fp/(pi*fsamp);
      ws=2*pi*fs/(pi*fsamp);
      [N wn]=buttord(wp,ws,rp,rs);
%      fn=wn/(2*pi)
%      pause;
      [num,den]=butter(N,wn,'stop');
   end
   
%   disp('Cut Off Frequency..')
%   fn=wn*fsamp/(2*pi)
%   disp('Press a Key to Continue.......')
%   pause;
%   fre=0:0.01:2*max(wn);
%   mag = freqs(num,den,fre);
   [respz,fre]=freqz(num,den);
   magz=20*log10(abs(respz));
   f=fre*fsamp/(2*pi);
   plot(f,magz);
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

   