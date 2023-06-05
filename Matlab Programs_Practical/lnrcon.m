function [y] = lnrcon(x,h)

% Function for Linear Convolution
% x(n) and h(n) are the two sequences
% y(n) is the Convoluted Sequence

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