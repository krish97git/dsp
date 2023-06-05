% Ideal Linear Phase BAND STOP FIR Filter Design Using Frequency Sampling Technique

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('Linear Phase Ideal BAND STOP FIR Filter Design Using Frequency Sampling Technique');
   disp('Specification - Frequency Domain (Ideal Frequency Response)');
   disp('  ');
   N=input('Enter the Number of Filter Coefficients (ODD / EVEN Number) = ');
   wc1=input('Enter the Lower DIGITAL Cutoff Frequency (in Radians) wc1 = ');
   wc2=input('Enter the Upper DIGITAL Cutoff Frequency (in Radians) wc2 = ');
   
   alpha=(N-1)/2;
   Hk=[];
   kt=[];
   if mod(N,2)==0
       for kn=0:(N/2);
           wk=2*pi*kn/N;
           if (wk<=wc1) || (wk>=wc2);
               Hk=[Hk exp(-j*alpha*wk)];
               kt=[kt kn]
               disp('Press a Key to Continue...');
               pause
               disp('wk is value*pi');
               wk/pi
               disp('Press a Key to Continue...');
               pause
           end
       end
   else
       for kn=0:(N-1)/2;
           wk=2*pi*kn/N;
           if (wk<=wc1) || (wk>=wc2);
               Hk=[Hk exp(-j*alpha*wk)];
               kt=[kt kn]
               disp('Press a Key to Continue...');
               pause
               disp('wk is value*pi');
               wk/pi
               disp('Press a Key to Continue...');
               pause
           end
       end   
   end
   
   disp('DFT Samples...')
   Hk
   disp('Press a Key to Continue...')
   pause
   disp('Magnitude of DFT Samples...')
   Hmag=abs(Hk)
   disp('Phase of DFT Samples...')
   Hphase=phase(Hk)
   disp('Press a Key to Continue...')
   pause
   
   b0=Hmag(1);
   a0=[1,-1];
   H0=tf(b0,a0)
   disp('Press a Key to Continue...')
   pause
   Hz=H0
   disp('Press a Key to Continue...')
   pause
   
   if mod(N,2)==0
       for k=2:length(kt);
           b=2*Hmag(k)*[cos(Hphase(k)),-cos(Hphase(k)-(2*pi*kt(k)/N))];
           a=[1,-2*cos(2*pi*kt(k)/N),1];
           H=tf(b,a)
           disp('Press a Key to Continue...')
           pause
           Hz=Hz+H
           disp('Press a Key to Continue...')
           pause
       end
       bnby2=Hk(length(Hk));
       anby2=[1,1];
       Hnby2=tf(bnby2,anby2)
       disp('Press a Key to Continue...')
       pause
       
       Hz=Hz+Hnby2
       disp('Press a Key to Continue...')
       pause
   else
       for k=2:length(kt);
           b=2*Hmag(k)*[cos(Hphase(k)),-cos(Hphase(k)-(2*pi*kt(k)/N))];
           a=[1,-2*cos(2*pi*kt(k)/N),1];
           H=tf(b,a)
           disp('Press a Key to Continue...')
           pause
           Hz=Hz+H
           disp('Press a Key to Continue...')
           pause
       end
   end
   
   bc=[1,zeros(1,N-1),-1];
   ac=N;
   HC=tf(bc,ac)
   disp('Press a Key to Continue...')
   pause
   
   HT=HC*Hz
   disp('Press a Key to Continue...')
   pause
   
   [BZ,AZ]=tfdata(HT,'v')
%   disp(BZ)
%   disp(AZ)
   K=length(AZ);
   lp=1;
   while (lp==1)
        AK=[]
        for i=1:K;
            if AZ(i)==0;
                AK=AZ(i+1:K)
                disp('Press a Key to Continue...')
                pause
            else
                lp=0;
            end
        end
   end
   
   AK
   w=0:.001*pi:pi;
   Hw=freqz(BZ,AK,w);
   Domega=w/pi;
   plot(Domega,abs(Hw))
   title('Frequency Response of the Designed Filter')
   xlabel('Digital Freq is Value * pi Radians')
   ylabel('Magnitude of the Frequency Response')
   grid
   disp('  ');
   choice=input('DO YOU WANT TO CONTINUE WITH THE DESIGN...?(Y)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
