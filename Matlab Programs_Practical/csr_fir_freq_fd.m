% Ideal Linear Phase FIR Filter Design Using Frequency Sampling Technique

loop=1;
while (loop==1)
   clc;
   disp('  ');
   disp('Linear Phase Ideal FIR Filter Design Using Frequency Sampling Technique');
   disp('Specification - Frequency Domain (Ideal Frequency Response)');
   disp(' ')
   disp('          1. Ideal FIR LOW PASS Filter')
   disp('          2. Ideal FIR HIGH PASS Filter')
   disp('          3. Ideal FIR BAND PASS Filter')
   disp('          4. Ideal FIR BAND STOP Filter')
   disp('  ');
   fltrtype=input('Select the Filter = ');
   switch (fltrtype)
   case 1,
      clc;
      disp('  ');
      disp('Ideal Linear Phase FIR LOW PASS Filter Design');
      disp('  ');
      N=input('Enter the Number of Filter Coefficients = ');
	  wc=input('Enter the DIGITAL Cutoff Frequency in Radians. = ');
      alpha=(N-1)/2
      kt=[];
      for k=0:N-1;
          wk=2*pi*k/N;
          if wk<=wc;
              Hk=exp(-j*alpha*wk);
              kt=[kt k]
          end
      end

   case 2,
      clc;
      disp('  ');
      disp('Ideal Linear Phase FIR HIGH PASS Filter Design');
      disp('  ');
      N=input('Enter the Number of Filter Coefficients = ');
	  wc=input('Enter the DIGITAL Cutoff Frequency in Radians. = ');
      
   case 3,
      clc;
      disp('  ');
      disp('Ideal Linear Phase FIR BAND PASS Filter Design');
      disp('  ');
      N=input('Enter the Number of Filter Coefficients = ');
	  wc1=input('Enter the DIGITAL Lower Cutoff Frequency in Radians. = ');
   	  wc2=input('Enter the DIGITAL Upper Cutoff Frequency in Radians. = ');

   case 4,
      clc;
      disp('  ');
      disp('Ideal Linear Phase FIR BAND STOP (REJECTION) Filter Design');
      disp('  ');
      N=input('Enter the Number of Filter Coefficients = ');
	  wc1=input('Enter the DIGITAL Lower Cutoff Frequency in Radians. = ');
   	  wc2=input('Enter the DIGITAL Upper Cutoff Frequency in Radians. = ');
   end

   
   Hmag=abs(Hk)
   Hphase=phase(Hk)
   b0=Hmag(1);
   a0=[1,-1];
   H0=tf(b0,a0);
   Hz=H0;
   if mod(N,2)==0
       for k=1:(N/2)-1;
           b=2*Hmag(k+1)*[cos(Hphase(k+1)),-cos(Hphase(k+1)-(2*pi*k/N))];
           a=[1,-2*cos(2*pi*k/N),1];
           H=tf(b,a)
           Hz=Hz+H
       end
       bnby2=Hmag((N/2)+1);
       anby2=[1,1];
       Hnby2=tf(bnby2,anby2)
       Hz=Hz+Hnby2
   else
       for k=1:(N-1)/2;
           b=2*Hmag(k+1)*[cos(Hphase(k+1)),-cos(Hphase(k+1)-(2*pi*k/N))];
           a=[1,-2*cos(2*pi*k/N),1];
           H=tf(b,a)
           Hz=Hz+H
       end
   end
   
   bc=[1,zeros(1,N-1),-1];
   ac=N
   HC=tf(bc,ac)
   
   HT=HC*Hz
   
   [BZ,AZ]=tfdata(HT,'v')
%   disp(BZ)
%   disp(AZ)
   K=length(AZ)
   lp=1;
   while (lp==1)
        AK=[]
        for i=1:K;
            if AZ(i)==0;
                i
                AK=AZ(i+1:K)
                pause
            end
        end
        lp=0;
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
