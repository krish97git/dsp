%Generation and Sampling of Cosine Function

loop=1;
while (loop==1)
   clc;
	disp('Generation of COSINE WAVE');
	disp('  ');
	a=input('Amplitude of the Cosine Wave = ');
	f=input('Frequency of the Cosine Wave in Hz = ');
	N=input('No of Cycles to be Displayed = ');
	fs=input('Sampling Frequency in Hz = ');
	t=0:.001*1/fs:N/f;
	cosine=a*cos(2*pi*f*t);
	subplot(2,1,1)
	plot(t,cosine);
	title('Continuous Sine Wave');
	grid;
	xlabel('Time in Secs.');
	ylabel('Amplitude');
	subplot(2,1,2)
    y=cosine(1:1000:length(t));
    x=length(y);
	n=0:x-1;
	stem(n,y);
	title('Discrete Cosine Wave');
	xlabel('Time instants');
	ylabel('Amplitude');
	grid;
   zoom;
   disp('  ');
   choice=input('DO YOU WANT TO CONTINUE COSINE WAVE GENERATION..?(Y / N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
