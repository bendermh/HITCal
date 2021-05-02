% Jorge Rey Martinez & María Moserrat Soriano 2021
% PR SCORE FOR VVOR TEST
% Inputs
% t = time array
% e = eye velocity array
% h = head velocity array
% s = Boolean, true if register is supresed VVOR false if VVOR
% Outputs
% PR score for left and rignt sides and detected saccade possition time
function [lPR,rPR,sacadePositions] = prScore(t,e,h,s)
lPR = NaN;
rPR = NaN;
sacadePositions = [];
%PR will not work in Supression
if s ~= 1
    %Divide data in individual R/L impulses
    %find first after Zero points
    sigPos = logical(h > 0);%Determine positive and negatve values
    cros = sigPos - circshift(sigPos,1); %get sign changes
    crosPos = find(cros);
    % Get distances from oscillation start to 1st 2nd and 3rd saccades
    [a,~] = size(crosPos);
    %a = 4; %Debug
    n = 2;
    latencyMatrixR = [];
    latencyMatrixL = [];
    while n <= a
        hInt = h(crosPos(n-1):crosPos(n));
        eInt = e(crosPos(n-1):crosPos(n));
        tInt = t(crosPos(n-1):crosPos(n));
        if cros(crosPos(n-1)) == 1
            left = true;
        else
            left = false;
        end
        if isOctave
            [peaks,locs] = findpeaks(abs(eInt),'MinPeakHeight',240,'MinPeakDistance',10);
        else
            [peaks,locs] = findpeaks(abs(eInt),'MinPeakHeight',240,'SortStr','descend');
        end
        
        if ~isempty(locs)
            latency = tInt(locs(1))-tInt(1);
            sacadePositions = horzcat(sacadePositions,tInt(locs(1)));
            if left
                latencyMatrixL = horzcat(latencyMatrixL,latency);
            else
                latencyMatrixR = horzcat(latencyMatrixR,latency);
            end
        else
            %disp('No peak found') %Debug
        end
        n = n + 1;
    end
    [~,lSize] = size(latencyMatrixL);
    [~,rSize] = size(latencyMatrixR);
    if lSize > 3
        lPR = round(((std(latencyMatrixL))/(mean(latencyMatrixL)))*100);
    end
    if rSize > 3
        rPR = round(((std(latencyMatrixR))/(mean(latencyMatrixR)))*100);
    end
end
end