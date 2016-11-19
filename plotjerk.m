xdata = transpose(linspace(0.004,1.004,251));
acelcab = 250*diff(low(low(low(datoscabeza(20:100,:)))));
prejerk = diff(acelcab);
[n2,n1] = size(prejerk);
posic = 1;
jerk = [];
while posic <= n1 
jerk = vertcat(jerk,prejerk(:,posic));
posic = posic + 1;
end
xdata = transp(linspace(0,n1,(n2*n1)));
jr = plot(xdata,250*(low(low(jerk))),'color','blue');
jr.LineWidth = 3;
fig = gca;
fig.XTick = 0:1:n1;
fig.XGrid = 'on';
fig.LineWidth = 2;
%Fourier
figure
[l,nul] = size(jerk);
Fs = 250;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = l;             % Length of signal
t = (0:L-1)*T; 
Y = fft(jerk);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
fft = plot(f,P1,'color','blue');
fft.LineWidth = 3;
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)');
ylabel('|P1(f)|');
xlim([0 20]);
ylim([0 275]);