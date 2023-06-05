function [xk]=dft(x,N)

% Function to Implement DFT
% X = DFT Output --- Discrete frequency domain
% x = Input to DFT --- Discrete Time Domain
% N = Number of point DFT
lx = length(x);
b= -j*2*pi/N;
xk=[];
for k=0:N-1
   xk(k+1)=0;
   for n=0:lx-1
      xk(k+1)=xk(k+1)+x(n+1)*exp(b*k*n);
   end
end