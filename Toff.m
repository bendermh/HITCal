function varargout = Toff(varargin)
% TOFF MATLAB code for Toff.fig
%      TOFF, by itself, creates a new TOFF or raises the existing
%      singleton*.
%
%      H = TOFF returns the handle to a new TOFF or the handle to
%      the existing singleton*.
%
%      TOFF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOFF.M with the given input arguments.
%
%      TOFF('Property','Value',...) creates a new TOFF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Toff_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Toff_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Toff

% Last Modified by GUIDE v2.5 13-Apr-2018 10:09:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Toff_OpeningFcn, ...
    'gui_OutputFcn',  @Toff_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Toff is made visible.
function Toff_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Toff (see VARARGIN)

% Choose default command line output for Toff
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Toff wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Toff_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vhgencabizq vhgenojoizq actual3 tspojo tspcabeza ErasedTOF windowSize ganac gananciasCorr destspojo modifiedPeaks potoN potoD;
windowSize = 0;
actual3 = 1;
tspcabeza = vhgencabizq(20:80,:);
tspojo = vhgenojoizq(20:80,:);
gananciasCorr = (ganac*0.0001);
destspojo = dessacade(tspojo);
[~,b] = size(tspcabeza);
ErasedTOF = zeros(b,1);
modifiedPeaks = zeros(b,1);
potoN = 3;
potoD = 0.005;
set(handles.edit2,'string',num2str(potoN))
set(handles.edit3,'string',num2str(potoD))
displayOne(handles)
displayAll(handles)
% Get default command line output from handles structure
varargout{1} = handles.output;

function displayOne(handles)
global actual3 tspojo tspcabeza windowSize gananciasCorr destspojo modifiedPeaks
%Gráficos
axes (handles.singlePlot);
hold all
cla
plot(tspcabeza(:,actual3),'color','blue','LineWidth',2);
plot(tspojo(:,actual3),'color',[1 0.5 0],'LineWidth',2);
plot(destspojo(:,actual3),'.','color',[1 0.5 0],'LineWidth',1);
if modifiedPeaks(actual3) == 0
    [eyePeak,eyePeakPos] = max(destspojo(:,actual3));
    set(handles.edit1,'string',num2str(eyePeakPos));
else
    eyePeakPos = modifiedPeaks(actual3);
    preEye = tspojo(:,actual3);
    eyePeak = preEye(eyePeakPos);
    set(handles.edit1,'string',num2str(eyePeakPos));
end

preHead = tspcabeza(:,actual3);
headPeakPos = eyePeakPos;
headPeak = preHead(eyePeakPos);
plot(eyePeakPos,eyePeak,'ok','markerSize',10)
plot(headPeakPos,headPeak,'om','markerSize',10)
ylim('auto')
xlim ([0 61])
xlabel('Time in samples')
ylabel('Velocity in degrees/s')
impulseOjo = find(tspojo(:,actual3) > 15);
impulseCabeza = find(tspcabeza(:,actual3) > 15);
startCabeza = impulseCabeza(1);
tooDelay = 0;
% to check if there is eye response
if isempty(impulseOjo)
    startOjo = NaN;
else
    startOjo = impulseOjo(1);
end
%to check if there is not a saccade
if startOjo > 25
    tooDelay = 1;
end
[a,sH,sE,x0,~]= analizeTOF(tspcabeza(:,actual3),tspojo(:,actual3),startCabeza,startOjo,windowSize);

xRegH = (1:20);
xRegE = (1:20);
regH = (xRegH)*sH;
regE = (xRegE)*sE;
xRegH = xRegH + (startCabeza - 3);
xRegE = xRegE + (startOjo - 3);
plot(xRegH,regH,'--','color','blue','LineWidth',2)
plot(xRegE,regE,'--','color',[1 0.5 0],'LineWidth',2)
title(strcat('Angle a:', num2str(a),' º'));
plot((x0+startCabeza),tspojo((x0+startCabeza),actual3),'kp','MarkerSize',12);
axes (handles.polarPlot);
hold all;
[x,y] = pol2cart(a*pi/180,1);
hold off;
if a < 5
    compass(x,y,'b')
