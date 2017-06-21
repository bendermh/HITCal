% Jorge Rey Martinez 2017
% Inputs
% t = time array
% e = eye velocity array
% h = head velocity array
% s = Boolean, true if register is supresed VVOR false if VVOR
function analize(t,e,h,s)
if isOctave
    scrsz = get(0,'ScreenSize');
else
    scrsz = get(groot,'ScreenSize');
end
if s == 1
    figure1 = figure('Name','VORS PLOTS','NumberTitle','off','Position',[1 scrsz(4)/1.2 scrsz(3)/1.01 scrsz(4)/1.2]);
else
    figure1 = figure('Name','VVOR PLOTS','NumberTitle','off','Position',[1 scrsz(4)/1.2 scrsz(3)/1.01 scrsz(4)/1.2]);
end
figure(figure1);
%Original plot
subplot(3,2,1)
plot(t,h,'b',t,e,'r','LineWidth',1.25)
title('Test Results - RAW data')
xlabel('Time in secs')
ylabel('Velocity in deg/sec')
ylim([-400 +400])
legend ('Head velocity','Eye velocity')
%Desaccaded plot
subplot(3,2,2)
if s == 1
    desacE = medfilt1(e,35);
else
    desacE = medfilt1(e,30);
end
%save('de.mat','desacE')
plot(t,h,'b',t,desacE,'r','LineWidth',1.25)
title('Test Results - Desaccaded data')
xlabel('Time in secs')
ylabel('Velocity in deg/sec')
ylim([-400 +400])
legend ('Head velocity','Eye velocity')
%get positive/neagtive data
limit = size(t);
posH = [];
posE = [];
negH = [];
negE = [];
for n = 1:limit
    if h(n) > 0
        posH = vertcat(posH,h(n));
        if desacE(n) > 0
            posE = vertcat(posE,desacE(n));
        else
            posE = vertcat(posE,0);
        end
    end
    if h(n) < 0
        negH = vertcat(negH,h(n));
        if desacE(n) < 0
            negE = vertcat(negE,desacE(n));
        else
            negE = vertcat(negE,0);
        end
    end
end
%Positive-Negative plots
subplot(3,2,5)
plot([posH,posE],'LineWidth',1.25)
title('Positive vs Negative data - Desaccaded data')
xlabel('Time in samples')
ylabel('Velocity in deg/sec')
hold on
plot([negH,negE],'LineWidth',1.25)
hold off
legend ('Head velocity','Eye velocity','Head velocity','Eye velocity')
%XY ploy & regresion line
subplot(3,2,6)
hold on
if isOctave
    scatter(negH,negE,'c','.');
    scatter(posH,posE,'b','.');
else
    scatter(negH,negE,'.b');
    scatter(posH,posE,'.','MarkerEdgeColor',[0 .7 .7]);
end
title('Head vs Eye plot - Desaccaded data')
xlabel('Head Velocity in deg/sec')
ylabel('Eye Velocity in deg/sec')
negB = negH\negE;
posB = posH\posE;
calcNegE = negB*negH;
calcPosE = posB*posH;
plot(negH,calcNegE,posH,calcPosE,'LineWidth',5)
if s == 1
    plot(negH,negH,'r',posH,posH,'r','LineWidth',1.5)
    legend ('Negative data','Positive data','Negative regresion','Positive regresion','No Suppression line','Location','eastoutside')
else
    plot(negH,negH,'g',posH,posH,'g','LineWidth',1.5)
    legend ('Negative data','Positive data','Negative regresion','Positive regresion','Normality line','Location','eastoutside')
end
hold off
%axis square
%Fourier plots
subplot(3,2,3)
[fHead,P1Head] = fourier(h);
[fEye,P1Eye] = fourier(e);
hold on
stem(fHead,P1Head,'b');
title('Single-Side Amplitude Spectrum of Head and Eye - RAW data')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 5])
stem(fEye,P1Eye,'r');
legend('Head','Eye')
hold off
%Desacade Fourier
subplot(3,2,4)
[fHead,P1Head] = fourier(h);
[fEye,P1Eye] = fourier(desacE);
hold on
stem(fHead,P1Head,'b');
title('Single-Side Amplitude Spectrum of Head and Eye - Desaccaded data')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 5])
stem(fEye,P1Eye,'r');
legend('Head','Eye')
hold off
%Numerical data
aucPosEye = trapz(posE);
aucPosHead = trapz(posH);
aucNegEye = trapz(negE);
aucNegHead = trapz(negH);
gainPos = (aucPosEye/aucPosHead);
gainNeg = (aucNegEye/aucNegHead);
velGainPos = mean(findpeaks(posE))/mean(findpeaks(posH));
velGainNeg = mean(findpeaks(abs(negE)))/mean(findpeaks(abs(negH)));
prePosPeakE = mean(findpeaks(posE));
preNegPeakE = mean(findpeaks(abs(negE)));
if prePosPeakE > preNegPeakE
    peakE = prePosPeakE;
    peakH = mean(findpeaks(posH));
else
    peakE = -preNegPeakE;
    peakH = -mean(findpeaks(abs(negH)));
end
result = strcat('+Area gain: ',num2str(gainPos),' -Area gain: ',num2str(gainNeg),' || +Slope: ',num2str(posB),' -Slope: ',num2str(negB),' || +Velocity gain: ',num2str(velGainPos),' -Velocity gain: ',num2str(velGainNeg),' || Head Maxs(deg/s):  ', num2str(peakH),' Eye Maxs: ',num2str(peakE),' || DCoff.: ', num2str(velGainPos-velGainNeg));
display(result)
if ~isOctave
    mTextBox = uicontrol('style','text');
    set(mTextBox,'String',result)
    set(mTextBox,'FontSize',12)
    set(mTextBox,'Position',[20 5 1300 25])
    set(figure1,'MenuBar','figure')
end

