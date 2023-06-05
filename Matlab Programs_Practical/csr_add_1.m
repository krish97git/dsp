% Addition of two sequences
loop=1;
while (loop==1)
clc;
x=input('Enter the elements of the sequence x(n)= ');
nx=input('Enter the Time Index of First Element of x(n)= ');
y=input('Enter the elements of the sequence y(n)= ');
ny=input('Enter the Time Index of First Element of y(n)= ');

if nx<0 & ny <0
   dif=abs(nx-ny);
   if abs(nx)<abs(ny)
      x=[zeros(1,dif) x];
   elseif abs(ny)<abs(nx)
      y=[zeros(1,dif) y];
   end
end
if (nx<0) & (ny>=0)
   y=[zeros(1,abs(nx)+ny) y];
end
if nx>=0 & ny<0
   x=[zeros(1,abs(ny)+nx) x];
end
if nx>=0 & ny>=0
   dif=abs(nx-ny);
   if nx<=ny
      y=[zeros(1,dif) y];
   elseif ny<=nx
      x=[zeros(1,dif) x];
   end
end
lx=length(x);
ly=length(y);
dif1=abs(lx-ly);
if lx<ly
   x=[x zeros(1,dif1)];
elseif ly<lx
   y=[y zeros(1,dif1)];
end

m1=min(min(nx),min(ny));
m2=0:length(x)-1;
m3=m2+m1;
m4=max(m3);
m=m3:m4;
x
y
z=x+y
pause
subplot(311)
stem(m,x)
title('Sequence x(n)')
xlabel('Time Index "n"')
ylabel('Amplitude')
grid
subplot(312)
stem(m,y)
title('Sequence y(n)')
xlabel('Time Index "n"')
ylabel('Amplitude')
grid
subplot(313)
stem(m,z)
title('Sequence x(n)+y(n)')
xlabel('Time Index "n"')
ylabel('Amplitude')
grid
disp('Press a key to Continue...');
pause
disp('  ');
   choice=input('DO YOU WANT TO CONTINUE TO ADD SEQUENCES?(Y/N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end


