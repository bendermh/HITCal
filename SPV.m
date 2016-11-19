function varargout = SPV(varargin)
% SPV MATLAB code for SPV.fig
%      SPV, by itself, creates a new SPV or raises the existing
%      singleton*.
%
%      H = SPV returns the handle to a new SPV or the handle to
%      the existing singleton*.
%
%      SPV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPV.M with the given input arguments.
%
%      SPV('Property','Value',...) creates a new SPV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SPV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SPV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SPV

% Last Modified by GUIDE v2.5 11-May-2016 18:34:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SPV_OpeningFcn, ...
    'gui_OutputFcn',  @SPV_OutputFcn, ...
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


% --- Executes just before SPV is made visible.
function SPV_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SPV (see VARARGIN)

% Choose default command line output for SPV
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SPV wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SPV_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global vhgencabizq vhgenojoizq actual2 spojo spcabeza;
actual2 = 1;
spcabeza = vhgencabizq(20:80,:);
spojo = vhgenojoizq(20:80,:);
%SECUENCIA DE TRUNCADO DESCARTADA 
%OJO CON LA GANANCIA QUE NO ESTA INCLUIDA
%[tam,imp] = size(spcabeza);
%pico = max(spcabeza);
%posicion = 1;
%while posicion <= imp
%    pos = find(spcabeza(:,posicion) == pico(posicion));
%    while pos <= tam
%        if spcabeza(pos,posicion) > 0
%        else
%            spcabeza(pos,posicion) = NaN;
%            spojo(pos,posicion) = NaN;
%        end
%        pos = pos + 1;
%    end
%    posicion = posicion + 1;
%end
dibuja(hObject, eventdata, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual2;

if actual2 > 1
    actual2 = actual2 -1;
    dibuja(hObject, eventdata, handles);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual2 spcabeza;
[n,tam] = size(spcabeza);
if actual2 < tam
    actual2 = actual2 + 1;
    dibuja(hObject, eventdata, handles);
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datosgan ganac spojo spcabeza actual2 datospac paciente
datosojos = horzcat(datosojos,spojo(:,actual2));
datoscabeza = horzcat(datoscabeza,spcabeza(:,actual2));
if isempty(paciente)
    pacientef = 'No Name! ';
else
    pacientef = paciente;
end
datospac = horzcat(datospac,cellstr(pacientef));
datosgan = horzcat(datosgan,0.0001*(ganac(actual2)));


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datosgan ganac spojo spcabeza datospac paciente
datosojos = horzcat(datosojos,spojo);
datoscabeza = horzcat(datoscabeza,spcabeza);
[nul,n] = size(spcabeza);
while n > 1
    if isempty(paciente)
        pacientef = 'No Name! ';
    else
        pacientef = paciente;
    end
    datospac = horzcat(datospac,cellstr(pacientef));
    n = n - 1;
end
datospac = horzcat(datospac,cellstr(pacientef));
datosgan = horzcat(datosgan,(0.0001*(transpose(ganac))));

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datospac datosgan CC CO
HC = transpose(CC);
HE = transpose(CO);
[archivo,directorio] = uiputfile('*.mat','Save data to file','neural.mat');
if archivo == 0
    return
end
save([directorio archivo],'datosojos','datoscabeza','datospac','datosgan','HC','HE');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datosgan ganac spojo spcabeza datospac paciente
preojo = spojo;
precabeza = spcabeza;
[nul,n] = size(spcabeza);
pos = 1;
while pos <= n
    if max(precabeza(:,pos)) > 150
        datosojos = horzcat(datosojos,preojo(:,pos));
        datoscabeza = horzcat(datoscabeza,precabeza(:,pos));
        if isempty(paciente)
            pacientef = 'No Name! ';
        else
            pacientef = paciente;
        end
        datospac = horzcat(datospac,cellstr(pacientef));
        datosgan = horzcat(datosgan,(0.0001*(transpose(ganac(pos)))));
    end
    pos = pos + 1;
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datosgan datospac CC CO
salida = questdlg('BE CAREFUL: do you want to DELETE ALL STORED DATA', 'WARNING','Yes','NO','NO');
if strcmp(salida,'Yes')
    datosojos = [];
    datoscabeza = [];
    datospac = [];
    datosgan = [];
    CC = [];
    CO = [];
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datospac
if isempty(datosojos)
    msgbox('You need to store the impulses to analyze', 'ERROR','error');
    return
else
    try
        SPVR
    catch
        msgbox('A problem was found using Cluster Analysis Tool', 'ERROR','error');
    end
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global datosojos datoscabeza datosgan datospac CC CO
[archivo,directorio] = uigetfile('*.mat','Load data file');
if archivo == 0
    return
end
load([directorio archivo],'datosojos','datoscabeza','datospac','datosgan');


function dibuja(hObject, eventdata, handles)
global actual2 spojo spcabeza
%Gráficos
axes (handles.velocidad);
hold all
cla
plot(spcabeza(:,actual2),'color','blue','LineWidth',2);
plot(spojo(:,actual2),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
xlim ([0 61])
xlabel('Time in samples')
ylabel('Velocity in degrees/s')

axes (handles.aceleracion);
hold all
cla
y = 250*(spcabeza(:,actual2));
y2 = 250*(spojo(:,actual2));
plot(low(low([0;diff(y)])),'color','blue','LineWidth',2);
plot(low(low([0;diff(y2)])),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
xlim ([0 61])
xlabel('Time in samples')
ylabel('Acceleration in degrees/s2')
acl = (low(low([0;diff(y)])));
acpos = find (acl > (max(acl)/2));
acval = acl(acpos(1));
jerl = line([acpos(1),acpos(1)],[acval-2000,acval+2000],'color',[.8 .8 .8],'LineWidth',4,'LineStyle','-');
text = ['Jerk Constant: ' num2str(round(acpos(1))) ' samples'];
legend (jerl,text);
axes (handles.posicion);
hold all
cla
py = spcabeza(:,actual2);
py2 = spojo(:,actual2);
x = transpose(0.004*(1:61));
plot(cumtrapz(x,py),'color','blue','LineWidth',2);
plot(cumtrapz(x,py2),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
xlim ([0 61])
xlabel('Time in samples')
ylabel('Realtive position in degrees')

[n,tam] = size(spcabeza);
posg = [num2str(actual2) '/' num2str(tam)];
set(handles.text5,'string',posg);

%CALCULOS
vc =spcabeza(:,actual2);
vo =spojo(:,actual2);
pc = cumtrapz(x,py);
po = cumtrapz(x,py2);
e = 0;

[ay,ax] = findpeaks (vc,'Npeaks',1,'MinPeakDistance',10,'MinPeakHeight',50);
headmax = ay;
axes (handles.velocidad);
hold all
scatter (ax,ay,150,'*k');
text = ['Head impulse peak (v): ' num2str(round(ay(1))) ' º/s'];
set (handles.text7,'string',text);
if headmax > 150;
    [bay,bax] = findpeaks (vo,'Npeaks',10,'MinPeakDistance',5,'MinPeakHeight',20,'SortStr','descend');
    [n,nul] = size (bay);
    if bay(1) > headmax +20 && n > 1
        ay = bay(2);
        ax = bax(2);
    else
        ay = bay(1);
        ax = bax(1);
    end
    axes (handles.velocidad);
    hold all
    scatter (ax,ay,150,'*k');
    text = ['Eye response peak (v): ' num2str(round(ay(1))) ' º/s'];
    set (handles.text8,'string',text);
    
    [ay,ax] = findpeaks (low(low(low([0;diff(y)]))),'Npeaks',1,'MinPeakDistance',10,'MinPeakHeight',1500);
    headmax = ay;
    axes (handles.aceleracion);
    hold all
    scatter (ax,ay,150,'*k');
    text = ['Head impulse peak (a): ' num2str(round(ay(1))) ' º/s2'];
    set (handles.text9,'string',text);
    
    [bay,bax] = findpeaks (low(low(low([0;diff(y2)]))),'Npeaks',10,'MinPeakDistance',5,'MinPeakHeight',500,'SortStr','descend');
    [n,nul] = size (bay);
    if bay(1) > headmax + 3000 && n > 1
        ay = bay(2);
        ax = bax(2);
    else
        ay = bay(1);
        ax = bax(1);
    end
    axes (handles.aceleracion);
    hold all
    scatter (ax,ay,150,'*k');
    text = ['Eye response peak (a): ' num2str(round(ay(1))) ' º/s2'];
    set (handles.text10,'string',text);
    %Posicion
    ax = find(pc == max(pc));
    ay = max(pc);
    axes (handles.posicion);
    hold all
    scatter (ax,ay,150,'*k');
    text = ['Head impulse peak (p): ' num2str(ay(1)) ' º'];
    set (handles.text11,'string',text);
    res1 = ax;
    ax = find(po == max(po));
    ay = max(po);
    axes (handles.posicion);
    hold all
    scatter (ax,ay,150,'*k');
    text = ['Eye response peak (p): ' num2str(ay(1)) ' º'];
    set (handles.text12,'string',text);
    res2 = ax;
    text = ['Eye response delay (p): ' num2str(res2-res1) ' samp.'];
    set (handles.text13,'string',text);
    if e == 1
        set (handles.text13,'string','ERROR: Max eye not found');
    end
else
    set (handles.text8,'string','--');
    set (handles.text9,'string','--');
    set (handles.text10,'string','--');
    set (handles.text11,'string','--');
    set (handles.text12,'string','--');
    set (handles.text13,'string','--');
end
%FIN CARGA
