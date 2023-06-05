%To Find the DFT of a given Sequence

loop=1;
while (loop==1)
clc;
x=input('Enter the sequence = ');
disp(' ')
disp('Number of Point DFT "N" need to be greater than or equal to number of elements in x(n)')
disp(' ')
N=input('Enter the value of N to calculate "N point DFT" = ');
lx=length(x);
% if lx<=N
%    x=[x zeros(1,N-lx)];
% end

b= -j*2*pi/N;
xk=[];
for k=0:N/2
   xk(k+1)=0;
   for n=0:lx-1
      xk(k+1)=xk(k+1)+x(n+1)*exp(b*k*n);
   end
end
xk=[xk fliplr(conj(xk(2:length(xk)-1)))];

xk1=fft(x,N);
disp(' ')
disp('Computed DFT Sequence')
xk
disp('DFT Sequence using Built-in Function')
xk1
xk2=dft(x,N);
disp('DFT Using User Defined Function')
xk2
disp('Press a key to Continue...');
pause
k=0:N-1;
subplot(2,2,1)
stem(k,abs(xk))
title('DFT magnitude')
xlabel('Frequency Index "k"')
ylabel('Amplitude of the Signal')
grid
ph=angle(xk)/pi;
subplot(2,2,2)
stem(k,ph)
title('DFT Phase')
xlabel('Frequency Index "k"')
ylabel('Phase Value * pi')
grid
subplot(2,2,3)
stem(k,real(xk))
title('Real Part of DFT')
grid
subplot(2,2,4)
stem(k,imag(xk))
title('Imaginary Part of DFT')
grid
disp('Press a key to Continue...');
pause
disp('  ');
choice=input('DO YOU WANT TO CONTINUE TO FIND DFT...?(Y/N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
