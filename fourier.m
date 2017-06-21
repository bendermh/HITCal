function [f,P1] = fourier(data)
Fs = 250;                     % Sampling frequency
[L,~] = size(data);           % Length of signal
X = data;                     % Data
Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:fix(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;