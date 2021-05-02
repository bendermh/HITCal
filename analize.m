% Jorge Rey Martinez & María Moserrat Soriano 2021 version 2.0
% VVOR AND VORS ANALYSIS
% Inputs
% t = time array
% e = eye velocity array
% h = head velocity array
% s = Boolean, true if register is supresed VVOR false if VVOR
function analize(t,e,h,s)

%Draw figure considering screen size
scrsz = get(groot,'ScreenSize');

if s == 1
    figure1 = figure('Name','VORS ANALYSIS','NumberTitle','off','Position',[5 50 scrsz(3)/1.01 scrsz(4)/1.2]);
else
    figure1 = figure('Name','VVOR ANALYSIS','NumberTitle','off','Position',[5 50 scrsz(3)/1.01 scrsz(4)/1.2]);
end
figure(figure1);

%%%%%% Numerical data CALCULATIONS section %%%%%%%%%%%%

% Get Desacade eye data
if s == 1
    desacE = medfilt1(e,35);
else
    desacE = medfilt1(e,30);
end
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

prePosPeakE = mean(findpeaks(posE));
preNegPeakE = mean(findpeaks(abs(negE)));
if prePosPeakE > preNegPeakE
    peakE = prePosPeakE;
    peakH = mean(findpeaks(posH));
else
    peakE = -preNegPeakE;
    peakH = -mean(findpeaks(abs(negH)));
end

%AUC Gain
aucPosEye = trapz(posE);
aucPosHead = trapz(posH);
aucNegEye = trapz(negE);
aucNegHead = trapz(negH);
gainPos = (aucPosEye/aucPosHead);
gainNeg = (aucNegEye/aucNegHead);
%velGainPos = mean(findpeaks(posE))/mean(findpeaks(posH));
%velGainNeg = mean(findpeaks(abs(negE)))/mean(findpeaks(abs(negH)));

%Eye Head Regression Gain
negB = negH\negE;
posB = posH\posE;
calcNegE = negB*negH;
calcPosE = posB*posH;

%%%%% PLOTS SECTION %%%%%

%RAW plot
subplot(3,2,1)
plot(t,h,'b',t,e,'r','LineWidth',1.25)
title('Test Output - RAW data')
xlabel('Time in secs')
ylabel('Velocity in deg/sec')
ylim([-400 +400])
legend ('Head velocity','Eye velocity')
%Desaccaded plot
subplot(3,2,2)
plot(t,h,'b',t,desacE,'r','LineWidth',1.25)
AUCTitle = strcat('Test Output - Desaccaded data  - ',' LEFT GAIN: ',num2str(gainPos),' -RIGHT GAIN: ',num2str(gainNeg));
title(AUCTitle)
xlabel('Time in secs')
ylabel('Velocity in deg/sec')
ylim([-400 +400])
legend ('Head velocity','Eye velocity')

% %Positive-Negative plots
% subplot(3,2,5)
% plot([posH,posE],'LineWidth',1.25)
% title('Positive vs Negative data - Desaccaded data')
% xlabel('Time in samples')
% ylabel('Velocity in deg/sec')
% hold on
% plot([negH,negE],'LineWidth',1.25)
% hold off
% legend ('Head velocity','Eye velocity','Head velocity','Eye velocity')

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
XYTitle = strcat('Head vs Eye plot - Desaccaded data',' LEFT GAIN: ',num2str(posB),' -RIGHT GAIN: ',num2str(negB));
title(XYTitle)
xlabel('Head Velocity in deg/sec')
ylabel('Eye Velocity in deg/sec')
plot(negH,calcNegE,posH,calcPosE,'LineWidth',5)
if s == 1
    plot(negH,negH,'r',posH,posH,'r','LineWidth',1.5)
    legend ('Negative data','Positive data','Negative regresion','Positive regresion','No Suppression line','Location','northwest')
else
    plot(negH,negH,'g',posH,posH,'g','LineWidth',1.5)
    legend ('Negative data','Positive data','Negative regresion','Positive regresion','Normality line','Location','northwest')
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


%Analysis of head oscillations variability:
distanciaPicos = 60;
lHeadPeaks = findpeaks(posH,'MinPeakDistance',distanciaPicos);
rHeadPeaks = findpeaks(abs(negH),'MinPeakDistance',distanciaPicos);
velocityTreshold = 25;
lHeadInvalids = lHeadPeaks<velocityTreshold;
rHeadInvalids = rHeadPeaks<velocityTreshold;
lHeadPeaks(lHeadInvalids) = [];
rHeadPeaks(rHeadInvalids) = [];
[lPeakN, ~] = size(lHeadPeaks);
[rPeakN, ~] = size(rHeadPeaks);
[lPR,rPR,saccadePositions] = prScore(t,e,h,s);

%PR PLOT only available in VVOR tests
if s ~= 1
    subplot(3,2,5)
    plot(t,h,'b',t,e,'r','LineWidth',1.5)
    prTitle = strcat('Saccade Recognition & PR Plot: ', '  Left PR:',num2str(lPR),',  Right PR: ',num2str(rPR));
    title(prTitle)
    xlabel('Time in samples')
    ylabel('Velocity in deg/sec')
    ylim([-400 +400])
    %add saccade detection to plot
    [sP,~,~] = find(t==saccadePositions);
    hold on
    plot(t(sP),e(sP),'ko')
    hold off
    legend ('Head velocity','Eye velocity','Detected Saccade')
end


%%%%%%%%%Output analysis results to text%%%%%%%%%%%%

resultG = strcat('GAIN RESULTS: ',' Left(area): ',num2str(gainPos),' Right(area): ',num2str(gainNeg),' || Left(slope): ',num2str(posB),' Right(slope): ',num2str(negB),' || Head Max(º/s):  ', num2str(peakH),' Eye Max: ',num2str(peakE));
if s~= 1
    resultPR = strcat('PR RESULTS: ',' Left PR Score: ',num2str(lPR),' Right PR score: ',num2str(rPR),' || Left/Right peaks > 25º/s: ',num2str(lPeakN),'/',num2str(rPeakN),' || Left/Right velocity SD of peaks: ',num2str(std(lHeadPeaks)),'/',num2str(std(rHeadPeaks)));
else
    resultPR = 'PR score is not available for VORS - supression - testing';
end
mTextBoxGain = uicontrol(figure1,'style','text');
mTextBoxPR = uicontrol(figure1,'style','text');
set(mTextBoxGain,'String',resultG);
set(mTextBoxGain,'FontSize',10);
set(mTextBoxGain,'HorizontalAlignment','left');
set(mTextBoxGain,'Position',[20 20 1300 25]);
set(mTextBoxPR,'String',resultPR);
set(mTextBoxPR,'FontSize',10);
set(mTextBoxPR,'HorizontalAlignment','left');
set(mTextBoxPR,'Position',[20 1 1600 25]);
set(figure1,'MenuBar','figure');
disp(resultG);
disp(resultPR);
end

