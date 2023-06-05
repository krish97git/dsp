% Implementation of DIT-FFT Algorithm

clear all;
clc;
% y=[1:8]+j*[1:8];
y=[1 2 3 4 5 6 7 8];

yy=y;
N=8;


NN=N+1;
M=N;
P=log2(M);
k=1;

while k<NN
   for m=1:k
      x=0;
      x=y(1:M);
      for p=1:N/2
         n=p+(N*(m-1));
         a1=n+N/2
         pause
         g(n)=x(n)+x(a1);
         g(a1)=[x(n)-x(a1)]*exp(-j*2*pi*(p-1)/N);
      end
     y=g;
 end
 k=k*2;
 N=N/2;
end

b=log2(M);
for n=0:M-1
    g
   y(n+1)=g(numrev(n,b)+1)
   pause
end

disp('FFT Computed');
disp(y);
disp('FFT from inbuilt function');
disp(fft(yy));