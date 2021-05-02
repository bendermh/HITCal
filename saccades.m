% Jorge Rey Martinez 2017
% Inputs
% t = time array
% e = eye velocity array
% h = head velocity array
% s = Boolean, true if register is supresed VVOR false if VVOR
function saccades(t,e,h,s)
if isOctave
    scrsz = get(0,'ScreenSize');
else
    scrsz = get(groot,'ScreenSize');
end
if s == 1
    figure2 = figure('Name','SACCADES VORS ANALYSIS','NumberTitle','off','Position',[1 1 scrsz(3)/1.55 scrsz(4)/1.7]);
else
    figure2 = figure('Name','SACCADES VVOR ANALYSIS','NumberTitle','off','Position',[1 1 scrsz(3)/1.55 scrsz(4)/1.7]);
end
figure(figure2);
%SACCADES plot
subplot(2,1,1)
if s == 1
    desacE = medfilt1(e,35);
else
    desacE = medfilt1(e,30);
end
sacE = e-desacE;
plot(t,h,'b',t,sacE,'r','LineWidth',1.25)
%Calculate Sacades per Second
[peaks,locs] = findpeaks(abs(sacE),'MinPeakHeight',100,'MinPeakDistance',10);
[npeaks,~] = size(peaks);
[last,~]= size(t);
sacSec = (npeaks)/(t(last)-t(1));
[f,P1] = fourier(h);
[~,ind] = max(P1);
headFrec = f(ind);
headPeriod = 1/headFrec;
sacCyc = (npeaks)/((t(last)-t(1))/headPeriod);
%PlotData
string = ['Test Results - Saccades data (Saccades per second = ' num2str(sacSec) ' - Saccades per cycle = ' num2str(sacCyc) ' at ' num2str(headFrec) 'Hz. )'];
title(string)
xlabel('Time in secs')
ylabel('Velocity in deg/sec')
ylim([-400 +400])
legend ('Head velocity','Eye velocity')
%Plot Detectes Saccades
%subplot(3,1,2)
%findpeaks(abs(sacE),t,'MinPeakHeight',100,'MinPeakDistance',10);
%ylim([0 +400]);
%title('Detected Saccades Plot')
%xlabel('Time in secs')
%ylabel('Eye Velocity in deg/sec')
%Get sacades on time
headSacc = abs(h(locs));
[sizeHead,~]= size (headSacc);
pos = 1;
sac0 = 0;
sac50 = 0;
sac100 = 0;
sac150 = 0;
sac200 = 0;
sac250 = 0;
while pos < sizeHead
    if headSacc(pos) > 125
        sac250 = sac250 + 1;
    elseif headSacc(pos) > 100
        sac200 = sac200 + 1;
    elseif headSacc(pos) > 75
        sac150 = sac150 + 1;
    elseif headSacc(pos) > 50
        sac100 = sac100 + 1;
    elseif headSacc(pos) > 25
        sac50 = sac50 + 1;
    elseif headSacc(pos) > 0
        sac0 = sac0 + 1;
    end
    pos = pos + 1;
end
subplot(2,1,2)
total = sac0+sac50+sac100+sac150+sac200+sac250;
dataX = [(sac0/total)*100,(sac50/total)*100,(sac100/total)*100,(sac150/total)*100,(sac200/total)*100,(sac250/total)*100];
bar(dataX)
Labels = {'0-25', '25-50', '50-75', '75-100', '100-125', '>125'};
set(gca, 'XTick', 1:6, 'XTickLabel', Labels);
string = ['Saccade count by head velocity (Total Saccades = ' num2str(npeaks) ')'];
title(string)
xlabel('Head velocity intervals in deg/sec')
ylabel('% of sacaddes')

