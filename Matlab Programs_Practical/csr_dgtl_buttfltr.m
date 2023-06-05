% DIGITAL BUTTERWORTH FILTER DESIGN
% Order of the Filter
% Cut Off Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('DIGITAL BUTTERWORTH FILTER DESIGN');
   disp('Spec - Order & Cut Off Frequency of the Filter')
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
      N=input('Enter the Order of the Filter = ');
	  fc=input('Enter the Cutoff Frequency in Hz. = ');
      fs=input('Enter the Sampling Frequency in Hz. = ');
      T=1/fs;
      wn=2*pi*fc*T/pi;
      [num,den]=butter(N,wn);
      
   case 2,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH HIGHPASS FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
      fc=input('Enter the Cutoff Frequency in Hz. = ');
      fs=input('Enter the Sampling Frequency in Hz. = ');
      T=1/fs;
      wn=2*pi*fc*T/pi;
      [num,den]=butter(N,wn,'high');
      
   case 3,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BANDPASS FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
      fc1=input('Enter the Lower Cutoff Frequency in Hz. = ');
      fc2=input('Enter the Upper Cutoff Frequency in Hz. = ');
      fs=input('Enter the Sampling Frequency in Hz. = ');
      T=1/fs;
      fc=[fc1,fc2];
      wn=2*pi*fc*T/pi;
      [num,den]=butter(N,wn,'bandpass');
      
   case 4,
      clc;
      disp('  ');
      disp('DIGITAL BUTTERWORTH BANDSTOP FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
      fc1=input('Enter the Lower Cutoff Frequency in Hz. = ');
      fc2=input('Enter the Upper Cutoff Frequency in Hz. = ');
      fs=input('Enter the Sampling Frequency in Hz. = ');
      T=1/fs;
      fc=[fc1,fc2];
      wn=2*pi*fc*T/pi;
      [num,den]=butter(N,wn,'stop');
   end
   
   [respz,fre]=freqz(num,den);
   magz=20*log10(abs(respz));
   f=fre*fs/(2*pi);
   plot(f,magz);
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ');
   disp('Press a Key to Continue......')
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

   