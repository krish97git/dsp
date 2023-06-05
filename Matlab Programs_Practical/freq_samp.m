% frequency sampling design of linear phase FIR filter

N = 64;                         % FFT length = filter length
np = floor(N/2) + 1;            % number of independent frequency points
n = 0:np-1;
w = n*2*pi/N;                   % frequency vector
M = sin(n*pi/(np-1));           % some desired magnitude response
D = M.*exp(-1i*(N-1)/2*w);      % desired complex frequency response (linear phase)
D = [D,conj(D(N-np+1:-1:2))];   % append redundant points for IFFT
h = ifft(D);                    % compute impulse response
max(abs(imag(h)))               % should be very close to 0
h = real(h);                    % remove numerical inaccuracies

% check result
[H,w2] = freqz(h,1,4*N);
plot(w/2/pi,abs(D(1:np)),'.',w2/2/pi,abs(H))

