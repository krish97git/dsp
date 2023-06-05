%Generation of Complex Signal

loop=1;
while (loop==1)
   clc;
	disp('GENERATION OF COMPLEX EXPONENTIAL SIGNAL exp[(a+i*b)n]');
	disp('  ');
	a=input('Real Part of the Exponent = ');
	b=input('Imaginary Part of the Exponent = ');
	n=input('No. of Samples to be Displayed = ' );
	expon=a+i*b;
    disp(' ')
    disp('Exponent is...')
	disp(expon);
	t=0:0.01/n:n;
	c=exp(expon*t);
	figure(1)
	subplot(2,1,1);
	plot(t,real(c));
	title(['Continuous Real Part of exp[( ',num2str(a),' + j ',num2str(b),' ) * n]']);
	xlabel('Time Axis');
	ylabel('Amplitude Axis');
	grid;
	subplot(2,1,2);
	plot(t,imag(c));
	title(['Continuous Imaginary Part of exp[( ',num2str(a),' + j ',num2str(b),' ) * n]']);
	xlabel('Time Axis');
	ylabel('Amplitude Axis');
    grid;
    disp('Press a key to Continue...');
	pause
	N=0:n;
	cs=exp(expon*N);
	figure(2)
	subplot(2,1,1);
	stem(N,real(cs));
	title(['Discrete Real Part of exp[( ',num2str(a),' + j ',num2str(b),' ) * n]']);
	xlabel('Time Index "n"');
	ylabel('Amplitude Axis');
	grid;
	subplot(2,1,2);
	stem(N,imag(cs));
	title(['Discrete Imaginary Part of exp[( ',num2str(a),' + j ',num2str(b),' ) * n]']);
	xlabel('Time Index "n"');
	ylabel('Amplitude');
	grid;
	zoom
   disp('  ');
   disp('Press a key to Continue...');
   pause
   figure(3)
   c(4000:4020)
   plot(c)
   title(['Polar Plot of exp[( ',num2str(a),' + j ',num2str(b),' ) * n]']);
   xlabel('Real Part')
   ylabel('Imaginary Part')
   grid
   pause
   choice=input('DO YOU WANT TO CONTINUE THE COMPLEX SIGNAL GENERATION..?(Y/N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
