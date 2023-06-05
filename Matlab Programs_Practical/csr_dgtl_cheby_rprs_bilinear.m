% DIGITAL CHEBYCHEV FILTER DESIGN USING BILINEAR TRANSFORMATION

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('DIGITAL CHEBYCHEV FILTER DESIGN USING BILINEAR TRANSFORMATION');
   disp('  ');
   disp('Specifications are');
   disp('Passband Edge Freq. in Hz and Gain in dB');
   disp('Stopband Edge Freq. in Hz and Attenuation in dB');
   disp('  ');   
   disp('1. DIGITAL TYPE-I CHEBYCHEV FILTER USING BILINEAR TRANSFORMATION [PASSBAND REQUIREMENT]');
   disp('2. DIGITAL TYPE-II CHEBYCHEV FILTER USING BILINEAR TRANSFORMATION [STOPBAND REQUIREMENT]');
   disp('  ');
   fltr=input('Select the Filter Type = ');
   switch fltr
   case 1,
      loop1=1;
   	while (loop1==1)
	      clc;
		   disp('  ');
		   disp('DIGITAL TYPE-I CHEBYCHEV FILTER DESIGN USING BILIEAR TRANSFORMATION');
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
		      disp('DIGITAL TYPE-I CHEBYCHEV LOWPASS FILTER DESIGN USING BILIEAR TRANSFORMATION');
		      disp('  ');
              fp=input('Passband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              fs=input('Stopband Edge Frequency in Hz. = ');
              rs=input('Stopband Attenuation in dB = ');
              Fs=input('Sampling Frequency in Hz. = ');
              wp=2*pi*fp;
              ws=2*pi*fs;
              wpdash=2*Fs*tan(wp/(2*Fs));
              wsdash=2*Fs*tan(ws/(2*Fs));              
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'s');
      
		   case 2,
		      clc;
		      disp('  ');
		      disp('DIGITAL TYPE-I CHEBYCHEV HIGHPASS FILTER DESIGN USING BILIEAR TRANSFORMATION');
		      disp('  ');
              fp=input('Passband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              fs=input('Stopband Edge Frequency in Hz. = ');
              rs=input('Stopband Attenuation in dB = ');
              Fs=input('Sampling Frequency in Hz. = ');              
              wp=2*pi*fp;
              ws=2*pi*fs;
              wpdash=2*Fs*tan(wp/(2*Fs));
              wsdash=2*Fs*tan(ws/(2*Fs));
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'high','s');
		      
		   case 3,
		      clc;
		      disp('  ');
		      disp('DIGITAL TYPE-I CHEBYCHEV BANDPASS FILTER DESIGN USING BILIEAR TRANSFORMATION');
		      disp('  ');
              fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
              fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
              fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
              fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              rs=input('Stopband Attenuation in dB = ');
              Fs=input('Sampling Frequency in Hz. = ');              
              fp=[fp1,fp2];
              fs=[fs1,fs2];
              wp=2*pi*fp;
              ws=2*pi*fs;
              wpdash=2*Fs*tan(wp/(2*Fs));
              wsdash=2*Fs*tan(ws/(2*Fs));
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'bandpass','s');
		      
		   case 4,
		      clc;
		      disp('  ');
		      disp('DIGITAL TYPE-I CHEBYCHEV BANDSTOP FILTER DESIGN USING BILIEAR TRANSFORMATION');
		      disp('  ');
              fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
              fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
              fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
              fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
              rp=input('Passband Gain in dB = ');
              rs=input('Stopband Attenuation in dB = ');
              Fs=input('Sampling Frequency in Hz. = ');              
              fp=[fp1,fp2];
              fs=[fs1,fs2];
              wp=2*pi*fp;
              ws=2*pi*fs;
              wpdash=2*Fs*tan(wp/(2*Fs));
              wsdash=2*Fs*tan(ws/(2*Fs));
              [N wn]=cheb1ord(wp,ws,rp,rs,'s');
		      [num,den]=cheby1(N,rp,wn,'stop','s');
           end


            fre=0:0.01:2*max(wp,ws);
            resps=freqs(num,den,fre);
%            [mag,fre]=freqs(num,den);
			mags=20*log10(abs(resps));
			f=fre/(2*pi);
			plot(f,mags);
            title('Analog Type-I Chebychev Filter Frequency Response');
			xlabel('Frequency in Hz.');
			ylabel('Magnitude in dB.');
			grid;
         zoom;
         disp('  ');
         disp('Press a Key to Continue.....')
         disp(' ');
         pause
         
