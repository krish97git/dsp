%To find the Response of a system defined by difference equation

loop=1;
while (loop==1)
   clc;
	disp('RESPONSE OF A SYSTEM DEFINED BY DIFFERENCE EQUATION');
	disp('  ');
	N=input('Enter the No. of output samples required N = ');
	b=input('Enter the coefficients of input = ');
	a=input('Enter the coefficients of output = ');
	x=input('Enter the Input Sequence = ');
	x1=[x zeros(1,N-length(x))];
	resp=filter(b,a,x1);
	r=resp(1:N)
	n=0:length(r)-1;
	subplot(2,1,1);
	stem(n,r);
	title('Response');
	xlabel('Time Index n');
	ylabel('Amplitude');
	grid;
	c=conv(x,impz(b,a));
	d=c(1:N)
	t=0:length(d)-1;
	subplot(2,1,2);
	stem(t,d);
	zoom
	title('Convoluted Sequence');
	xlabel('Time Index n');
	ylabel('Amplitude');
    grid;
    disp('  ');
    disp('Press a key to Continue...');
    pause
    disp(' ')
   choice=input('DO YOU WANT TO CONTINUE...?(Y/N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
   