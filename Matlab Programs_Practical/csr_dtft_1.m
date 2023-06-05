% Calculation of Discrete Time Fourier Transform

loop=1;
while (loop==1)
   clc;
	disp('FINDING DISCRETE TIME FOURIER TRANSFORM')
	disp('  ');
	num=input('Enter the Sequence = ');
%	den=input('Enter the Denominator Coefficients = ');
    den=1;
	N=input('No. of periods to be displayed = ');
	w=-N*pi:0.001*pi:N*pi;
    h=freqz(num,den,w);
%   figure(2)
	subplot(2,1,1);
	plot(w/pi,abs(h));
	title('Magnitude Plot ');
	xlabel('Freq: "Value * pi" in rad');
	ylabel('Magnitude ');
    grid
%   figure(2)
	subplot(2,1,2);
	plot(w/pi,angle(h)/pi);
	zoom;
	title('Phase Plot');
	xlabel('Freq: "Value * pi" in rad');
	ylabel('Phase: "Value * pi" in rad');
	grid
    disp('  ');
    disp('Press a key to Continue...');
    pause
    disp(' ')
   choice=input('DO YOU WANT TO CONTINUE TO FIND DISCRETE TIME FOURIER TRANSFORM...?(Y/N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
