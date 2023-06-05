function [numr]=numrev(num,N)
% function [numr]=numrev(num,N)
% Function to Perform Bit Reversal
% num = Input index which has to be Bit Reversed
% N = Number of bits required to represent num
% numr = Bit reversed values of num

s=[];
for q=N-1:-1:0
   if num>=pow2(q)
      num=num-pow2(q);
      rem=1;
   else
      rem=0;
   end
   s=[s rem];
end
numflip=fliplr(s);

q=[N-1:-1:0];
q1=pow2(q);
numr=sum(numflip.*q1);
