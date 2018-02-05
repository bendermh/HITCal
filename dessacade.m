function [ desacadedData ] = dessacade( rawData )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[~,endData] = size(rawData);
iter = 1;
desacadedData = [];
while iter <= endData
    corData = desacA(rawData(:,iter));
    desacadedData = vertcat(desacadedData,corData.');
    iter = iter + 1;
end
desacadedData = desacadedData.';
end
function [corrected] = desacA(rawImpulse)
accel = diff(rawImpulse);
[tama,~] = size(accel);
iter2 = 1;
accelPos = zeros(1,tama);
accelNeg = zeros(1,tama);
%Split in two psotive matrix
while iter2 <= tama
if accel(iter2)> 0
    accelPos(iter2) = accel(iter2);
end
if accel(iter2)<0
    accelNeg(iter2) = abs(accel(iter2));
end
iter2 = iter2 + 1;
end
%Positive correction
[~,loc,wid] = findpeaks(accelPos,'nPeaks',1,'minPeakProminence',30);
% Usar wid (ancho en la mitad o 5)
ancho = 6;
%EliminarPico
if loc+ancho < 61
    accelPos(1,loc-ancho:loc+ancho) = 0;
else
    accelPos(1,loc-ancho:61) = 0;
end
%negative correction
[~,loc,wid] = findpeaks(accelNeg,'nPeaks',1,'minPeakProminence',30);
ancho = round(wid);
%EliminarPico
if loc+ancho < 61
    accelNeg(1,loc-ancho:loc+ancho) = 0;
else
    accelNeg(1,loc-ancho:61) = 0;
end
x = (1:61).';
y = horzcat((accelPos-accelNeg),0).';
corrected = (cumtrapz(x,y)+rawImpulse(1));
end
