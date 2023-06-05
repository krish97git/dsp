% Finding the DFT and Inverse DFT using DFT module
loop=1;
while (loop==1)
    clc;
    disp('Inverse DFT Calculation Using DFT')
    disp(' ')
    x = input('Enter the Sequence to find the DFT x(n) = ');
    disp(' ')
    disp('Number of Point DFT "N" need to be greater than or equal to number of elements in x(n)')
    disp(' ')
    N = input('Enter the Number of Point DFT "N" = ')
    
    lx=length(x);
%     if lx<=N
%         x=[x zeros(1,N-lx)];
%     end

    XK1 = dft(x,N);
    disp('DFT Using User Defined Function = ');
    XK1
    XK2 = fft(x,N);
    disp('DFT Using Built in Function = ');
    XK2
    XKConj1 = conj(XK1);
    XKConj2 = conj(XK2);
    XK3 = dft(XKConj1,N);
    XK4 = fft(XKConj2,N);
    XKOut1 = conj(XK3)/N;
    disp('IDFT Using User Defined Function = ');
    XKOut1
    XKOut2 = conj(XK4)/N;
    disp('IDFT Using Built in Function = ');
    XKOut2
    disp('  ');
    disp('Press a key to Continue...');
    pause
    disp(' ')
   choice=input('DO YOU WANT TO CONTINUE THE DFT & IDFT CALCULATION..?(Y/N)= ','s');
   switch upper(choice)
   case 'Y',
      loop=1;
   otherwise
      loop=0;
   end
end