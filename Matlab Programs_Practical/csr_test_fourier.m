clc;
clear all;
close all;
syms x;
f = exp(-x^2);
disp('The input equation is ...');
disp(f);
a = fourier(f);
disp('The Fourier Transform of the input equation is ...')
disp(a);
b = ifourier(a);
disp('The Inverse Fourier Transform is ...')
disp(b);