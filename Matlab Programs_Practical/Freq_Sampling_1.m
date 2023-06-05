% Implemetation of Frequency Sampled Transfer Function
% 

b1=[3];
a1=[1 -1];
H1 = tf(b1,a1)

%Transfer function H1:
% 4.5
%-----
%s - 1

b2=2*2.707*[1,-.707];
a2=[1,-1.414,1];
H2=tf(b2,a2) 
%Transfer function H2:
% 0.809 s - 0.809
%-----------------
%s^2 - 0.618 s + 1
 
b3=2*2*[1];
a3=[1,0,1];
H3=tf(b3,a3) 
%Transfer function H3:
%-0.309 s + 0.309
%-----------------
%s^2 + 1.618 s + 1

b4=2*1.293*[1,0.707];
a4=[1,1.414,1]
H4=tf(b4,a4)

b5=[1];
a5=[1,1];
H5=tf(b5,a5)

H6=H1+H2+H3+H4+H5
%Transfer function H4:
%                 5 s^4 + 5 s^3 + 2.5 s^2 + 5 s + 5
%-------------------------------------------------------------------
%s^5 + 2.22e-016 s^4 + 7.6e-005 s^3 - 7.6e-005 s^2 - 2.22e-016 s - 1
 
b7=[1,0,0,0,0,0,0,0,-1];
a7=8;
H7=tf(b7,a7)
%Transfer function H5:
%s^5 - 1
%-------
%   5
 
H=H7*H6
%Transfer function H=H5*(H1+H2+H3+H4):
%5 s^9 + 5 s^8 + 2.5 s^7 + 5 s^6 + 5 s^5 - 5 s^4 - 5 s^3 - 2.5 s^2 - 5 s - 5
%---------------------------------------------------------------------------
%    5 s^5 + 1.11e-015 s^4 + 0.00038 s^3 - 0.00038 s^2 - 1.11e-015 s - 5

b=[12,8,4,-4,-4,4,4,-.000604,-12,-8,-4,4,4,-4,-4,.000604];
a=[8,0,.004832,0,0,0,-.004832,0,-8];
figure(1)
impz(b,a)

[BZ,AZ]=tfdata(H,'v')
%disp(BZ)
%disp(AZ)
N=length(AZ)
loop=1;
while (loop==1)
    AK=[]
    for i=1:N;
        if AZ(i)==0;
            AK=AZ(i+1:N);
        end
    end
    loop=0;
end
AK
figure(2)
impz(BZ,AK)
            
