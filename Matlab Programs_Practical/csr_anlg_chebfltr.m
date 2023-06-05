% ANALOG CHEBYCHEV FILTER DESIGN

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('ANALOG CHEBYCHEV FILTER DESIGN');
   disp('  ');
   disp('1. ANALOG TYPE-I CHEBYCHEV FILTER [PASSBAND REQUIREMENTS]');
   disp('2. ANALOG TYPE-II CHEBYCHEV FILTER [STOPBAND REQUIREMENTS]');
   disp('  ');
   fltr=input('Select the Filter Type = ');
   switch fltr
   case 1,
      loop1=1;
   	while (loop1==1)
	      clc;
		   disp('  ');
		   disp('ANALOG TYPE-I CHEBYCHEV FILTER DESIGN');
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
		      disp('ANALOG TYPE-I CHEBYCHEV LOWPASS FILTER DESIGN');
		      disp('  ');
		      N=input('Enter the Order of the Filter = ');
		      fp=input('Enter the Passband Edge Frequency in Hz. = ');
		      rp=input('Enter the Passband Ripple in dB = ');
			  wn=2*pi*fp;
		      [num,den]=cheby1(N,rp,wn,'s');
      
		   case 2,
		      clc;
		      disp('  ');
		      disp('ANALOG TYPE-I CHEBYCHEV HIGHPASS FILTER DESIGN');
		      disp('  ');
		      N=input('Enter the Order of the Filter = ');
		      fp=input('Enter the Passband Edge Frequency in Hz. = ');
		      rp=input('Enter the Passband Ripple in dB = ');
			  wn=2*pi*fp;
		      [num,den]=cheby1(N,rp,wn,'high','s');
		      
		   case 3,
		      clc;
		      disp('  ');
		      disp('ANALOG TYPE-I CHEBYCHEV BANDPASS FILTER DESIGN');
		      disp('  ');
		      N=input('Enter the Order of the Filter = ');
		      fp1=input('Enter the Lower Passband Edge Frequency in Hz. = ');
		      fp2=input('Enter the Upper Passband Edge Frequency in Hz. = ');
		      rp=input('Enter the Passband Ripple in dB = ');
		      fp=[fp1,fp2];
			  wn=2*pi*fp;
		      [num,den]=cheby1(N,rp,wn,'bandpass','s');
		      
		   case 4,
		      clc;
		      disp('  ');
		      disp('ANALOG TYPE-I CHEBYCHEV BANDSTOP FILTER DESIGN');
		      disp('  ');
		      N=input('Enter the Order of the Filter = ');
		      fp1=input('Enter the Lower Passband Edge Frequency in Hz. = ');
	          fp2=input('Enter the Upper Passband Edge Frequency in Hz. = ');
	          rp=input('Enter the Passband Ripple in dB = ');
		      fp=[fp1,fp2];
			  wn=2*pi*fp;
		      [num,den]=cheby1(N,rp,wn,'stop','s');
           end
            fre = 0:0.01:2*max(wn);
            resps=freqs(num,den,fre);
			mags=20*log10(abs(resps));
			f=fre/(2*pi);
			plot(f,mags);
			xlabel('Frequency in Hz.');
			ylabel('Magnitude in dB.');
			grid;
         zoom;
         disp('  ');
         ch=input('WANT TO CONTINUE TYPE-I CHEBYCHEV FILTER DESIGN..?(Y) = ','s');
         switch upper(ch)
         case 'Y',
            loop1=1;
         otherwise
            loop1=0;
         end
      end
      
   case 2,
      loop2=1;
      while (loop2==1)
      clc;
	   disp('  ');
	   disp('ANALOG TYPE-II CHEBYCHEV FILTER DESIGN');
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
	      disp('ANALOG TYPE-II CHEBYCHEV LOWPASS FILTER DESIGN');
	      disp('  ');
	      N=input('Enter the Order of the Filter = ');
	      fs=input('Enter the Stopband Edge Frequency in Hz. = ');
	      rs=input('Enter the Stopband Attenuation in dB = ');
		  wn=2*pi*fs;
	      [num,den]=cheby2(N,rs,wn,'s');
      
	   case 2,
	      clc;
	      disp('  ');
	      disp('ANALOG TYPE-II CHEBYCHEV HIGHPASS FILTER DESIGN');
	      disp('  ');
	      N=input('Enter the Order of the Filter = ');
	      fs=input('Enter the Stopband Edge Frequency in Hz. = ');
	      rs=input('Enter the Stopband Attenuation in dB = ');
		  wn=2*pi*fs;
	      [num,den]=cheby2(N,rs,wn,'high','s');
	      
	   case 3,
	      clc;
	      disp('  ');
	      disp('ANALOG TYPE-II CHEBYCHEV BANDPASS FILTER DESIGN');
	      disp('  ');
	      N=input('Enter the Order of the Filter = ');
	      fs1=input('Enter the Lower Stopband Edge Frequency in Hz. = ');
	      fs2=input('Enter the Upper Stopband Edge Frequency in Hz. = ');
	      rs=input('Enter the Stopband Attenuation in dB = ');
	      fs=[fs1,fs2];
		  wn=2*pi*fs;
	      [num,den]=cheby2(N,rs,wn,'bandpass','s');
	      
	   case 4,
	      clc;
	      disp('  ');
	      disp('ANALOG TYPE-II CHEBYCHEV BANDSTOP FILTER DESIGN');
	      disp('  ');
	      N=input('Enter the Order of the Filter = ');
	      fs1=input('Enter the Lower Stopband Edge Frequency in Hz. = ');
          fs2=input('Enter the Upper Stopband Edge Frequency in Hz. = ');
          rs=input('Enter the Stopband Attenuation in dB = ');
	      fs=[fs1,fs2];
		  wn=2*pi*fs;
	      [num,den]=cheby2(N,rs,wn,'stop','s');
       end
        fre = 0:0.01:3*max(wn);
        resps=freqs(num,den,fre);
		mags=20*log10(abs(resps));
		f=fre/(2*pi);
		plot(f,mags);
		xlabel('Frequency in Hz.');
		ylabel('Magnitude in dB.');
		grid;
	    zoom;
      disp('  ');
      ch=input('WANT TO CONTINUE TYPE-II CHEBYCHEV FILTER DESIGN..?(Y) = ','s');
      switch upper(ch)
      case 'Y',
         loop2=1;
      otherwise
         loop2=0;
      end
   end
end

   disp('  ');
   choice=input('WANT TO CONTINUE THE CHEBYCHEV FILTER DESIGN...?(Y)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end


   