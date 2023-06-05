% FIR Filter Design Using Frequency Sampling Technique

loop=1;
while (loop==1)
   clear all;
   clc;
   disp('  ');
   disp('FIR Filter Design Using Frequency Sampling Technique');
   disp('Specification - Time Domain (Impulse Response)');
   disp(' ')
   h=input('Enter Desired Impulse Response "h(n)" of the FIR filter = ');
   N=length(h);
   Hk=fft(h,N)
   Hmag=abs(Hk)
   Hphase=phase(Hk)
   disp('Press a Key to Continue...');
   pause
   b0=Hk(1);
   a0=[1,-1];
   H0=tf(b0,a0)
   disp('Press a Key to Continue...');
   pause
   Hz=H0;
   if mod(N,2)==0
       for k=1:(N/2-1);
           b=2*Hmag(k+1)*[cos(Hphase(k+1)),-cos(Hphase(k+1)-(2*pi*k/N))];
           a=[1,-2*cos(2*pi*k/N),1];
           H(k)=tf(b,a)
           disp('Press a Key to Continue...');
           pause
           Hz=Hz+H(k)
           disp('Press a Key to Continue...');
           pause
       end
       bnby2=Hk((N/2)+1);
       anby2=[1,1];
       Hnby2=tf(bnby2,anby2)
       disp('Press a Key to Continue...');
       pause
       Hz=Hz+Hnby2
       disp('Press a Key to Continue...');
       pause
   else
       for k=1:(N-1)/2;
           b=2*Hmag(k+1)*[cos(Hphase(k+1)),-cos(Hphase(k+1)-(2*pi*k/N))];
           a=[1,-2*cos(2*pi*k/N),1];
           H(k)=tf(b,a)
           disp('Press a Key to Continue...');
           pause
           Hz=Hz+H(k)
           disp('Press a Key to Continue...');
           pause
       end
   end
   
   bc=[1,zeros(1,N-1),-1];
   ac=N;
   HC=tf(bc,ac)
   disp('Press a Key to Continue...');
   pause
   
   HT=HC*Hz
   disp('Press a Key to Continue...');
   pause
   
   [BZ,AZ]=tfdata(HT,'v')
%   disp(BZ)
%   disp(AZ)
   K=length(AZ)
   lp=1;
   while (lp==1)
        AK=[];
        for i=1:K;
%            AZ(i)
            if AZ(i)==0;
                AK=AZ(i+1:K)
                disp('Press a Key to Continue...');
                pause
            else
                lp=0;
            end
        end
   end
   AK
   impz(BZ,AK)
           
   disp('  ');
   choice=input('DO YOU WANT TO CONTINUE WITH THE DESIGN...?(Y)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end
