%Updated on 2020 to read native english CSV files with the collaboration of
%Rachael Taylor
function [t,e,h] = read(s)
t = [];
e = [];
h = [];
[file,directory] = uigetfile('.csv','Select "ASCII results File" to import');
if file == 0
    return
end
fullArchive = fullfile(directory,file);
readFile = fopen(fullArchive);
tline = fgetl(readFile);
readnow = 0;
timeData = '';
eyeData = '';
headData = '';
commaDelimiter = 0;
while ischar(tline)
    if readnow == 3
        timeData = tline;
    end
    if readnow == 4
        eyeData = tline;
    end
    if readnow == 5
        headData = tline;
        break
    end
    if s == 1
        if strcmp(tline,'Test Type;VORS — Horizontal')||strcmp(tline,'Test Type;SRVO — Horizontal')||strcmp(tline,'Tipo de Prueba;SRVO — Horizontal')||strcmp(tline,'Test Type,VORS — Horizontal')
            if strcmp(tline,'Test Type,VORS — Horizontal')
                commaDelimiter = 1;
            end
            readnow = 1;
        end
    else
        if strcmp(tline,'Test Type;VVOR — Horizontal')||strcmp(tline,'Tipo de Prueba;RVVO — Horizontal')||strcmp(tline,'Test Type;RVVO — Horizontal')||strcmp(tline,'Test Type,VVOR — Horizontal')
            if strcmp(tline,'Test Type,VVOR — Horizontal')
                commaDelimiter = 1;
            end
            readnow = 1;
        end
    end
    
    if readnow > 0
        readnow = readnow + 1;
    end
    tline = fgetl(readFile);
end
fclose(readFile);
if commaDelimiter == 0
    timeData = strrep(timeData, ',', '.');
    timeData = strsplit(timeData,';');
    timeData = timeData(2:end);
    eyeData = strrep(eyeData, ',', '.');
    eyeData = strsplit(eyeData,';');
    eyeData = eyeData(2:end);
    headData = strrep(headData, ',', '.');
    headData = strsplit(headData,';');
    headData = headData(2:end);
else
    timeData = strsplit(timeData,',');
    timeData = timeData(2:end);
    eyeData = strsplit(eyeData,',');
    eyeData = eyeData(2:end);
    headData = strsplit(headData,',');
    headData = headData(2:end);
end
[~,b] = size(timeData);
for n = 1:b-1
    t = vertcat(t,str2double(timeData{1,n}));
    e = vertcat(e,str2double(eyeData{1,n}));
    h = vertcat(h,str2double(headData{1,n}));
end
question = questdlg('Do you want to select a time period or do you want to use entrie data?','Select time window','SET TIME RANGE','USE ALL DATA','USE ALL DATA');
if strcmp(question,'SET TIME RANGE')
    prompt = {'Enter min value of seconds:','Enter max value of seconds:'};
    dlg_title = 'Input range';
    num_lines = 1;
    defaultans = {'',''};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    validation = 1;
    [a,~] = size(answer);
    if a < 2
        display('Max and/or Min are/is missing')
        validation = 0;
    end
    minim = str2double(answer{1,1});
    maxim = str2double(answer{2,1});
    if isnan(minim)||isnan(maxim)
        display('Data must to be numeric. Decimal separator is "."')
        validation = 0;
    end
    if maxim < minim
        display('Max is < than Min')
        validation = 0;
    end
    if validation == 1
        [~,minpos] = min(abs(t-minim));
        [~,maxpos] = min(abs(t-maxim));
        t = t(minpos:maxpos);
        e = e(minpos:maxpos);
        h = h(minpos:maxpos);
    end
end






