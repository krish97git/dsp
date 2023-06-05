% ANALOG CHEBYCHEV FILTER DESIGN

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('ANALOG CHEBYCHEV FILTER DESIGN');
   disp('  ');
   disp('Specifications are');
   disp('Passband Edge Freq. in Hz and Gain in dB');
   disp('Stopband Edge Freq. in Hz and Attenuation in dB');
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
              fp=input('Passband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              fs=input('Stopband Edge Frequency in Hz. = ');
              rs=input('Stopband Attenuation in dB = ');
              wp=2*pi*fp;
              ws=2*pi*fs;
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'s');
      
		   case 2,
		      clc;
		      disp('  ');
		      disp('ANALOG TYPE-I CHEBYCHEV HIGHPASS FILTER DESIGN');
		      disp('  ');
              fp=input('Passband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              fs=input('Stopband Edge Frequency in Hz. = ');
              rs=input('Stopband Attenuation in dB = ');
              wp=2*pi*fp;
              ws=2*pi*fs;
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'high','s');
		      
		   case 3,
		      clc;
		      disp('  ');
		      disp('ANALOG TYPE-I CHEBYCHEV BANDPASS FILTER DESIGN');
		      disp('  ');
              fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
              fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
              fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
              fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              rs=input('Stopband Attenuation in dB = ');
              fp=[fp1,fp2];
              fs=[fs1,fs2];
              wp=2*pi*fp;
              ws=2*pi*fs;
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'bandpass','s');
		      
		   case 4,
		      clc;
		      disp('  ');
		      disp('ANALOG TYPE-I CHEBYCHEV BANDSTOP FILTER DESIGN');
		      disp('  ');
              fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
              fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
              fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
              fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              rs=input('Stopband Attenuation in dB = ');
              fp=[fp1,fp2];
              fs=[fs1,fs2];
              wp=2*pi*fp;
              ws=2*pi*fs;
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'stop','s');
           end


            fre=0:0.01:2*max(wp,ws);
            resps=freqs(num,den,fre);
%            [mag,fre]=freqs(num,den);
			mags=20*log10(abs(resps));
			f=fre/(2*pi);
			plot(f,mags);
			xlabel('Frequency in Hz.');
			ylabel('Magnitude in dB.');
			grid;
         zoom;
         disp('  ');
         disp('Press a Key to Continue.....')
         disp(' ');
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
          fp=input('Passband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          fs=input('Stopband Edge Frequency in Hz. = ');
          rs=input('Stopband Attenuation in dB = ');
          wp=2*pi*fp;
          ws=2*pi*fs;
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'s');
      
	   case 2,
	      clc;
	      disp('  ');
	      disp('ANALOG TYPE-II CHEBYCHEV HIGHPASS FILTER DESIGN');
	      disp('  ');
          fp=input('Passband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          fs=input('Stopband Edge Frequency in Hz. = ');
          rs=input('Stopband Attenuation in dB = ');
          wp=2*pi*fp;
          ws=2*pi*fs;
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'high','s');
	      
	   case 3,
	      clc;
	      disp('  ');
	      disp('ANALOG TYPE-II CHEBYCHEV BANDPASS FILTER DESIGN');
	      disp('  ');
          fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
          fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
          fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
          fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          rs=input('Stopband Attenuation in dB = ');
          fp=[fp1,fp2];
          fs=[fs1,fs2];
          wp=2*pi*fp;
          ws=2*pi*fs;
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'bandpass','s');
	      
	   case 4,
	      clc;
	      disp('  ');
	      disp('ANALOG TYPE-II CHEBYCHEV BANDSTOP FILTER DESIGN');
	      disp('  ');
          fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
          fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
          fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
          fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          rs=input('Stopband Attenuation in dB = ');
          fp=[fp1,fp2];
          fs=[fs1,fs2];
          wp=2*pi*fp;
          ws=2*pi*fs;
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'stop','s');
       end
        fre = 0:0.01:3*max(wp,ws);
        resps=freqs(num,den,fre);
%        [mag,fre]=freqs(num,den);
		mags=20*log10(abs(resps));
		f=fre/(2*pi);
		plot(f,mags);
		xlabel('Frequency in Hz.');
		ylabel('Magnitude in dB.');
		grid;
	    zoom;
      disp('  ');
      disp('Press a Key to Continue.....')
      disp(' ');
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


   