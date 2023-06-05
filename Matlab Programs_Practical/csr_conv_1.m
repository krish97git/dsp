% Finding the Convolution of two sequences x(n) & h(n)
% without using a built in function

loop=1;
while (loop==1)
clc;
x=input('Enter the sequence x(n) = ');
nx=input('Enter the time instant of the First element of x(n) = ');
h=input('Enter the sequence h(n) = ');
nh=input('Enter the time instant of the First element of h(n) = ');
lx=length(x);
lh=length(h);
ly=lx+lh-1;
y=[];
for n=1:ly
       intr=0;
   for k=1:lx
      if n-k+1>0 & n-k+1<=lh
         intr=intr+x(k)*h(n-k+1);
      end
      y(n)=intr;
   end
end

nylow=nx+nh;
m2=0:length(y)-1;
m3=m2+nylow;
m4=max(m3);
m=m3:m4;
disp(' ')
disp('Computed Convoluted Sequence')
y
disp('Convoluted Sequence using Built-in Function')
y1=conv(x,h)
x1=nx:lx+nx-1;
pause
subplot(311)
stem(x1,x)
title('Sequence x(n)')
xlabel('Time Index "n"')
ylabel('Amplitude')
grid
h1=nh:lh+nh-1;
subplot(312)
stem(h1,h)
title('Sequence h(n)')
xlabel('Time Index "n"')
ylabel('Amplitude')
grid
subplot(313)
stem(m,y)
title('Convoluted Sequence y(n)')
xlabel('Time Index "n"')
ylabel('Amplitude')
grid
pause
disp('  ');
choice=input('DO YOU WANT TO CONTINUE TO ...?(Y / N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