else
    compass(x,y,'r')
end
%Output Data
angleString = ['This impulse alpha angle: ' num2str(a) 'º'];
gainString = ['This impulse AUC gain: ' num2str(gananciasCorr(actual3))];
peakString = ['This impulse peak gain: ' num2str(eyePeak/headPeak)];
potoString = ['This impulse PoTo X: ' num2str(x0) ' smp. Y: ' num2str(tspojo((x0+startCabeza))) 'º/s'];
set(handles.text8,'string',angleString);
set(handles.text9,'string',gainString);
set(handles.text16,'string',peakString);
set(handles.text19,'string',potoString);
%Plot format
t = findall(gca,'type','text');
set(t(16),'String',' ');
set(t(17),'String',' ');
%set(t(18),'String',' ');
%set(t(19),'String',' ');
set(t(13),'String',' ');
set(t(14),'String',' ');
set(t(15),'String',' ');
axis off;

function displayAll(handles)
global tspojo tspcabeza gananciasCorr ErasedTOF windowSize destspojo modifiedPeaks
[~,tamano3] = size (tspcabeza);
iter5 = 1;
iter6 = 1;
selectedA = [];
selectedAUC = [];
selectedPoToX = [];
selectedPoToY = [];
peaks = [];
peaksGains = zeros(tamano3,1);
while iter6 <= tamano3
    [ev,ep] = max(destspojo(:,iter6));
    preh = tspcabeza(:,iter6);
    hv = preh(ep);
    peaksGains(iter6) = ev/hv;
    iter6 = iter6+1;
end
while iter5 <= tamano3
    if ~ErasedTOF(iter5)
        impulseOjo = find(tspojo(:,iter5) > 15);
        impulseCabeza = find(tspcabeza(:,iter5) > 15);
        startCabeza = impulseCabeza(1);
        tooDelay = 0;
        % to check if there is eye response
        if isempty(impulseOjo)
            startOjo = NaN;
        else
            startOjo = impulseOjo(1);
        end
        %to check if there is not a saccade
        if startOjo > 25
            tooDelay = 1;
        end
        
        [a,~,~,x0,~]= analizeTOF(tspcabeza(:,iter5),tspojo(:,iter5),startCabeza,startOjo,windowSize);
        selectedA = vertcat(selectedA,a);
        selectedAUC = vertcat(selectedAUC,gananciasCorr(iter5));
        selectedPoToX = vertcat(selectedPoToX,[x0 startOjo]);
        selectedPoToY = vertcat(selectedPoToY,tspojo((x0+startOjo),iter5));
        size(modifiedPeaks);
        if modifiedPeaks(iter5) == 0
            peaks = vertcat(peaks,peaksGains(iter5));
        else
            allEyeData = tspojo(:,iter5);
            allHeadData = tspcabeza(:,iter5);
            mev = allEyeData(modifiedPeaks(iter5));
            mhv = allHeadData(modifiedPeaks(iter5));
            
            peaks = vertcat(peaks,mev/mhv);
        end
    end
    iter5 = iter5 + 1;
end
angleString = ['ALL impulses alpha angle: ' num2str(mean(selectedA)) 'º' ' (SD: ' num2str(std(selectedA)) 'º)'];
gainString = ['ALL impulses AUC gain: ' num2str(mean(selectedAUC)) ' (SD: ' num2str(std(selectedAUC)) ')'];
peaksString = ['ALL impulses peak gain: ' num2str(mean(peaks)) ' (SD: ' num2str(std(peaks)) ')'];
potoString = ['All impulses PoTo X: ' num2str(mean(selectedPoToX(:,1))) ' smp. Y: ' num2str(mean(selectedPoToY)) ' º/s' ' (SD: ' num2str(std(selectedPoToX(:,1))) ' - ' num2str(std(selectedPoToY)) ')'];
set(handles.text14,'string',angleString);
set(handles.text15,'string',gainString);
set(handles.text17,'string',peaksString);
set(handles.text21,'string',potoString)

