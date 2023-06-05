function [y] = csrconv(x,h)

% Function to Implement Convolution of Two Sequences
% x and h are two sequences
% y is the Convoluted Sequence

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
