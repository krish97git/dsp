clc;
fsamp=10000;
f1=1000;
f2=2500;
f3=3200;
f4=500;

f=[f1 f2 f3 f4]

tmax=2*1/f4;

t=0:1/fsamp:3*tmax;
x1=sin(2*pi*f1*t);
x2=sin(2*pi*f2*t);
x3=sin(2*pi*f3*t);
x4=sin(2*pi*f4*t);

x=x1+x2+x3+x4;
N=length(x);


Xk=fft(x,5*N);

M=length(Xk);
k = 0:M-1;
freq=fsamp*k/M;
figure(1)
plot(freq,abs(Xk))

signl=[];
for t=0:1/fsamp:3*tmax;
    sig=0;
    for i=1:4
        sig=sig + sin(2*pi*f(i)*t);
    end
    signl=[signl,sig]
end

N1=length(signl);


Xk1=fft(signl,5*N1);

M1=length(Xk1);
k1 = 0:M1-1;
freq1=fsamp*k1/M1;
figure(2)
plot(freq1,abs(Xk1))

