function varargout = AUC(varargin)
% AUC MATLAB code for AUC.fig
%      AUC, by itself, creates a new AUC or raises the existing
%      singleton*.
%
%      H = AUC returns the handle to a new AUC or the handle to
%      the existing singleton*.
%
%      AUC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUC.M with the given input arguments.
%
%      AUC('Property','Value',...) creates a new AUC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AUC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AUC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AUC

% Last Modified by GUIDE v2.5 11-Jun-2014 18:06:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AUC_OpeningFcn, ...
                   'gui_OutputFcn',  @AUC_OutputFcn, ...
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


% --- Executes just before AUC is made visible.
function AUC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AUC (see VARARGIN)

% Choose default command line output for AUC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AUC wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global vhgencabizq vhgenojoizq actual array ojon cabezan
array = [];
set (handles.text11,'string',0)

cabeza = low(vhgencabizq(:,actual));
ojo = low(vhgenojoizq(:,actual));
ojon = ojo;
cabezan = cabeza;

axes (handles.cabeza);
datacursormode on
hold on
plot(cabeza,'color','blue','LineWidth',2);
ylim ([-50 350])
xlim ([0 175])
line([0,0],[-50,350],'color', 'red','LineWidth',2);
line ([175,175],[-50,350],'color', 'blue','LineWidth',2);
set(handles.cabeza, 'color',[0.94 0.94 0.94]);
xlabel('Time in samples')
ylabel('Velocity in degrees/s')


axes (handles.ojo);
datacursormode on
hold on
plot(ojo,'color',[1 0.5 0],'LineWidth',2);
ylim ([-50 350])
xlim ([0 175])
line([0,0],[-50,350],'color', 'red','LineWidth',2);
line ([175,175],[-50,350],'color', 'blue','LineWidth',2);
set(handles.ojo, 'color',[0.94 0.94 0.94]);
xlabel('Time in samples')
ylabel('Velocity in degrees/s')
    
y = cabeza;
x = transpose(0.004*(1:175));
set (handles.text5,'string',[num2str((trapz(x,y)),'%.1f') 'º '])
    
y = ojo;
x = transpose(0.004*(1:175));
set (handles.text9,'string',[num2str((trapz(x,y)),'%.1f') 'º '])

axes (handles.eyep);
datacursormode on
hold on
y = ojo(1:175);
x = transpose(0.004*(1:175));
plot(cumtrapz(x,y),'color',[1 0.5 0],'LineWidth',2);
ylim ([-5 20])
xlim ([0 175])
xlabel('Time in samples')
ylabel('Relative position in degrees')
set(handles.eyep, 'color',[0.94 0.94 0.94]);

axes (handles.headp);
datacursormode on
hold on
y = cabeza(1:175);
x = transpose(0.004*(1:175));
plot(cumtrapz(x,y),'color','blue','LineWidth',2);
ylim ([-5 20])
xlim ([0 175])
xlabel('Time in samples')
ylabel('Relative position in degrees')
set(handles.headp, 'color',[0.94 0.94 0.94]);

axes (handles.heada);
datacursormode on
hold on
y = 250*(cabeza(1:175));
plot(low(low(low([0;diff(y)]))),'color','blue','LineWidth',2);
xlim ([0 175])
set(handles.heada, 'color',[0.94 0.94 0.94])
xlabel('Time in samples')
ylabel('Acceleration in degrees/s2')

axes (handles.eyea);
datacursormode on
hold on
y = 250*(ojo(1:175));
plot(low(low(low([0;diff(y)]))),'color',[1 0.5 0],'LineWidth',2);
xlim ([0 175])
xlabel('Time in samples')
ylabel('Acceleration in degrees/s2')
set(handles.eyea, 'color',[0.94 0.94 0.94])




% --- Outputs from this function are returned to the command line.
function varargout = AUC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global cabezan

%cabeza = low(vhgencabizq(:,actual));
%ojo = low(vhgenojoizq(:,actual));

MCA = get(handles.slider1, 'value');
MCB = get(handles.slider3, 'value');
axes (handles.cabeza);
cla
plot(cabezan,'color','blue','LineWidth',2);
ylim ([-50 350])
xlim ([0 175])
line([round(MCA),round(MCA)],[-50,350],'color', 'red','LineWidth',2);
line([round(MCB),round(MCB)],[-50,350],'color', 'blue','LineWidth',2);
set(handles.cabeza, 'color',[0.94 0.94 0.94]);
xlabel('Time in samples')
ylabel('Velocity in degrees/s')
set (handles.text1,'string', ['Mark A Position: ' num2str(round(MCA))])
if MCA< MCB
    x = transpose(0.004*(round(MCA):round(MCB)));
    y = cabezan(round(MCA):round(MCB));
    set (handles.text5,'string',[num2str(trapz(x,y),'%.1f') 'º '])
