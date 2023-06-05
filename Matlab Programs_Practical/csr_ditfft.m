% Implementation of DIT-FFT Algorithm

clear all;
clc;
% y=[1:8]+j*[1:8];
y=[1 2 3 4 5 6 7 8];

yy=y;
N=8;

% b=log2(N);
% NN=N;
% for n=0:NN-1
%    y
%    g(n+1)=y(numrev(n,b)+1)
%    pause
% end
[g,i]=bitrevorder(y)
g
k=N/2;
M=2;

while k>=1
   for m=1:k
      x=0;
      x=g(1:NN);
      for p=1:M/2
         n=p+(M*(m-1))
         a1=n+M/2
         pause
         xdumm=x(a1)*exp(-j*2*pi*(p-1)/M);
         g(n)=x(n)+xdumm;
         g(a1)=x(n)-xdumm;
      end
   end
   k=k/2;
   M=M*2;
end

disp('Sequence is');
disp(y);
disp('FFT Computed');
disp(g);
disp('FFT from inbuilt function');
disp(fft(yy));