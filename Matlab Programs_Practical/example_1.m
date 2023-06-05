% Low Pass CHEBYCHEV FILTER DESIGN using Impulse Invariance Technique
% Pass Band Gain, Stop Band Attenuation
% Pass Band Edge Frequency, Stop Band Edge Frequency

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('CHEBYCHEV LOW PASS FILTER DESIGN using Impulse Invariance Technique');
   disp('Specifications are');
%    disp('Passband Edge Freq. in Hz and Gain in dB');
%    disp('Stopband Edge Freq. in Hz and Attenuation in dB');
   disp('  ');

   disp('Passband Gain Ap in dB (Positive Value Only) = ');
   rp=2;
   disp(rp)
   disp('Passband Edge Frequency in rads/sec. = ');
   wp=10;
   disp(wp)
   disp('Stopband Attenuation As in dB (Positive Value Only) = ');
   rs=50;
   disp(rs)
   disp('Stopband Edge Frequency in rads/sec. = ');
   ws=100;
   disp(ws)
   disp('Sampling Frequency in rads/sec = ');
   wsamp=1000;
   disp(wsamp)
   disp('Sampling Period T in secs. = ');
   T=(2*pi)/wsamp;
   disp(T)
   disp('Sampling Frequency fsamp Hz. = ');
   fsamp=1/T;
   disp(fsamp)

      epslon=sqrt(((10^(rp/10))-1))
      wn=wp
      N=ceil((rs-20*log10(epslon)+6)/(6+20*log10(ws/wp)))
      alfa=(epslon^(-1))+sqrt(1+(epslon^(-2)))
      a=0.5*((alfa^(1/N))-(alfa^(-1/N)))
      b=0.5*((alfa^(1/N))+(alfa^(-1/N)))
      x=a*wn
      y=b*wn
      
      z=[];
      sk=[];
      for k=0:N-1;
          sk=[sk,-x*sin((2*k+1)*pi/(2*N))+j*y*cos((2*k+1)*pi/(2*N))];
      end
      sk
      polemag=abs(sk)
      disp('Order of the Filter....')
      disp(N);
      disp('Pass Band Edge Frequency in Hz....')
      fn=wn/(2*pi)
      disp('Poles are....')
      disp(sk); 
      
      
      K=1;
      for n=1:N;
          K=K*polemag(n);
      end
      
      disp('Gain....')
      disp(K);
      [num,den]=zp2tf(z,sk,K);
      disp('Analog Chebychev Low Pass Filter Numerator Coefficients....')
      disp(num)
      disp('Analog Chebychev Low Pass Filter Denominator Coefficients....')
      disp(den)
   
   disp('Press a Key to Continue.......')
   pause;
   fres=0:0.01:3*max(wn);
   resps = freqs(num,den,fres);
   mags=20*log10(abs(resps));
   Fs=fres/(2*pi);
   figure(1);
   plot(Fs,mags);
   title('Analog Chebychev Low Pass Filter Frequency Response');
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ')
   disp('Press a key to Continue........')
   pause
   
%  Digital Filter Design
   
   disp(' ')
   disp('Impulse Invariance Transformation')
   [BZ,AZ]=impinvar(num,den,fsamp);
   disp('Digital Chebychev Low Pass Filter Numerator Coefficients....')
   disp(BZ)
   disp('Digital Chebychev Low Pass Filter Denominator Coefficients....')
   disp(AZ)

   [respz,frez]=freqz(BZ,AZ);
   
   magz=20*log10(abs(respz));
   fz=frez*fsamp/(2*pi);
   figure(2)
   plot(fz,magz);
   title('Digital Chebychev Low Pass Filter Frequency Response');
   xlabel('Frequency in Hz.');
   ylabel('Magnitude in dB.');
   grid;
   zoom;
   disp(' ')
   disp('Press a Key to Continue.......')
   pause
   disp('  ');
   choice=input('DO YOU WANT TO CONTINUE WITH THE DESIGN...?(Y)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end

   

% Chebychev Filter Design using Impulse Invariance Transformation

clc;
disp('Chebychev Filter Design using Impulse Invariance Transformation')
disp(' ')
disp('Spec: N = 3, fc = 5 K Hz, Ap = -3 dB, Fsamp = 100 KHz')
N=3;
fc=5*10^3;
Ap=-3;
T=10*10^(-6);
Fs=1/T;
wc=2*pi*fc
eps=sqrt(10^(-Ap/10)-1)
alpha=eps^(-1)+sqrt(1+eps^(-2))
a=.5*(alpha^(1/N)-alpha^(-1/N))
b=.5*(alpha^(1/N)+alpha^(-1/N))
x=a*wc
y=b*wc
disp('Press a Key to Continue')
pause

s0=-x*sin(pi/(2*N))+j*y*cos(pi/(2*N))
s1=-x
s2=conj(s0)
mags0=abs(s0)
mags1=abs(s1)
mags2=abs(s2)
disp('Press a Key to Continue')
pause

bs1=mags1
as1=[1,-s1]
Hs1=tf(bs1,as1)
disp('Press a Key to Continue')
pause

bs2=mags0*mags2
as2=[1,2*abs(real(s0)),bs2]
Hs2=tf(bs2,as2)
disp('Press a Key to Continue')
pause

Hs=Hs1*Hs2
disp('Press a Key to Continue')
pause

[ns,ds]=tfdata(Hs,'v');
[Rs,Oms]=freqs(ns,ds);
fres=Oms/(2*pi);
Msdb=20*log10(abs(Rs));
figure(1)
plot(fres,Msdb)
title('Magnitude Response of the Analog Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid
zoom
pause

magpoles=mags0*mags1*mags2

A=magpoles/((s0-s1)*(s0-s2))
B=magpoles/((s1-s0)*(s1-s2))
C=magpoles/((s2-s0)*(s2-s1))
disp('Press a Key to Continue')
pause

Bz0=B
Az0=[1,-exp(s1*T)]
Hz0=tf(Bz0,Az0)

Bz1=[A+C,-(A*exp(s2*T)+C*exp(s0*T))]
Az1=[1,-(exp(s0*T)+exp(s2*T)),exp((s0+s2)*T)]
Hz1=tf(Bz1,Az1)

Hz=T*(Hz0+Hz1)
disp('Press a Key to Continue')
pause

[num,den]=tfdata(Hz,'v')
[Resp,Omega]=freqz(num,den);
magdb=20*log10(abs(Resp));
fre=Omega*Fs/(2*pi);
figure(2)
plot(fre,magdb)
title('Magnitude Response of the Digital Filter')
xlabel('Frequency in Hz')
ylabel('Magnitude in dB')
grid
zoom