function [angle,slopeH,slopeE,x0,y0] = analizeTOF(headData,eyeData,startHead,startEye,lenghtData)
global potoN potoD
x0 = 0;
y0 = 0;
if lenghtData == 0
    eyeData = low(eyeData);
    add = 35;
    if startHead+add>61
        add = 35+(61-(startHead+add));
    end
    preHeadD = headData(startHead:(startHead+add),1);
    if startEye+add > 61
        add = 35+(61-(startEye+add));
    end
    preEyeD =  eyeData(startEye:(startEye+add),1);
    [~,posHeadMaxim] = max(preHeadD);
    [~, posEyeMaxim] = max(preEyeD);
    headD = headData(startHead:(startHead+posHeadMaxim),1);
    eyeD =  eyeData(startEye:(startEye+posEyeMaxim),1);
    xH = (1:length(headD));
    xE = (1:length(eyeD));
    slopeH = xH.'\headD;
    slopeE = xE.'\eyeD;
    angle = (atan(abs(slopeE-slopeH)/(1+slopeE*slopeH)))*(180/pi);
else
    eyeData = low(eyeData);
    headD = headData(startHead:(startHead+lenghtData),1);
    eyeD =  eyeData(startEye:(startEye+lenghtData),1);
    xH = (1:length(headD));
    xE = (1:length(eyeD));
    slopeH = xH.'\headD;
    slopeE = xE.'\eyeD;
    angle = (atan(abs(slopeE-slopeH)/(1+slopeE*slopeH)))*(180/pi);
end
if slopeE > slopeH
    angle = angle*-1;
end
%PoTo Implementation
output = multifitmatA([xE' eyeData(xE)],potoN,potoD);
x0 = round(output.x0);
y0 = output.y0;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global actual3 ErasedTOF
if actual3 > 1
    actual3 = actual3 - 1;
    set(handles.text3,'string',actual3);
    if ErasedTOF(actual3,1) == 0
        set(handles.checkbox1,'value',0)
    else
        set(handles.checkbox1,'value',1)
    end
    displayOne(handles)
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual3 tspcabeza ErasedTOF
[~,b] = size(tspcabeza);
if actual3 < b
    actual3 = actual3 + 1;
    set(handles.text3,'string',actual3);
    if ErasedTOF(actual3,1) == 0
        set(handles.checkbox1,'value',0)
    else
        set(handles.checkbox1,'value',1)
    end
    displayOne(handles)
end



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global ErasedTOF actual3
status = get(hObject,'Value');
if status == 1
    ErasedTOF(actual3) = 1;
else
    ErasedTOF(actual3) = 0;
end
displayOne(handles)
displayAll(handles)


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global windowSize
if get(hObject,'Value') == 1
    windowSize = 0;
    displayOne(handles)
    displayAll(handles)
else
    windowSize = 5;
    displayOne(handles)
    displayAll(handles)
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global modifiedPeaks actual3
if str2double(get(hObject,'String')) >= 0 && str2double(get(hObject,'String')) <= 61
modifiedPeaks(actual3) = str2double(get(hObject,'String'));
displayOne(handles)
displayAll(handles)
else
    set(hObject,'string','0')
    display('Not a number or > 60')
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global potoN
if str2double(get(hObject,'String')) >= 0 && str2double(get(hObject,'String')) <= 5.0000001
potoN = str2double(get(hObject,'String'));
displayOne(handles)
displayAll(handles)
else
    set(hObject,'string','3')
    display('Not a number or > 5')
end


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global potoD
if str2double(get(hObject,'String')) >= 0 && str2double(get(hObject,'String')) <= 5.000001
potoD = str2double(get(hObject,'String'));
displayOne(handles)
displayAll(handles)
else
    set(hObject,'string','0.005')
    display('Not a number or > 5')
end


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
