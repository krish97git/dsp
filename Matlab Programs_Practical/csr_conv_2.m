% To find Convolution of Two Sequences

clc;
x=input('Enter the sequence x(n) = ');
h=input('Enter the sequence h(n) = ');

y1 = csrconv(x,h)
y2 = conv(x,h)
