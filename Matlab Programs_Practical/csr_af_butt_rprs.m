% ANALOG BUTTERWORTH Low Pass FILTER DESIGN Without USING Built-in Functions
% Pass Band Gain, Stop Band Attenuation
% Pass Band Edge Frequency, Stop Band Edge Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('ANALOG BUTTERWORTH LOW PASS FILTER DESIGN');
   disp('Specifications are');
   disp('Passband Edge Freq. in Hz and Gain in dB');
   disp('Stopband Edge Freq. in Hz and Attenuation in dB');
   disp('  ');
   disp('Provide the Following Specifications');
      fp=input('Passband Edge Frequency in Hz. = ');
      rp=input('Passband Gain in dB = ');
      fs=input('Stopband Edge Frequency in Hz. = ');
      rs=input('Stopband Attenuation in dB = ');
      wp=2*pi*fp;
      ws=2*pi*fs;
   N1=ceil(log10((10^(-rp/10)-1)/(10^(-rs/10)-1))/(2*log10(wp/ws)));
   disp('N1 = ',N1);
   N2=ceil(log10((10^(-rs/10)-1)/(10^(-rp/10)-1))/(2*log10(ws/wp)));
   disp('N2 = ',N2);
   wc1=wp/(10^(-rp/10)-1)^(1/(2*N1));
   disp('wc1 = ',wc1);
   wc2=ws/(10^(-rs/10)-1)^(1/(2*N2));
   disp('wc2 = ',wc2);
   
   disp('Cut Off Frequency..')
   fn=wn/(2*pi)
   disp('Press a Key to Continue.......')
   pause;
   fre=0:0.01:3*max(wn);
   resps = freqs(num,den,fre);
%   [mag,fre]=freqs(num,den);
   mags=20*log10(abs(resps));
   f=fre/(2*pi);
   plot(f,mags);
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

   