% DIGITAL BUTTERWORTH FILTER DESIGN USING BILINEAR TRANSFORMATION
% Pass Band Gain, Stop Band Attenuation
% Pass Band Edge Frequency, Stop Band Edge Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('DIGITAL BUTTERWORTH FILTER DESIGN USING BILINEAR TRANSFORMATION');
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
      disp('DIGITAL BUTTERWORTH LOW PASS FILTER DESIGN USING BILINEAR TRANSFORMATION');
      disp('  ');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      Fs=input('Sampling Frequency in Hz = ');
      wp=2*pi*fp;
      ws=2*pi*fs;
      wpdash=2*Fs*tan(wp/(2*Fs));
      wsdash=2*Fs*tan(ws/(2*Fs));
      [N wndash]=buttord(wpdash,wsdash,rp,rs,'s');
 %     fn=wn/(2*pi)
 %     pause;
      [num,den]=butter(N,wndash,'low','s');
      
   case 2,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH HIGH PASS FILTER DESIGN USING BILINEAR TRANSFORMATION');
      disp('  ');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      Fs=input('Sampling Frequency in Hz = ');
      wp=2*pi*fp;
      ws=2*pi*fs;
      wpdash=2*Fs*tan(wp/(2*Fs));
      wsdash=2*Fs*tan(ws/(2*Fs));   
      [N wndash]=buttord(wp,ws,rp,rs,'s');
%      fn=wn/(2*pi)
%      pause;
      [num,den]=butter(N,wndash,'high','s');
      
   case 3,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BAND PASS FILTER DESIGN USING BILINEAR TRANSFORMATION');
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
      wpdash=2*Fs*tan(wp/(2*Fs));
      wsdash=2*Fs*tan(ws/(2*Fs));      
      [N wndash]=buttord(wp,ws,rp,rs,'s');
%      fn=wn/(2*pi)
%      pause;     
      [num,den]=butter(N,wndash,'bandpass','s');
      
   case 4,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BAND STOP FILTER DESIGN USING BILINEAR TRANSFORMATION');
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
      wpdash=2*Fs*tan(wp/(2*Fs));
      wsdash=2*Fs*tan(ws/(2*Fs)); 
      [N wndash]=buttord(wp,ws,rp,rs,'s');
%      fn=wn/(2*pi)
%      pause;
      [num,den]=butter(N,wndash,'stop','s');
   end
   
   disp('Cut Off Frequency in Hz..')
   wn=2*Fs*atan(wndash/(2*Fs));
   fn=wn/(2*pi)
   disp('Press a Key to Continue.......')
   pause;
   fre1=0:0.01:2*max(wndash);
   resps=freqs(num,den,fre1);
%   [mag,fre]=freqs(num,den);
   mags=20*log10(abs(resps));
   f1=fre1/(2*pi);
   figure(1)
   plot(f1,mags);
   title('Analog Butterworth Filter Frequency Response')
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
%   disp('Press a Key to Continue.......')
   pause
   
%   BILINEAR Transformation
   [BZ,AZ]=bilinear(num,den,Fs);
   [respz,fre2]=freqz(BZ,AZ);
   magz=20*log10(abs(respz));
   f2=fre2*Fs/(2*pi);
   figure(2)
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

   