%       BILIEAR Transformation
        [BZ,AZ]=bilinear(num,den,Fs);
        [respz,fre2]=freqz(BZ,AZ);
        magz=20*log10(abs(respz));
        f2=fre2*Fs/(2*pi);
        plot(f2,magz);
        title('Digital Type-I Chebychev Filter Frequency Response')
        xlabel('Frequency in Hz.');
        ylabel('Magnitude in dB.');
        grid;
        zoom;
%       disp('Press a Key to Continue.......')
        pause
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
	   disp('DIGITAL TYPE-II CHEBYCHEV FILTER DESIGN USING BILIEAR TRANSFORMATION');
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
	      disp('DIGITAL TYPE-II CHEBYCHEV LOWPASS FILTER DESIGN USING BILIEAR TRANSFORMATION');
	      disp('  ');
          fp=input('Passband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          fs=input('Stopband Edge Frequency in Hz. = ');
          rs=input('Stopband Attenuation in dB = ');
          Fs=input('Sampling Frequency in Hz. = ');          
          wp=2*pi*fp;
          ws=2*pi*fs;
          wpdash=2*Fs*tan(wp/(2*Fs));
          wsdash=2*Fs*tan(ws/(2*Fs));
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'s');
      
	   case 2,
	      clc;
	      disp('  ');
	      disp('DIGITAL TYPE-II CHEBYCHEV HIGHPASS FILTER DESIGN USING BILIEAR TRANSFORMATION');
	      disp('  ');
          fp=input('Passband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          fs=input('Stopband Edge Frequency in Hz. = ');
          rs=input('Stopband Attenuation in dB = ');
          Fs=input('Sampling Frequency in Hz. = '); 
          wp=2*pi*fp;
          ws=2*pi*fs;
          wpdash=2*Fs*tan(wp/(2*Fs));
          wsdash=2*Fs*tan(ws/(2*Fs));
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'high','s');
	      
	   case 3,
	      clc;
	      disp('  ');
	      disp('DIGITAL TYPE-II CHEBYCHEV BANDPASS FILTER DESIGN USING BILIEAR TRANSFORMATION');
	      disp('  ');
          fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
          fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
          fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
          fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          rs=input('Stopband Attenuation in dB = ');
          Fs=input('Sampling Frequency in Hz. = '); 
          fp=[fp1,fp2];
          fs=[fs1,fs2];
          wp=2*pi*fp;
          ws=2*pi*fs;
          wpdash=2*Fs*tan(wp/(2*Fs));
          wsdash=2*Fs*tan(ws/(2*Fs));
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'bandpass','s');
	      
	   case 4,
	      clc;
	      disp('  ');
	      disp('DIGITAL TYPE-II CHEBYCHEV BANDSTOP FILTER DESIGN USING BILIEAR TRANSFORMATION');
	      disp('  ');
          fp1=input('Enter Lower Passband Edge Frequency in Hz. = ');
          fs1=input('Enter Lower Stopband Edge Frequency in Hz. = ');
          fp2=input('Enter Upper Passband Edge Frequency in Hz. = ');
          fs2=input('Enter Upper Stopband Edge Frequency in Hz. = ');
          rp=input('Passband Gain in dB = ');
          rs=input('Stopband Attenuation in dB = ');
          Fs=input('Sampling Frequency in Hz. = ');
          fp=[fp1,fp2];
          fs=[fs1,fs2];
          wp=2*pi*fp;
          ws=2*pi*fs;
          wpdash=2*Fs*tan(wp/(2*Fs));
          wsdash=2*Fs*tan(ws/(2*Fs));
          [N wn]=cheb2ord(wp,ws,rp,rs,'s');
	      [num,den]=cheby2(N,rs,wn,'stop','s');
       end
        fre = 0:0.01:3*max(wp,ws);
        resps=freqs(num,den,fre);
%        [mag,fre]=freqs(num,den);
		mags=20*log10(abs(resps));
		f=fre/(2*pi);
		plot(f,mags);
        title('Analog Type-II Chebychev Filter Frequency Response');
		xlabel('Frequency in Hz.');
		ylabel('Magnitude in dB.');
		grid;
	    zoom;
      disp('  ');
      disp('Press a Key to Continue.....')
      disp(' ');
      pause
      
%   BILIEAR Transformation
   [BZ,AZ]=bilinear(num,den,Fs);
   [respz,fre2]=freqz(BZ,AZ);
   magz=20*log10(abs(respz));
   f2=fre2*Fs/(2*pi);
   plot(f2,magz);
   title('Digital Type-II Chebychev Filter Frequency Response')
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
%   disp('Press a Key to Continue.......')
   pause
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


   