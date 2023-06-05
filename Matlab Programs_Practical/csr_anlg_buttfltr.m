% ANALOG BUTTERWORTH FILTER DESIGN
% Order of the Filter
% Cut off Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('ANALOG BUTTERWORTH FILTER DESIGN');
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
      disp('ANALOG BUTTERWORTH LOWPASS FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
	  fc=input('Enter the Cutoff Frequency in Hz. = ');
	  wn=2*pi*fc;
      [num,den]=butter(N,wn,'s');
      
   case 2,
      clc;
      disp('  ');
      disp('ANALOG BUTTERWORTH HIGHPASS FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
	  fc=input('Enter the Cutoff Frequency in Hz. = ');
	  wn=2*pi*fc;
      [num,den]=butter(N,wn,'high','s');
      
   case 3,
      clc;
      disp('  ');
      disp('ANALOG BUTTERWORTH BANDPASS FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
      fc1=input('Enter the Lower Cutoff Frequency in Hz. = ');
      fc2=input('Enter the Upper Cutoff Frequency in Hz. = ');
      fc=[fc1,fc2];
	  wn=2*pi*fc;
      [num,den]=butter(N,wn,'bandpass','s');
      
   case 4,
      clc;
      disp('  ');
      disp('ANALOG BUTTERWORTH BANDSTOP FILTER DESIGN');
      disp('  ');
      N=input('Enter the Order of the Filter = ');
      fc1=input('Enter the Lower Cutoff Frequency in Hz. = ');
      fc2=input('Enter the Upper Cutoff Frequency in Hz. = ');
      fc=[fc1,fc2];
	  wn=2*pi*fc;
      [num,den]=butter(N,wn,'stop','s');
   end

   disp('Numerator Polynomial');
   disp(num);
   disp('Denominator Polynomial');
   disp(den);
   [z,p,k]=tf2zp(num,den)
   % Frequency Response
   fre=0:0.01:2*max(wn);
   resps=freqs(num,den,fre);
   mags=20*log10(abs(resps));
   f=fre/(2*pi);
   plot(f,mags);
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
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

   