end



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global cabezan

%cabeza = low(vhgencabizq(:,actual));
%ojo = low(vhgenojoizq(:,actual));

MCA = get(handles.slider1, 'value');
MCB = get(handles.slider3, 'value');
axes (handles.cabeza);
cla
plot(cabezan,'color','blue','LineWidth',2);
ylim ([-50 350])
xlim ([0 175])
line([round(MCA),round(MCA)],[-50,350],'color', 'red','LineWidth',2);
line ([round(MCB),round(MCB)],[-50,350],'color', 'blue','LineWidth',2);
set(handles.cabeza, 'color',[0.94 0.94 0.94]);
xlabel('Time in samples')
ylabel('Velocity in degrees/s')
set (handles.text2,'string', ['Mark B Position: ' num2str(round(MCB))])
if MCA< MCB
    x = transpose(0.004*(round(MCA):round(MCB)));
    y = cabezan(round(MCA):round(MCB));
    set (handles.text5,'string',[num2str(trapz(x,y),'%.1f') 'º '])
end

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global ojon

%cabeza = low(vhgencabizq(:,actual));
%ojo = low(vhgenojoizq(:,actual));

MOA = get(handles.slider4, 'value');
MOB = get(handles.slider5, 'value');
axes (handles.ojo);
cla
plot(ojon,'color',[1 0.5 0],'LineWidth',2);
ylim ([-50 350])
xlim ([0 175])
line([round(MOA),round(MOA)],[-50,350],'color', 'red','LineWidth',2);
line ([round(MOB),round(MOB)],[-50,350],'color', 'blue','LineWidth',2);
set(handles.ojo, 'color',[0.94 0.94 0.94]);
xlabel('Time in samples')
ylabel('Velocity in degrees/s')
set (handles.text7,'string', ['Mark A Position: ' num2str(round(MOA))])
if MOA< MOB
    x = transpose(0.004*(round(MOA):round(MOB)));
    y = ojon(round(MOA):round(MOB));
    set (handles.text9,'string',[num2str(trapz(x,y),'%.1f') 'º '])
end


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global ojon

%cabeza = low(vhgencabizq(:,actual));
%ojo = low(vhgenojoizq(:,actual));

MOA = get(handles.slider4, 'value');
MOB = get(handles.slider5, 'value');
axes (handles.ojo);
cla
plot(ojon,'color',[1 0.5 0],'LineWidth',2);
ylim ([-50 350])
xlim ([0 175])
line([round(MOA),round(MOA)],[-50,350],'color', 'red','LineWidth',2);
line ([round(MOB),round(MOB)],[-50,350],'color', 'blue','LineWidth',2);
set(handles.ojo, 'color',[0.94 0.94 0.94]);
xlabel('Time in samples')
ylabel('Velocity in degrees/s')
set (handles.text8,'string', ['Mark B Position: ' num2str(round(MOB))])
if MOA< MOB
    x = transpose(0.004*(round(MOA):round(MOB)));
    y = ojon(round(MOA):round(MOB));
    set (handles.text9,'string',[num2str(trapz(x,y),'%.1f') 'º '])
end


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ojon array

%ojo = low(vhgenojoizq(:,actual));
MOA = get(handles.slider4, 'value');
MOB = get(handles.slider5, 'value');
y = trapz(0.004*(round(MOA):round(MOB)),round(ojon(round(MOA):round(MOB))));


if isempty(array) 
    array = y; 
else
    array = horzcat(array,y);
end
set (handles.text11,'string',num2str((array),'%.1f  '))
set (handles.text12,'string',['Sum = ',num2str((sum(array)),'%.1f')])



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global array

[a,b] = size(array);
if b > 1
    array(b) = [];
    set (handles.text11,'string',num2str((array),'%.1f  '))
    set (handles.text12,'string',['Sum = ',num2str((sum(array)),'%.1f')])
else
    array = [];
     set (handles.text11,'string','0')
    set (handles.text12,'string','Sum = 0')
end
