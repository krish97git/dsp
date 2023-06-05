% Write a Matlab program to generate and plot a composite signal 
% that contains 10 random tones with a maximum of 3 KHz frequency using a Matlab program. 
% Draw the spectrum of the composite signal generated. Write a Matlab Code to obtain the spectrum.

clear All;
clc;

fsamp=10000;
T=1/fsamp;
signlfre = 3000 * (rand(1,10))
minfre = min(signlfre);
maxfre = max(signlfre);

t = 0:T:5*1/minfre;
x1=sin(2*pi*signlfre(1)*t);
x2=sin(2*pi*signlfre(2)*t);
x3=sin(2*pi*signlfre(3)*t);
x4=sin(2*pi*signlfre(4)*t);
x5=sin(2*pi*signlfre(5)*t);
x6=sin(2*pi*signlfre(6)*t);
x7=sin(2*pi*signlfre(7)*t);
x8=sin(2*pi*signlfre(8)*t);
x9=sin(2*pi*signlfre(9)*t);
x10=sin(2*pi*signlfre(10)*t);

x=x1+x2+x3+x4+x5+x6+x7+x8+x9+x10;

% figure(1)
subplot(2,2,1)
t = 0:T:5*1/minfre;
plot(t,x)
title('Plot of Sum of Signals Generated....')
xlabel('Time in Seconds...')
ylabel('Amplitude...')
grid;

% disp(' ')
% disp('Press a Key to Continue.....')
% pause

compsignl = [];
for t = 0:T:5*1/minfre
    signl = 0;
    for i = 1:length(signlfre)
        signl = signl + sin(2*pi*signlfre(i)*t);
    end
    compsignl = [compsignl,signl];
end

% Composite Signal Plot

%figure(2)
subplot(2,2,3)
t = 0:T:5*1/minfre;
plot(t,compsignl)
title('Composite Signal...')
xlabel('Time in Seconds...')
ylabel('Amplitude...')
grid;

% disp(' ')
% disp('Press a Key to Continue.....')
% pause

% Spectrum of Sum of Signals Generated
M1=length(x);
sptrum1=fft(x,M1);
b1=0:M1-1;
f1=fsamp*b1/M1;
% length(f1)
% length(abs(sptrum1))
%figure(3)
subplot(2,2,2)
plot(f1,abs(sptrum1))
title('Plot of Spectrum of Sum of Signals Generated....')
xlabel('Time in Seconds...')
ylabel('Amplitude...')
grid

% disp(' ')
% disp('Press a Key to Continue.....')
% pause

M2=length(compsignl);
sptrum2=fft(compsignl,M2);
b2=0:M2-1;
f2=fsamp*b2/M2;
% length(f2)
% length(abs(sptrum2))
%figure(4)
subplot(2,2,4)
plot(f2,abs(sptrum2));
title('Plot of Spectrum of Composite Signal...')
xlabel('Time in Seconds...')
ylabel('Amplitude...')
grid

% disp(' ')
% disp('Press a Key to Continue.....')
% pause
