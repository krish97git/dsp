%Generation of real exponential Sequence

loop=1;
while (loop==1)
    clc;
    disp('GENERATION OF REAL EXPONENTIAL SEQUENCE A*b^n');
	disp('  ');
	A=input('Enter the gain Constant = ');
	b=input('Enter the Base = ');
	N=input('Enter the Length of the Sequence = ');
	n=0:N-1;
	c=A*b.^n;
	stem(n,c);
	zoom;
	title(['Plot of " ',num2str(A),' * ',num2str(b),' ** n "']);
	grid;
    xlabel('Time Index n');
    ylabel('Amplitude');
    disp('  ');
    choice=input('DO YOU WANT TO CONTINUE...?(Y/N)= ','s');
    switch upper(choice)
    case 'Y',
      loop=1;
    otherwise
      loop=0;
    end
end

