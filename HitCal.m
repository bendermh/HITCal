function varargout = HitCal(varargin)
%      HITCAL by Jorge Rey © 2014 under license: 
%      Creative Commons (by-nc)
%      NOT FOR CLINICAL USE
%
%
%      La versión 2.1 de HitCal pasa a denominarse NeuralHIT
%      -JORGE REY 2014-
%      La versión 2.2 de HITCal vuelve a llamarse HITCal
%      HitCal MATLAB code for HitCal.fig
%      HitCal, by itself, creates a new HitCal or raises the existing
%      singleton*.
%
%      H = HitCal returns the handle to a new HitCal or the handle to
%      the existing singleton*.
%
%      HitCal('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HitCal.M with the given input arguments.
%
%      HitCal('Property','Value',...) creates a new HitCal or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HitCal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HitCal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HitCal

% Last Modified by GUIDE v2.5 06-Jun-2017 13:04:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @HitCal_OpeningFcn, ...
    'gui_OutputFcn',  @HitCal_OutputFcn, ...
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


% --- Executes just before HitCal is made visible.
function HitCal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HitCal (see VARARGIN)

% Choose default command line output for HitCal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HitCal wait for user response (see UIRESUME)
% uiwait(handles.principal);
global guarda ord desord custom icono exported
icono = [];
exported = [];
custom = 0;
guarda = 1;
ord = 0;
desord = 0;
%set(handles.inicio,'position',[0    0  290   66])
set(handles.inicio,'position',[0    0  195.3   49])
set(handles.inicio,'string','Wellcome to HITCal: Import XML file to start.');
set(handles.inicio,'visible','on');

try load('logo.mat');
catch
    warndlg('Preferences load error', 'ERROR');
    return
end

% --- Outputs from this function are returned to the command line.
function varargout = HitCal_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global custom
if custom == 1;
    warndlg('A custom neural network has been loaded', 'NOTICE')
end

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global icono
try
    about
catch
    msgbox('HIT Analysis software. Jorge Rey Martínez. Copyright (C)2016.','HitCal','custom',icono);
    
end

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual vhgenojoizq vhgencabizq maxojo listae ganac maxcabeza VHITd VHIT VHIT2 VHIT3 VHIT4 VHIT5 VHIT6 VHIT7 VHIT8 VHIT9 VHIT10 VHIT11 VHIT12 tipo tipo2 tipo3 tipo4 tipo5 tipo6 tipo7 tipo8 tipo9 tipo10 tipo11 tipo12 paciente rnp icono
[file,directorio] = uigetfile('*.xml','Open XML file');
if file == 0
    return
end

try
    cd (directorio);
catch
    msgbox('Filesystem error, change directory or file names (do not use not english characters, like the spanish: ñ or á,é,í,ó,ú...)', 'ERROR','error');
    return
end
try
    x = xmlread(file);
catch
    msgbox('Error on open file process', 'ERROR','error');
    return
end
%nodo prueba  = 49
%nodo impulso = 77
set(handles.inicio,'string','File processing...');
y = 77;
prueba1 = leer (x,49,y);
prueba2 = leer (x,51,y);
prueba3 = leer (x,53,y);
prueba4 = leer (x,55,y);
prueba5 = leer (x,57,y);
prueba6 = leer (x,59,y);
prueba7 = leer (x,61,y);
prueba8 = leer (x,63,y);
prueba9 = leer (x,65,y);
prueba10 = leer (x,67,y);
prueba11 = leer (x,69,y);
prueba12 = leer (x,71,y);
VHIT = [];
VHIT2 = [];
VHIT3 = [];
VHIT4 = [];
VHIT5 = [];
VHIT6 = [];
VHIT7 = [];
VHIT8 = [];
VHIT9 = [];
VHIT10 = [];
VHIT11 = [];
VHIT12 = [];

if prueba1 == 0;
    set(handles.inicio,'string','Wellcome to HITCal: Import XML file to start.');
    msgbox('Not compatible file', 'ERROR','error');
    return
end
if prueba1 == 2;
    set(handles.inicio,'string','Wellcome to HITCal: Import XML file to start.');
    msgbox('This file contains not vHIT module, oculomotor or postional modules are not supported.', 'ERROR','error');
    return
end
if prueba1 == 3;
    set(handles.inicio,'string','Wellcome to HITCal: Import XML file to start.');
    msgbox('Language not supported', 'ERROR','error');
    return
end

if prueba1 == 1;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
    if borrado == 0;
        VHIT(:,2) = cabeza;
        VHIT(:,3) = ojo;
        VHIT(1,1) = lado;
        VHIT(2,1) = ganancia;
        VHIT(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,49,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
            if borrado == 0;
                try [a,b] = size(VHIT);
                catch
                    b = 0;
                end
                VHIT(:,(b+2)) = cabeza;
                VHIT(:,(b+3)) = ojo;
                VHIT(1,(b+1)) = lado;
                VHIT(2,(b+1)) = ganancia;
                VHIT(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba2 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
    if borrado == 0;
        VHIT2(:,2) = cabeza;
        VHIT2(:,3) = ojo;
        VHIT2(1,1) = lado;
        VHIT2(2,1) = ganancia;
        VHIT2(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,51,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
            if borrado == 0;
                try [a,b] = size(VHIT2);
                catch
                    b = 0;
                end
                VHIT2(:,(b+2)) = cabeza;
                VHIT2(:,(b+3)) = ojo;
                VHIT2(1,(b+1)) = lado;
                VHIT2(2,(b+1)) = ganancia;
                VHIT2(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba3 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo3] = leer (x,53,y);
    if borrado == 0;
        VHIT3(:,2) = cabeza;
        VHIT3(:,3) = ojo;
        VHIT3(1,1) = lado;
        VHIT3(2,1) = ganancia;
        VHIT3(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,53,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo3] = leer (x,53,y);
            if borrado == 0;
                try [a,b] = size(VHIT3);
                catch
                    b = 0;
                end
                VHIT3(:,(b+2)) = cabeza;
                VHIT3(:,(b+3)) = ojo;
                VHIT3(1,(b+1)) = lado;
                VHIT3(2,(b+1)) = ganancia;
                VHIT3(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba4 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
    if borrado == 0;
        VHIT4(:,2) = cabeza;
        VHIT4(:,3) = ojo;
        VHIT4(1,1) = lado;
        VHIT4(2,1) = ganancia;
        VHIT4(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,55,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
            if borrado == 0;
                try [a,b] = size(VHIT4);
                catch
                    b = 0;
                end
                VHIT4(:,(b+2)) = cabeza;
                VHIT4(:,(b+3)) = ojo;
                VHIT4(1,(b+1)) = lado;
                VHIT4(2,(b+1)) = ganancia;
                VHIT4(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba5 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
    if borrado == 0;
        VHIT5(:,2) = cabeza;
        VHIT5(:,3) = ojo;
        VHIT5(1,1) = lado;
        VHIT5(2,1) = ganancia;
        VHIT5(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,57,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
            if borrado == 0;
                try [a,b] = size(VHIT5);
                catch
                    b = 0;
                end
                VHIT5(:,(b+2)) = cabeza;
                VHIT5(:,(b+3)) = ojo;
                VHIT5(1,(b+1)) = lado;
                VHIT5(2,(b+1)) = ganancia;
                VHIT5(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba6 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
    if borrado == 0;
        VHIT6(:,2) = cabeza;
        VHIT6(:,3) = ojo;
        VHIT6(1,1) = lado;
        VHIT6(2,1) = ganancia;
        VHIT6(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,59,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
            if borrado == 0;
                try [a,b] = size(VHIT6);
                catch
                    b = 0;
                end
                VHIT6(:,(b+2)) = cabeza;
                VHIT6(:,(b+3)) = ojo;
                VHIT6(1,(b+1)) = lado;
                VHIT6(2,(b+1)) = ganancia;
                VHIT6(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba7 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
    if borrado == 0;
        VHIT7(:,2) = cabeza;
        VHIT7(:,3) = ojo;
        VHIT7(1,1) = lado;
        VHIT7(2,1) = ganancia;
        VHIT7(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,61,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
            if borrado == 0;
                try [a,b] = size(VHIT7);
                catch
                    b = 0;
                end
                VHIT7(:,(b+2)) = cabeza;
                VHIT7(:,(b+3)) = ojo;
                VHIT7(1,(b+1)) = lado;
                VHIT7(2,(b+1)) = ganancia;
                VHIT7(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba8 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
    if borrado == 0;
        VHIT8(:,2) = cabeza;
        VHIT8(:,3) = ojo;
        VHIT8(1,1) = lado;
        VHIT8(2,1) = ganancia;
        VHIT8(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,63,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
            if borrado == 0;
                try [a,b] = size(VHIT8);
                catch
                    b = 0;
                end
                VHIT8(:,(b+2)) = cabeza;
                VHIT8(:,(b+3)) = ojo;
                VHIT8(1,(b+1)) = lado;
                VHIT8(2,(b+1)) = ganancia;
                VHIT8(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba9 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo9] = leer (x,65,y);
    if borrado == 0;
        VHIT9(:,2) = cabeza;
        VHIT9(:,3) = ojo;
        VHIT9(1,1) = lado;
        VHIT9(2,1) = ganancia;
        VHIT9(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,65,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo9] = leer (x,65,y);
            if borrado == 0;
                try [a,b] = size(VHIT9);
                catch
                    b = 0;
                end
                VHIT9(:,(b+2)) = cabeza;
                VHIT9(:,(b+3)) = ojo;
                VHIT9(1,(b+1)) = lado;
                VHIT9(2,(b+1)) = ganancia;
                VHIT9(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba10 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
    if borrado == 0;
        VHIT10(:,2) = cabeza;
        VHIT10(:,3) = ojo;
        VHIT10(1,1) = lado;
        VHIT10(2,1) = ganancia;
        VHIT10(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,67,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
            if borrado == 0;
                try [a,b] = size(VHIT10);
                catch
                    b = 0;
                end
                VHIT10(:,(b+2)) = cabeza;
                VHIT10(:,(b+3)) = ojo;
                VHIT10(1,(b+1)) = lado;
                VHIT10(2,(b+1)) = ganancia;
                VHIT10(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba11 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
    if borrado == 0;
        VHIT11(:,2) = cabeza;
        VHIT11(:,3) = ojo;
        VHIT11(1,1) = lado;
        VHIT11(2,1) = ganancia;
        VHIT11(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,69,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
            if borrado == 0;
                try [a,b] = size(VHIT11);
                catch
                    b = 0;
                end
                VHIT11(:,(b+2)) = cabeza;
                VHIT11(:,(b+3)) = ojo;
                VHIT11(1,(b+1)) = lado;
                VHIT11(2,(b+1)) = ganancia;
                VHIT11(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba12 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
    if borrado == 0;
        VHIT12(:,2) = cabeza;
        VHIT12(:,3) = ojo;
        VHIT12(1,1) = lado;
        VHIT12(2,1) = ganancia;
        VHIT12(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,71,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
            if borrado == 0;
                try [a,b] = size(VHIT12);
                catch
                    b = 0;
                end
                VHIT12(:,(b+2)) = cabeza;
                VHIT12(:,(b+3)) = ojo;
                VHIT12(1,(b+1)) = lado;
                VHIT12(2,(b+1)) = ganancia;
                VHIT12(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

%SECUENCIA DE INICIO ORIGINAL (PRUEBA 1 LADO 1 IMPULSO 1)
VHITd = VHIT;
actual = 1;
paciente = ['Name: ' nombre ' ' apellido];
set(handles.text3,'string',paciente);
tipoprueba = ['Test plane: ' tipo];
set(handles.text19,'string',tipoprueba);
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',1);
vhgencabizq = [];
vhgenojoizq = [];
maxojo = [];
listae = [];
ganac = [];
maxcabeza = [];
n=1;
n2=1;
n3=1;
[a,c]=size(VHITd);
while n < c
    if VHITd(1,n) == 1
        vhgencabizq (:,n2) = VHITd(:,n+1);
        vhgenojoizq (:,n2) = VHITd(:,n+2);
        ganac (n2,1) = VHITd(2,n3);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end

n = 1;
while n <= size(vhgencabizq);
    [h,i] = max(vhgencabizq(:,n));
    maxcabeza(n,[1 2]) = [h i];
    n=n+1;
end


n = 1;

%busqueda de los tres maximos en ojos a intervalos fijos
%SERIA BUENO añadir condicion, si lo vas a marcar comprueba que la
%velocidad del maximo es sensiblemente (40?) superior a la del reflejo
%(dato de la ganancia?)
while n <= size(vhgenojoizq);
    
    [h,i] = max(vhgenojoizq(45:95,n));
    
    gancor = ganac(n);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        pgan = gancor*0.0001;
    else
        pgan = gancor*0.0001;
    end
    
    if h > 100
        pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
        pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
        % pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
        %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
        %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
        %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
        
        if pend1<0&&pend2<0
            if pgan < 0.6
                maxojo(n,[1 2]) = [h i];
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 220
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
            %NUEVO
            if h > 15 + max(vhgenojoizq(20:38+i,n));
                maxojo(n,[1 2]) = [h i];
            end
        end
    else
        maxojo(n,[1 2]) = [0 0];
    end
    
    %NUEVO
    if maxojo(n,1) == 0;
        [hr,ir] = max(vhgenojoizq(65:95,n));
        if hr > 125
            maxojo(n,[1 2]) = [hr (ir+20)];
        end
    end
    
    [h,i] = max(vhgenojoizq(96:135,n));
    if h > 50
        maxojo(n,[3 4]) = [h i];
    else
        maxojo(n,[3 4]) = [0 0];
    end
    [h,i] = max(vhgenojoizq(136:175,n));
    if h > 50
        maxojo(n,[5 6]) = [h i];
    else
        maxojo(n,[5 6]) = [0 0];
    end
    n=n+1;
end

%Dibujo impulso original
gana = num2str(mean(ganac)/10000,4);
gantex = ['Gain: ' gana ' '];
set(handles.text7,'string',gantex);

% DIBUJO Y DATOS UN IMPULSO

%OJO siguiente linea no siempre ?
set(handles.checkbox21,'Value',0);

gancor = ganac(actual);
[desp tam] =size(num2str(gancor));
if tam == 5;
    gancor = gancor*0.0001;
else
    gancor = gancor*0.0001;
end

gancor2 = ['Gain: ' num2str(gancor) ' '];
set(handles.text31,'string',gancor2);

axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);

%ylim ([-75 350])

set (handles.text30,'string',maxcabeza(actual,2));
set (handles.text29,'string',round(maxcabeza(actual,1)));

if maxojo(actual,1) > 0
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',(maxojo(actual,2))+44);
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
else
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',maxojo(actual,2));
    
end

if maxojo(actual,3) > 0
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',(maxojo(actual,4))+95);
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
else
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',maxojo(actual,4));
end
if maxojo(actual,5) > 0
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',(maxojo(actual,6))+135);
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
else
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',maxojo(actual,6));
end
%no copiar en otras funciones
inutila=size(ganac);
inutil = inutila(1);
listae= zeros(inutil,1);
[tam,nulo] = size(listae);
posg = [num2str(actual) '/' num2str(tam)];
set(handles.text10,'string',posg);

%Dibujar y cálculos de grupo de impulso

n=1;
n2=1;
n3=1;
[a,c]=size(vhgencabizq);
while n < c
    if listae(n) == 1
        vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
        vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end
axes (handles.grupo);
cla;
hold all
plot(vhgenojoizq,'color',[1 0.5 0]);
plot(vhgencabizq,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojo(:,2);
v1=maxojo(:,1);
t2=maxojo(:,4);
v2=maxojo(:,3);
t3=maxojo(:,6);
v3=maxojo(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);

%RED NEURAL 10 ELMENTOS
%(finalmente remplazada por algoritmo PR)
% INICIALIZA
a = [];
b = [];
c = [];
tam = [];
lmaxvalojor = [];
lmaxposojor = [];
lmaxvalojo = [];
lmaxposojo = [];
sens = 12;
sens2 = 35;
vhgenojoizqf = [];
vhgencabizqf = [];

% FILTRO DE BAJAS FRECUENCIAS
vhgenojoizqf = low(vhgenojoizq);
vhgencabizqf = low(vhgencabizq);
[a,c]=size(vhgenojoizqf);


% BUSQUEDA DE MAXIMOS RELATIVOS
for  a = 1 : 1 : c
    
    %[lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizq(:,a),'minpeakdistance',8,'minpeakheight',60);
    %[lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizq(:,1),'minpeakheight',40);
    [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
    [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
    [b,c] = size(lmaxvalojor);
    
    if b > 0
        if lmaxposojor(1) < (lmaxposcab(1)+10)
            
            lmaxposojor(1) = [];
            lmaxvalojor(1) = [];
            b = b-1;
        end
        lmaxvalojo(1:b,a) = lmaxvalojor;
        lmaxposojo(1:b,a) = lmaxposojor;
    end
end
% Elimina Outlayers
[a,b] = size (lmaxposojo);
out = [];
if a > 0
    for p = 1:1:b
        
        if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
            % if lmaxvalojo(1,p) < 220 ¿Identificamos sacadas covert, no tengo claro?
            out = horzcat(out,p);
            
        end
    end
    [r,s] = size(out);
    
    if s >0 && s<=2
        %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
        if s == 1
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(1))=[];
            lmaxvalojo(:,out(1))=[];
        else
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(2));
            lmaxposojo(:,out(1))=[];
            try lmaxposojo(:,out(2))=[];
            end
            lmaxvalojo(:,out(1))=[];
            try lmaxvalojo(:,out(2))=[];
            end
        end
    end
end
[tam,impuls] = size(lmaxposojo);

% Gráfico de maximos
axes (handles.todos);
cla;
hold all
plot(vhgenojoizqf,'color',[1 0.5 0]);
if get(handles.popupmenu2,'Value') == 1
    plot(vhgencabizqf,'color','blue');
else
    plot(vhgencabizqf,'color','red');
end
xlim ([0 175]);
ylim ([-75 350]);
axis off;

axes (handles.s1)
plot(1,1,'kx')
axis off
axes (handles.s2)
plot(1,1,'k*')
axis off
axes (handles.s3)
plot(1,1,'k+')
axis off
axes (handles.s4)
plot(1,1,'ko')
axis off
axes (handles.todos)

for p=1:1:impuls
    if tam > 0
        x = lmaxposojo(1,:);
        y = lmaxvalojo(1,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'kx')
        
    end
    if tam > 1
        x = lmaxposojo(2,:);
        y = lmaxvalojo(2,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k*')
    end
    if tam > 2
        x = lmaxposojo(3,:);
        y = lmaxvalojo(3,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k+')
        
    end
    if tam > 3
        x = lmaxposojo(4,:);
        y = lmaxvalojo(4,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'ko')
        
    end
    
end
% Cálculos

pr1 = 0;
pr2 = 0;
pr3 = 0;
pr4 = 0;

if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    pr1 = (std(x)/mean(x))*100;
end
if tam > 1
    x = lmaxposojo(2,:)*100;
    x(x==0) = [];
    pr2 = (std(x)/mean(x))*100;
end
if tam > 2
    x = lmaxposojo(3,:);
    x(x==0) = [];
    pr3 = (std(x)/mean(x))*100;
end
if tam > 3
    x = lmaxposojo(4,:);
    x(x==0) = [];
    pr4 = (std(x)/mean(x))*100;
end
if isnan(pr1)
    pr1 = 0;
end
if isnan(pr2)
    pr2 = 0;
end
if isnan(pr3)
    pr3 = 0;
end
if isnan(pr4)
    pr4 = 0;
end

set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);

if pr1 <= sens
    if pr2 >= sens2
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    else
        set(handles.text51,'string','GATHERED');
        set(handles.text51,'ForegroundColor',[0 0.9 0]);
    end
end
if pr1 > sens
    set(handles.text51,'string','SCATTERED');
    set(handles.text51,'ForegroundColor',[0.9 0 0]);
end

if isempty (lmaxposojo)
    set(handles.text51,'string','NORMAL');
    set(handles.text51,'ForegroundColor',[0 0 0]);
else
    xu = lmaxposojo(1,:);
    xu(xu==0) = [];
    if size (xu) <4
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    end
end
impuls;
if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    [tam2,impuls2] = size(x);
    ind = 1-(impuls2 / impuls);
else
    ind = 0;
end

prg = 2.5*(0.8*pr1+0.2*pr2);

if prg > 35
    prg = prg -(30*ind);
end
if prg > 100
    prg = 100;
end
set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])

%FIN RED
set(handles.inicio,'string','Wellcome to HitCal: Import XML file to start.');
set(handles.inicio,'visible','off')
set (handles.Untitled_5,'enable','on')








% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
salida = questdlg('Exit HITCal ?', 'EXIT','YES','No','YES');
if strcmp(salida,'YES')
    close
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global actual VHITd VHIT VHIT2 VHIT3 VHIT4 VHIT5 VHIT6 VHIT7 VHIT8 VHIT9 VHIT10 VHIT11 VHIT12 tipo tipo2 tipo3 tipo4 tipo5 tipo6 tipo7 tipo8 tipo9 tipo10 tipo11 tipo12 vhgencabizq vhgenojoizq maxojo listae ganac maxcabeza rnp icono
opcion = get(hObject,'Value');
[f2 g2] = size(VHIT2);
[f3 g3] = size(VHIT3);
[f4 g4] = size(VHIT4);
[f5 g5] = size(VHIT5);
[f6 g6] = size(VHIT6);
[f7 g7] = size(VHIT7);
[f8 g8] = size(VHIT8);
[f9 g9] = size(VHIT9);
[f10 g10] = size(VHIT10);
[f11 g11] = size(VHIT11);
[f12 g12] = size(VHIT12);



if opcion == 1
    VHITd = VHIT;
    tipoprueba = ['Test plane: ' tipo];
    set(handles.text19,'string',tipoprueba);
end

if opcion == 2
    if f2 > 0;
        VHITd = VHIT2;
        tipoprueba = ['Test plane: ' tipo2];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 3
    if f3 > 0;
        VHITd = VHIT3;
        tipoprueba = ['Test plane: ' tipo3];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 4
    if f4 > 0;
        VHITd = VHIT4;
        tipoprueba = ['Test plane: ' tipo4];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 5
    if f5 > 0;
        VHITd = VHIT5;
        tipoprueba = ['Test plane: ' tipo5];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 6
    if f6 > 0;
        VHITd = VHIT6;
        tipoprueba = ['Test plane: ' tipo6];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end

if opcion == 7
    if f7 > 0;
        VHITd = VHIT7;
        tipoprueba = ['Test plane: ' tipo7];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 8
    if f8 > 0;
        VHITd = VHIT8;
        tipoprueba = ['Test plane: ' tipo8];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 9
    if f9 > 0;
        VHITd = VHIT9;
        tipoprueba = ['Test plane: ' tipo9];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 10
    if f10 > 0;
        VHITd = VHIT10;
        tipoprueba = ['Test plane: ' tipo10];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 11
    if f11 > 0;
        VHITd = VHIT11;
        tipoprueba = ['Test plane: ' tipo11];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end
if opcion == 12
    if f12 > 0;
        VHITd = VHIT12;
        tipoprueba = ['Test plane: ' tipo12];
        set(handles.text19,'string',tipoprueba);
    else
        warndlg('This test number does not exist', 'WARNING');
        return
    end
end

vhgencabizq = [];
vhgenojoizq = [];
maxojo = [];
listae = [];
ganac = [];
maxcabeza = [];
actual = 1;
set(handles.popupmenu2,'Value',1);
n=1;
n2=1;
n3=1;
[a,c]=size(VHITd);
while n < c
    if VHITd(1,n) == 1
        vhgencabizq (:,n2) = VHITd(:,n+1);
        vhgenojoizq (:,n2) = VHITd(:,n+2);
        ganac (n2,1) = VHITd(2,n3);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end

n = 1;
while n <= size(vhgencabizq);
    [h,i] = max(vhgencabizq(:,n));
    maxcabeza(n,[1 2]) = [h i];
    n=n+1;
end


n = 1;

%busqueda de los tres maximos en ojos a intervalos fijos
%SERIA BUENO añadir condicion, si lo vas a marcar comprueba que la
%velocidad del maximo es sensiblemente (40?) superior a la del reflejo
%(dato de la ganancia?)
while n <= size(vhgenojoizq);
    
    [h,i] = max(vhgenojoizq(45:95,n));
    
    gancor = ganac(n);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        pgan = gancor*0.0001;
    else
        pgan = gancor*0.0001;
    end
    
    if h > 100
        pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
        pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
        % pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
        %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
        %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
        %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
        
        if pend1<0&&pend2<0
            if pgan < 0.6
                maxojo(n,[1 2]) = [h i];
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 220
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
            %NUEVO
            if h > 15 + max(vhgenojoizq(20:38+i,n));
                maxojo(n,[1 2]) = [h i];
            end
        end
    else
        maxojo(n,[1 2]) = [0 0];
    end
    
    %NUEVO
    if maxojo(n,1) == 0;
        [hr,ir] = max(vhgenojoizq(65:95,n));
        if hr > 125
            maxojo(n,[1 2]) = [hr (ir+20)];
        end
    end
    
    [h,i] = max(vhgenojoizq(96:135,n));
    if h > 50
        maxojo(n,[3 4]) = [h i];
    else
        maxojo(n,[3 4]) = [0 0];
    end
    [h,i] = max(vhgenojoizq(136:175,n));
    if h > 50
        maxojo(n,[5 6]) = [h i];
    else
        maxojo(n,[5 6]) = [0 0];
    end
    n=n+1;
end

%Dibujo impulso original
gana = num2str(mean(ganac)/10000,4);
gantex = ['Gain: ' gana ' '];
set(handles.text7,'string',gantex);


% DIBUJO Y DATOS UN IMPULSO

%OJO siguiente linea no siempre ?
set(handles.checkbox21,'Value',0);

gancor = ganac(actual);
[desp tam] =size(num2str(gancor));
if tam == 5;
    gancor = gancor*0.0001;
else
    gancor = gancor*0.0001;
end

gancor2 = ['Gain: ' num2str(gancor) ' '];
set(handles.text31,'string',gancor2);

axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);

%ylim ([-75 350])

set (handles.text30,'string',maxcabeza(actual,2));
set (handles.text29,'string',round(maxcabeza(actual,1)));

if maxojo(actual,1) > 0
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',(maxojo(actual,2))+44);
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
else
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',maxojo(actual,2));
    
end

if maxojo(actual,3) > 0
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',(maxojo(actual,4))+95);
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
else
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',maxojo(actual,4));
end
if maxojo(actual,5) > 0
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',(maxojo(actual,6))+135);
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
else
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',maxojo(actual,6));
end
%no copiar en otras funciones
inutila=size(ganac);
inutil = inutila(1);
listae= zeros(inutil,1);
[tam,nulo] = size(listae);
posg = [num2str(actual) '/' num2str(tam)];
set(handles.text10,'string',posg);

%Dibujar y cálculos de grupo de impulso

n=1;
n2=1;
n3=1;
[a,c]=size(vhgencabizq);
while n < c
    if listae(n) == 1
        vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
        vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end
axes (handles.grupo);
cla;
hold all
plot(vhgenojoizq,'color',[1 0.5 0]);
plot(vhgencabizq,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojo(:,2);
v1=maxojo(:,1);
t2=maxojo(:,4);
v2=maxojo(:,3);
t3=maxojo(:,6);
v3=maxojo(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);
%RED NEURAL 10 ELMENTOS
a = [];
b = [];
c = [];
tam = [];
lmaxvalojor = [];
lmaxposojor = [];
lmaxvalojo = [];
lmaxposojo = [];
sens = 12;
sens2 = 35;
vhgenojoizqf = [];
vhgencabizqf = [];


vhgenojoizqf = low(vhgenojoizq);
vhgencabizqf = low(vhgencabizq);
[a,c]=size(vhgenojoizqf);



for  a = 1 : 1 : c
    
    [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
    [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
    [b,c] = size(lmaxvalojor);
    
    if b > 0
        if lmaxposojor(1) < (lmaxposcab(1)+10)
            
            lmaxposojor(1) = [];
            lmaxvalojor(1) = [];
            b = b-1;
        end
        lmaxvalojo(1:b,a) = lmaxvalojor;
        lmaxposojo(1:b,a) = lmaxposojor;
    end
end

[a,b] = size (lmaxposojo);
out = [];
if a > 0
    for p = 1:1:b
        
        if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
            out = horzcat(out,p);
        end
    end
    [r,s] = size(out);
    
    if s >0 && s<=2
        %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
        if s == 1
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(1))=[];
            lmaxvalojo(:,out(1))=[];
        else
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(2));
            lmaxposojo(:,out(1))=[];
            try lmaxposojo(:,out(2))=[];
            end
            lmaxvalojo(:,out(1))=[];
            try lmaxvalojo(:,out(2))=[];
            end
        end
    end
end
[tam,impuls] = size(lmaxposojo);


axes (handles.todos);
cla;
hold all
plot(vhgenojoizqf,'color',[1 0.5 0]);
if get(handles.popupmenu2,'Value') == 1
    plot(vhgencabizqf,'color','blue');
else
    plot(vhgencabizqf,'color','red');
end
xlim ([0 175]);
ylim ([-75 350]);
axis off;

axes (handles.s1)
plot(1,1,'kx')
axis off
axes (handles.s2)
plot(1,1,'k*')
axis off
axes (handles.s3)
plot(1,1,'k+')
axis off
axes (handles.s4)
plot(1,1,'ko')
axis off
axes (handles.todos)

for p=1:1:impuls
    if tam > 0
        x = lmaxposojo(1,:);
        y = lmaxvalojo(1,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'kx')
        
    end
    if tam > 1
        x = lmaxposojo(2,:);
        y = lmaxvalojo(2,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k*')
    end
    if tam > 2
        x = lmaxposojo(3,:);
        y = lmaxvalojo(3,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k+')
        
    end
    if tam > 3
        x = lmaxposojo(4,:);
        y = lmaxvalojo(4,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'ko')
        
    end
    
end
pr1 = 0;
pr2 = 0;
pr3 = 0;
pr4 = 0;

if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    pr1 = (std(x)/mean(x))*100;
end
if tam > 1
    x = lmaxposojo(2,:)*100;
    x(x==0) = [];
    pr2 = (std(x)/mean(x))*100;
end
if tam > 2
    x = lmaxposojo(3,:);
    x(x==0) = [];
    pr3 = (std(x)/mean(x))*100;
end
if tam > 3
    x = lmaxposojo(4,:);
    x(x==0) = [];
    pr4 = (std(x)/mean(x))*100;
end
if isnan(pr1)
    pr1 = 0;
end
if isnan(pr2)
    pr2 = 0;
end
if isnan(pr3)
    pr3 = 0;
end
if isnan(pr4)
    pr4 = 0;
end
set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);

if pr1 <= sens
    if pr2 >= sens2
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    else
        set(handles.text51,'string','GATHERED');
        set(handles.text51,'ForegroundColor',[0 0.9 0]);
    end
end
if pr1 > sens
    set(handles.text51,'string','SCATTERED');
    set(handles.text51,'ForegroundColor',[0.9 0 0]);
end

if isempty (lmaxposojo)
    set(handles.text51,'string','NORMAL');
    set(handles.text51,'ForegroundColor',[0 0 0]);
else
    xu = lmaxposojo(1,:);
    xu(xu==0) = [];
    if size (xu) <4
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    end
end
impuls;
if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    [tam2,impuls2] = size(x);
    ind = 1-(impuls2 / impuls);
else
    ind = 0;
end

prg = 2.5*(0.8*pr1+0.2*pr2);

if prg > 35
    prg = prg -(30*ind);
end
if prg > 100
    prg = 100;
end
set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])

%FIN RED



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global actual maxojo VHITd vhgencabizq vhgenojoizq ganac maxcabeza listae rnp icono
vhgencabizq = [];
vhgenojoizq = [];
maxojo = [];
listae = [];
ganac = [];
maxcabeza = [];
if get(hObject,'Value') == 2;
    actual = 1;
    n=1;
    n2=1;
    n3=1;
    [a,c]=size(VHITd);
    while n < c
        if VHITd(1,n) == 0
            vhgencabizq (:,n2) = VHITd(:,n+1);
            vhgenojoizq (:,n2) = VHITd(:,n+2);
            ganac (n2,1) = VHITd(2,n);
            n2=n2+1;
        end
        n = n + 1;
    end
    n = 1;
    while n <= size(vhgencabizq);
        [h,i] = max(vhgencabizq(:,n));
        maxcabeza(n,[1 2]) = [h i];
        n=n+1;
    end
    
    
    n = 1;
    
    %busqueda de los tres maximos en ojos a intervalos fijos
    while n <= size(vhgenojoizq);
        [h,i] = max(vhgenojoizq(45:95,n));
        
        gancor = ganac(n);
        [desp tam] =size(num2str(gancor));
        if tam == 5;
            pgan = gancor*0.0001;
        else
            pgan = gancor*0.0001;
        end
        
        if h > 100
            pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
            pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
            %pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
            %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
            %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
            %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
            
            if pend1<0&&pend2<0
                if pgan < 0.6
                    maxojo(n,[1 2]) = [h i];
                else
                    maxojo(n,[1 2]) = [0 0];
                    %NUEVO
                    if h > 220
                        maxojo(n,[1 2]) = [h i];
                    end
                end
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 15 + max(vhgenojoizq(20:38+i,n));
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
        end
        
        %NUEVO
        if maxojo(n,1) == 0;
            [hr,ir] = max(vhgenojoizq(65:95,n));
            if hr > 125
                maxojo(n,[1 2]) = [hr (ir+20)];
            end
        end
        
        [h,i] = max(vhgenojoizq(96:135,n));
        if h > 50
            maxojo(n,[3 4]) = [h i];
        else
            maxojo(n,[3 4]) = [0 0];
        end
        [h,i] = max(vhgenojoizq(136:175,n));
        if h > 50
            maxojo(n,[5 6]) = [h i];
        else
            maxojo(n,[5 6]) = [0 0];
        end
        n=n+1;
    end
    
    %Dibujo impulso original
    gana = num2str(mean(ganac)/10000,4);
    gantex = ['Gain: ' gana ' '];
    set(handles.text7,'string',gantex);
    
    % DIBUJO Y DATOS UN IMPULSO
    
    %OJO siguiente linea no siempre ?
    set(handles.checkbox21,'Value',0);
    
    gancor = ganac(actual);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        gancor = gancor*0.0001;
    else
        gancor = gancor*0.0001;
    end
    
    gancor2 = ['Gain: ' num2str(gancor) ' '];
    set(handles.text31,'string',gancor2);
    
    axes (handles.impulso);
    hold all
    cla
    plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
    plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
    ylim('auto')
    ejey = get(handles.impulso,'ylim');
    ylim([ejey(1) 350]);
    xlim ([0 175])
    line (45:94,345,'color', 'black','LineWidth',2);
    line (95:134,345,'color', 'white','LineWidth',2);
    line (135:175,345,'color', 'black','LineWidth',2);
    %ylim ([-75 350])
    
    set (handles.text30,'string',maxcabeza(actual,2));
    set (handles.text29,'string',round(maxcabeza(actual,1)));
    
    if maxojo(actual,1) > 0
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',(maxojo(actual,2))+44);
        plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
    else
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',maxojo(actual,2));
        
    end
    
    if maxojo(actual,3) > 0
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',(maxojo(actual,4))+95);
        plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
    else
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',maxojo(actual,4));
    end
    if maxojo(actual,5) > 0
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',(maxojo(actual,6))+135);
        plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
    else
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',maxojo(actual,6));
    end
    %no copiar en otras funciones
    inutila=size(ganac);
    inutil = inutila(1);
    listae= zeros(inutil,1);
    [tam,nulo] = size(listae);
    posg = [num2str(actual) '/' num2str(tam)];
    set(handles.text10,'string',posg);
    
    %Dibujar y cálculos de grupo de impulso
    
    n=1;
    n2=1;
    n3=1;
    [a,c]=size(vhgencabizq);
    while n < c
        if listae(n) == 1
            vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
            vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
            n2=n2+1;
            n3=n3+3;
        end
        n = n + 1;
    end
    axes (handles.grupo);
    cla;
    hold all
    plot(vhgenojoizq,'color',[1 0.5 0]);
    plot(vhgencabizq,'color','blue');
    xlim ([0 175]);
    %ylim ([-75 350]);
    
    %Ajuste de matrices para cálculos
    t1=maxojo(:,2);
    v1=maxojo(:,1);
    t2=maxojo(:,4);
    v2=maxojo(:,3);
    t3=maxojo(:,6);
    v3=maxojo(:,5);
    
    [a,c]=size(t1);
    n = 1;
    while a >= n
        t1(n)=(t1(n)+44);
        n=n+1;
    end
    n = a;
    while n>1
        if t1(n)==44
            t1(n)=[];
        end
        n = n-1;
    end
    [a,c]=size(t1);
    if a==1&&t1(1)==44
        t1(1)=0;
        v1(1)=0;
    end
    if a>1&&t1(1)==44
        t1(1)=[];
        v1(1)=[];
    end
    
    [a,c]=size(t2);
    n = 1;
    while a >= n
        t2(n)=(t2(n)+95);
        n=n+1;
    end
    n = a;
    while n>1
        if t2(n)==95
            t2(n)=[];
        end
        n = n-1;
    end
    [a,c]=size(t2);
    if a==1&&t2(1)==95
        t2(1)=0;
        v2(1)=0;
    end
    if a>1&&t2(1)==95
        t2(1)=[];
        v2(1)=[];
    end
    
    [a,c]=size(t3);
    n = 1;
    while a >= n
        t3(n)=(t3(n)+135);
        n=n+1;
    end
    n = a;
    while n>1
        if t3(n)==135
            t3(n)=[];
        end
        n = n-1;
    end
    [a,c]=size(t3);
    if a==1&&t3(1)==135
        t3(1)=0;
        v3(1)=0;
    end
    if a>1&&t3(1)==135
        t3(1)=[];
        v3(1)=[];
    end
    
    %El elemento 1 está sin ajustar en la velocidad ¿?
    [n,c]=size(v3);
    while n>1
        if v3(n)==0
            v3(n)=[];
        end
        n = n-1;
    end
    [n,c]=size(v3);
    if n>1&&v3(1)==0
        v3(1)=[];
    end
    
    [n,c]=size(v2);
    while n>1
        if v2(n)==0
            v2(n)=[];
        end
        n = n-1;
    end
    [n,c]=size(v2);
    if n>1&&v2(1)==0
        v2(1)=[];
    end
    
    [n,c]=size(v1);
    while n>1
        if v1(n)==0
            v1(n)=[];
        end
        n = n-1;
    end
    [n,c]=size(v1);
    if n>1&&v1(1)==0
        v1(1)=[];
    end
    
    
    %Cálculos coef.var
    
    [n,c]=size(t1);
    [n2,c]=size(t2);
    [n3,c]=size(t3);
    
    a = mean(t1);
    b = mean(t2);
    c = mean(t3);
    g = mean(v1);
    h = mean(v2);
    i = mean(v3);
    
    if a == 0
        n = 0;
    end
    if b == 0
        n2 = 0;
    end
    if c == 0
        n3 = 0;
    end
    
    if a > 0
        d = std(t1)/mean(t1);
    else
        d = 0;
    end
    if b > 0
        e = std(t2)/mean(t2);
    else
        e = 0;
    end
    if c > 0
        f = std(t3)/mean(t3);
    else
        f = 0;
    end
    
    if g > 0
        j = std(v1)/mean(v1);
    else
        j = 0;
    end
    if h > 0
        k = std(v2)/mean(v2);
    else
        k = 0;
    end
    if i > 0
        l = std(v3)/mean(v3);
    else
        l = 0;
    end
    
    % SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
    na = num2str(n);
    nb = num2str(n2);
    nc = num2str(n3);
    ad = num2str(round(a));
    bd = num2str(round(b));
    xd = num2str(round(c));
    dd = num2str(d);
    ed = num2str(e);
    fd = num2str(f);
    gd = num2str(round(g));
    hd = num2str(round(h));
    id = num2str(round(i));
    jd = num2str(j);
    kd = num2str(k);
    ld = num2str(l);
    
    
    cvm = round(((d+e+f)/3)*100);
    r = [num2str(cvm) ' % '];
    rta = num2str(round(((j+k+l)/3)*100));
    rt = [rta ' % '];
    
    
    set (handles.text35,'string',ad);
    set (handles.text36,'string',bd);
    set (handles.text37,'string',xd);
    set (handles.text41,'string',dd);
    set (handles.text42,'string',ed);
    set (handles.text43,'string',fd);
    set (handles.text44,'string',r);
    set (handles.text49,'string',rt);
    set (handles.text46,'string',gd);
    set (handles.text47,'string',hd);
    set (handles.text48,'string',id);
    set (handles.text66,'string',jd);
    set (handles.text67,'string',kd);
    set (handles.text68,'string',ld);
    set (handles.text53,'string',na);
    set (handles.text54,'string',nb);
    set (handles.text55,'string',nc);
    
    %RED NEURAL 10 ELMENTOS
    a = [];
    b = [];
    c = [];
    tam = [];
    lmaxvalojor = [];
    lmaxposojor = [];
    lmaxvalojo = [];
    lmaxposojo = [];
    sens = 12;
    sens2 = 35;
    vhgenojoizqf = [];
    vhgencabizqf = [];
    
    
    vhgenojoizqf = low(vhgenojoizq);
    vhgencabizqf = low(vhgencabizq);
    [a,c]=size(vhgenojoizqf);
    
    
    
    for  a = 1 : 1 : c
        
        [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
        [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
        [b,c] = size(lmaxvalojor);
        
        if b > 0
            if lmaxposojor(1) < (lmaxposcab(1)+10)
                
                lmaxposojor(1) = [];
                lmaxvalojor(1) = [];
                b = b-1;
            end
            lmaxvalojo(1:b,a) = lmaxvalojor;
            lmaxposojo(1:b,a) = lmaxposojor;
        end
    end
    
    [a,b] = size (lmaxposojo);
    out = [];
    if a > 0
        for p = 1:1:b
            
            if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
                out = horzcat(out,p);
            end
        end
        [r,s] = size(out);
        
        if s >0 && s<=2
            %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
            if s == 1
                lmaxposojo(:,out(1));
                lmaxposojo(:,out(1))=[];
                lmaxvalojo(:,out(1))=[];
            else
                lmaxposojo(:,out(1));
                lmaxposojo(:,out(2));
                lmaxposojo(:,out(1))=[];
                try lmaxposojo(:,out(2))=[];
                end
                lmaxvalojo(:,out(1))=[];
                try lmaxvalojo(:,out(2))=[];
                end
            end
        end
    end
    [tam,impuls] = size(lmaxposojo);
    
    
    axes (handles.todos);
    cla;
    hold all
    plot(vhgenojoizqf,'color',[1 0.5 0]);
    if get(handles.popupmenu2,'Value') == 1
        plot(vhgencabizqf,'color','blue');
    else
        plot(vhgencabizqf,'color','red');
    end
    xlim ([0 175]);
    ylim ([-75 350]);
    axis off;
    
    axes (handles.s1)
    plot(1,1,'kx')
    axis off
    axes (handles.s2)
    plot(1,1,'k*')
    axis off
    axes (handles.s3)
    plot(1,1,'k+')
    axis off
    axes (handles.s4)
    plot(1,1,'ko')
    axis off
    axes (handles.todos)
    
    for p=1:1:impuls
        if tam > 0
            x = lmaxposojo(1,:);
            y = lmaxvalojo(1,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'kx')
            
        end
        if tam > 1
            x = lmaxposojo(2,:);
            y = lmaxvalojo(2,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'k*')
        end
        if tam > 2
            x = lmaxposojo(3,:);
            y = lmaxvalojo(3,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'k+')
            
        end
        if tam > 3
            x = lmaxposojo(4,:);
            y = lmaxvalojo(4,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'ko')
            
        end
        
    end
    pr1 = 0;
    pr2 = 0;
    pr3 = 0;
    pr4 = 0;
    
    if tam > 0
        x = lmaxposojo(1,:);
        x(x==0) = [];
        pr1 = (std(x)/mean(x))*100;
    end
    if tam > 1
        x = lmaxposojo(2,:)*100;
        x(x==0) = [];
        pr2 = (std(x)/mean(x))*100;
    end
    if tam > 2
        x = lmaxposojo(3,:);
        x(x==0) = [];
        pr3 = (std(x)/mean(x))*100;
    end
    if tam > 3
        x = lmaxposojo(4,:);
        x(x==0) = [];
        pr4 = (std(x)/mean(x))*100;
    end
    
    if isnan(pr1)
        pr1 = 0;
    end
    if isnan(pr2)
        pr2 = 0;
    end
    if isnan(pr3)
        pr3 = 0;
    end
    if isnan(pr4)
        pr4 = 0;
    end
    
    set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
    set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
    set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
    set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);
    
    if pr1 <= sens
        if pr2 >= sens2
            set(handles.text51,'string','SCATTERED');
            set(handles.text51,'ForegroundColor',[0.9 0 0]);
        else
            set(handles.text51,'string','GATHERED');
            set(handles.text51,'ForegroundColor',[0 0.9 0]);
        end
    end
    if pr1 > sens
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    end
    
    if isempty (lmaxposojo)
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    else
        xu = lmaxposojo(1,:);
        xu(xu==0) = [];
        if size (xu) <4
            set(handles.text51,'string','NORMAL');
            set(handles.text51,'ForegroundColor',[0 0 0]);
        end
    end
    impuls;
    if tam > 0
        x = lmaxposojo(1,:);
        x(x==0) = [];
        [tam2,impuls2] = size(x);
        ind = 1-(impuls2 / impuls);
    else
        ind = 0;
    end
    
    prg = 2.5*(0.8*pr1+0.2*pr2);
    
    if prg > 35
        prg = prg -(30*ind);
    end
    if prg > 100
        prg = 100;
    end
    set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])
    
    %FIN RED
    
    
    %AQUI EMPIEZA EN CASO DE SELECCION DE LADO IZQUIERDO
else
    actual = 1;
    n=1;
    n2=1;
    n3=1;
    [a,c]=size(VHITd);
    while n < c
        if VHITd(1,n) == 1
            vhgencabizq (:,n2) = VHITd(:,n+1);
            vhgenojoizq (:,n2) = VHITd(:,n+2);
            ganac (n2,1) = VHITd(2,n);
            n2=n2+1;
        end
        n = n + 1;
    end
    n = 1;
    while n <= size(vhgencabizq);
        [h,i] = max(vhgencabizq(:,n));
        maxcabeza(n,[1 2]) = [h i];
        n=n+1;
    end
    
    
    n = 1;
    
    %busqueda de los tres maximos en ojos a intervalos fijos
    while n <= size(vhgenojoizq);
        [h,i] = max(vhgenojoizq(45:95,n));
        
        gancor = ganac(n);
        [desp tam] =size(num2str(gancor));
        if tam == 5;
            pgan = gancor*0.0001;
        else
            pgan = gancor*0.0001;
        end
        
        if h > 100
            pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
            pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
            %pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
            %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
            %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
            %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
            
            if pend1<0&&pend2<0
                if pgan < 0.6
                    maxojo(n,[1 2]) = [h i];
                else
                    maxojo(n,[1 2]) = [0 0];
                    %NUEVO
                    if h > 220
                        maxojo(n,[1 2]) = [h i];
                    end
                end
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 15 + max(vhgenojoizq(20:38+i,n));
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
        end
        
        %NUEVO
        if maxojo(n,1) == 0;
            [hr,ir] = max(vhgenojoizq(65:95,n));
            if hr > 125
                maxojo(n,[1 2]) = [hr (ir+20)];
            end
        end
        
        [h,i] = max(vhgenojoizq(96:135,n));
        if h > 50
            maxojo(n,[3 4]) = [h i];
        else
            maxojo(n,[3 4]) = [0 0];
        end
        [h,i] = max(vhgenojoizq(136:175,n));
        if h > 50
            maxojo(n,[5 6]) = [h i];
        else
            maxojo(n,[5 6]) = [0 0];
        end
        n=n+1;
    end
    
    %Dibujo impulso original
    gana = num2str(mean(ganac)/10000,4);
    gantex = ['Gain: ' gana ' '];
    set(handles.text7,'string',gantex);
    
    
    % DIBUJO Y DATOS UN IMPULSO
    
    %OJO siguiente linea no siempre ?
    set(handles.checkbox21,'Value',0);
    
    gancor = ganac(actual);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        gancor = gancor*0.0001;
    else
        gancor = gancor*0.0001;
    end
    
    gancor2 = ['Gain: ' num2str(gancor) ' '];
    set(handles.text31,'string',gancor2);
    
    axes (handles.impulso);
    hold all
    cla
    plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
    plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
    ylim('auto')
    ejey = get(handles.impulso,'ylim');
    ylim([ejey(1) 350]);
    xlim ([0 175])
    line (45:94,345,'color', 'black','LineWidth',2);
    line (95:134,345,'color', 'white','LineWidth',2);
    line (135:175,345,'color', 'black','LineWidth',2);
    %ylim ([-75 350])
    
    set (handles.text30,'string',maxcabeza(actual,2));
    set (handles.text29,'string',round(maxcabeza(actual,1)));
    
    if maxojo(actual,1) > 0
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',(maxojo(actual,2))+44);
        plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
    else
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',maxojo(actual,2));
        
    end
    
    if maxojo(actual,3) > 0
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',(maxojo(actual,4))+95);
        plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
    else
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',maxojo(actual,4));
    end
    if maxojo(actual,5) > 0
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',(maxojo(actual,6))+135);
        plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
    else
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',maxojo(actual,6));
    end
    %no copiar en otras funciones
    inutila=size(ganac);
    inutil = inutila(1);
    listae= zeros(inutil,1);
    [tam,nulo] = size(listae);
    posg = [num2str(actual) '/' num2str(tam)];
    set(handles.text10,'string',posg);
    
    %Dibujar y cálculos de grupo de impulso
    
    n=1;
    n2=1;
    n3=1;
    [a,c]=size(vhgencabizq);
    while n < c
        if listae(n) == 1
            vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
            vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
            n2=n2+1;
            n3=n3+3;
        end
        n = n + 1;
    end
    axes (handles.grupo);
    cla;
    hold all
    plot(vhgenojoizq,'color',[1 0.5 0]);
    plot(vhgencabizq,'color','blue');
    xlim ([0 175]);
    %ylim ([-75 350]);
    
    %Ajuste de matrices para cálculos
    t1=maxojo(:,2);
    v1=maxojo(:,1);
    t2=maxojo(:,4);
    v2=maxojo(:,3);
    t3=maxojo(:,6);
    v3=maxojo(:,5);
    
    [a,c]=size(t1);
    n = 1;
    while a >= n
        t1(n)=(t1(n)+44);
        n=n+1;
    end
    n = a;
    while n>1
        if t1(n)==44
            t1(n)=[];
        end
        n = n-1;
    end
    [a,c]=size(t1);
    if a==1&&t1(1)==44
        t1(1)=0;
        v1(1)=0;
    end
    if a>1&&t1(1)==44
        t1(1)=[];
        v1(1)=[];
    end
    
    [a,c]=size(t2);
    n = 1;
    while a >= n
        t2(n)=(t2(n)+95);
        n=n+1;
    end
    n = a;
    while n>1
        if t2(n)==95
            t2(n)=[];
        end
        n = n-1;
    end
    [a,c]=size(t2);
    if a==1&&t2(1)==95
        t2(1)=0;
        v2(1)=0;
    end
    if a>1&&t2(1)==95
        t2(1)=[];
        v2(1)=[];
    end
    
    [a,c]=size(t3);
    n = 1;
    while a >= n
        t3(n)=(t3(n)+135);
        n=n+1;
    end
    n = a;
    while n>1
        if t3(n)==135
            t3(n)=[];
        end
        n = n-1;
    end
    [a,c]=size(t3);
    if a==1&&t3(1)==135
        t3(1)=0;
        v3(1)=0;
    end
    if a>1&&t3(1)==135
        t3(1)=[];
        v3(1)=[];
    end
    
    %El elemento 1 está sin ajustar en la velocidad ¿?
    [n,c]=size(v3);
    while n>1
        if v3(n)==0
            v3(n)=[];
        end
        n = n-1;
    end
    [n,c]=size(v3);
    if n>1&&v3(1)==0
        v3(1)=[];
    end
    
    [n,c]=size(v2);
    while n>1
        if v2(n)==0
            v2(n)=[];
        end
        n = n-1;
    end
    [n,c]=size(v2);
    if n>1&&v2(1)==0
        v2(1)=[];
    end
    
    [n,c]=size(v1);
    while n>1
        if v1(n)==0
            v1(n)=[];
        end
        n = n-1;
    end
    [n,c]=size(v1);
    if n>1&&v1(1)==0
        v1(1)=[];
    end
    
    
    %Cálculos coef.var
    
    [n,c]=size(t1);
    [n2,c]=size(t2);
    [n3,c]=size(t3);
    
    a = mean(t1);
    b = mean(t2);
    c = mean(t3);
    g = mean(v1);
    h = mean(v2);
    i = mean(v3);
    
    if a == 0
        n = 0;
    end
    if b == 0
        n2 = 0;
    end
    if c == 0
        n3 = 0;
    end
    
    if a > 0
        d = std(t1)/mean(t1);
    else
        d = 0;
    end
    if b > 0
        e = std(t2)/mean(t2);
    else
        e = 0;
    end
    if c > 0
        f = std(t3)/mean(t3);
    else
        f = 0;
    end
    
    if g > 0
        j = std(v1)/mean(v1);
    else
        j = 0;
    end
    if h > 0
        k = std(v2)/mean(v2);
    else
        k = 0;
    end
    if i > 0
        l = std(v3)/mean(v3);
    else
        l = 0;
    end
    
    % SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
    na = num2str(n);
    nb = num2str(n2);
    nc = num2str(n3);
    ad = num2str(round(a));
    bd = num2str(round(b));
    xd = num2str(round(c));
    dd = num2str(d);
    ed = num2str(e);
    fd = num2str(f);
    gd = num2str(round(g));
    hd = num2str(round(h));
    id = num2str(round(i));
    jd = num2str(j);
    kd = num2str(k);
    ld = num2str(l);
    
    
    cvm = round(((d+e+f)/3)*100);
    r = [num2str(cvm) ' % '];
    rta = num2str(round(((j+k+l)/3)*100));
    rt = [rta ' % '];
    
    
    set (handles.text35,'string',ad);
    set (handles.text36,'string',bd);
    set (handles.text37,'string',xd);
    set (handles.text41,'string',dd);
    set (handles.text42,'string',ed);
    set (handles.text43,'string',fd);
    set (handles.text44,'string',r);
    set (handles.text49,'string',rt);
    set (handles.text46,'string',gd);
    set (handles.text47,'string',hd);
    set (handles.text48,'string',id);
    set (handles.text66,'string',jd);
    set (handles.text67,'string',kd);
    set (handles.text68,'string',ld);
    set (handles.text53,'string',na);
    set (handles.text54,'string',nb);
    set (handles.text55,'string',nc);
    
    %RED NEURAL 10 ELMENTOS
    a = [];
    b = [];
    c = [];
    tam = [];
    lmaxvalojor = [];
    lmaxposojor = [];
    lmaxvalojo = [];
    lmaxposojo = [];
    sens = 12;
    sens2 = 35;
    vhgenojoizqf = [];
    vhgencabizqf = [];
    
    
    vhgenojoizqf = low(vhgenojoizq);
    vhgencabizqf = low(vhgencabizq);
    [a,c]=size(vhgenojoizqf);
    
    
    
    for  a = 1 : 1 : c
        
        [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
        [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
        [b,c] = size(lmaxvalojor);
        
        if b > 0
            if lmaxposojor(1) < (lmaxposcab(1)+10)
                
                lmaxposojor(1) = [];
                lmaxvalojor(1) = [];
                b = b-1;
            end
            lmaxvalojo(1:b,a) = lmaxvalojor;
            lmaxposojo(1:b,a) = lmaxposojor;
        end
    end
    
    [a,b] = size (lmaxposojo);
    out = [];
    if a > 0
        for p = 1:1:b
            
            if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
                out = horzcat(out,p);
            end
        end
        [r,s] = size(out);
        
        if s >0 && s<=2
            %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
            if s == 1
                lmaxposojo(:,out(1));
                lmaxposojo(:,out(1))=[];
                lmaxvalojo(:,out(1))=[];
            else
                lmaxposojo(:,out(1));
                lmaxposojo(:,out(2));
                lmaxposojo(:,out(1))=[];
                try lmaxposojo(:,out(2))=[];
                end
                lmaxvalojo(:,out(1))=[];
                try lmaxvalojo(:,out(2))=[];
                end
            end
        end
    end
    [tam,impuls] = size(lmaxposojo);
    
    
    axes (handles.todos);
    cla;
    hold all
    plot(vhgenojoizqf,'color',[1 0.5 0]);
    if get(handles.popupmenu2,'Value') == 1
        plot(vhgencabizqf,'color','blue');
    else
        plot(vhgencabizqf,'color','red');
    end
    xlim ([0 175]);
    ylim ([-75 350]);
    axis off;
    
    axes (handles.s1)
    plot(1,1,'kx')
    axis off
    axes (handles.s2)
    plot(1,1,'k*')
    axis off
    axes (handles.s3)
    plot(1,1,'k+')
    axis off
    axes (handles.s4)
    plot(1,1,'ko')
    axis off
    axes (handles.todos)
    
    for p=1:1:impuls
        if tam > 0
            x = lmaxposojo(1,:);
            y = lmaxvalojo(1,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'kx')
            
        end
        if tam > 1
            x = lmaxposojo(2,:);
            y = lmaxvalojo(2,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'k*')
        end
        if tam > 2
            x = lmaxposojo(3,:);
            y = lmaxvalojo(3,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'k+')
            
        end
        if tam > 3
            x = lmaxposojo(4,:);
            y = lmaxvalojo(4,:);
            x(x==0) = [];
            y(y==0) = [];
            plot(x,y+0.05,'ko')
            
        end
        
    end
    pr1 = 0;
    pr2 = 0;
    pr3 = 0;
    pr4 = 0;
    
    if tam > 0
        x = lmaxposojo(1,:);
        x(x==0) = [];
        pr1 = (std(x)/mean(x))*100;
    end
    if tam > 1
        x = lmaxposojo(2,:)*100;
        x(x==0) = [];
        pr2 = (std(x)/mean(x))*100;
    end
    if tam > 2
        x = lmaxposojo(3,:);
        x(x==0) = [];
        pr3 = (std(x)/mean(x))*100;
    end
    if tam > 3
        x = lmaxposojo(4,:);
        x(x==0) = [];
        pr4 = (std(x)/mean(x))*100;
    end
    if isnan(pr1)
        pr1 = 0;
    end
    if isnan(pr2)
        pr2 = 0;
    end
    if isnan(pr3)
        pr3 = 0;
    end
    if isnan(pr4)
        pr4 = 0;
    end
    set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
    set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
    set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
    set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);
    
    if pr1 <= sens
        if pr2 >= sens2
            set(handles.text51,'string','SCATTERED');
            set(handles.text51,'ForegroundColor',[0.9 0 0]);
        else
            set(handles.text51,'string','GATHERED');
            set(handles.text51,'ForegroundColor',[0 0.9 0]);
        end
    end
    if pr1 > sens
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    end
    
    if isempty (lmaxposojo)
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    else
        xu = lmaxposojo(1,:);
        xu(xu==0) = [];
        if size (xu) <4
            set(handles.text51,'string','NORMAL');
            set(handles.text51,'ForegroundColor',[0 0 0]);
        end
    end
    impuls;
    if tam > 0
        x = lmaxposojo(1,:);
        x(x==0) = [];
        [tam2,impuls2] = size(x);
        ind = 1-(impuls2 / impuls);
    else
        ind = 0;
    end
    
    
    prg = 2.5*(0.8*pr1+0.2*pr2);
    
    if prg > 35
        prg = prg -(30*ind);
    end
    if prg > 100
        prg = 100;
    end
    set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])
    
    %FIN RED
    
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual vhgenojoizq vhgencabizq maxojo listae ganac maxcabeza
if actual > 1
    actual = actual -1;
    set(handles.checkbox21,'value',listae(actual));
    [tam,nulo] = size(listae);
    posg = [num2str(actual) '/' num2str(tam)];
    set(handles.text10,'string',posg);
    
    %Dibujar grafica
    
    gancor = ganac(actual);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        gancor = gancor*0.0001;
    else
        gancor = gancor*0.0001;
    end
    
    gancor2 = ['Gain: ' num2str(gancor) ' '];
    set(handles.text31,'string',gancor2);
    axes (handles.impulso);
    hold all
    cla
    plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
    plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
    ylim('auto')
    ejey = get(handles.impulso,'ylim');
    ylim([ejey(1) 350]);
    xlim ([0 175])
    line (45:94,345,'color', 'black','LineWidth',2);
    line (95:134,345,'color', 'white','LineWidth',2);
    line (135:175,345,'color', 'black','LineWidth',2);
    %ylim ([-75 350])
    
    set (handles.text30,'string',maxcabeza(actual,2));
    set (handles.text29,'string',round(maxcabeza(actual,1)));
    
    if maxojo(actual,1) > 0
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',(maxojo(actual,2))+44);
        plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
    else
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',maxojo(actual,2));
        
    end
    
    if maxojo(actual,3) > 0
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',(maxojo(actual,4))+95);
        plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
    else
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',maxojo(actual,4));
    end
    if maxojo(actual,5) > 0
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',(maxojo(actual,6))+135);
        plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
    else
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',maxojo(actual,6));
    end
else
    return
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual vhgenojoizq vhgencabizq maxojo listae ganac maxcabeza

if actual < size(vhgencabizq)
    actual = actual +1;
    set(handles.checkbox21,'value',listae(actual));
    [tam,nulo] = size(listae);
    posg = [num2str(actual) '/' num2str(tam)];
    set(handles.text10,'string',posg);
    
    %dibujar grafica
    gancor = ganac(actual);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        gancor = gancor*0.0001;
    else
        gancor = gancor*0.0001;
    end
    
    gancor2 = ['Gain: ' num2str(gancor) ' '];
    set(handles.text31,'string',gancor2);
    axes (handles.impulso);
    hold all
    cla
    plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
    plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
    ylim('auto')
    ejey = get(handles.impulso,'ylim');
    ylim([ejey(1) 350]);
    xlim ([0 175])
    line (45:94,345,'color', 'black','LineWidth',2);
    line (95:134,345,'color', 'white','LineWidth',2);
    line (135:175,345,'color', 'black','LineWidth',2);
    %ylim ([-75 350])
    
    set (handles.text30,'string',maxcabeza(actual,2));
    set (handles.text29,'string',round(maxcabeza(actual,1)));
    
    if maxojo(actual,1) > 0
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',(maxojo(actual,2))+44);
        plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
    else
        set (handles.text26,'string',round(maxojo(actual,1)));
        set (handles.edit1,'string',maxojo(actual,2));
        
    end
    
    if maxojo(actual,3) > 0
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',(maxojo(actual,4))+95);
        plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
    else
        set (handles.text27,'string',round(maxojo(actual,3)));
        set (handles.edit2,'string',maxojo(actual,4));
    end
    if maxojo(actual,5) > 0
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',(maxojo(actual,6))+135);
        plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
    else
        set (handles.text28,'string',round(maxojo(actual,5)));
        set (handles.edit3,'string',maxojo(actual,6));
    end
    
else
    return
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vhgenojoizq actual maxojo vhgencabizq listae
if (get(handles.checkbox21,'value')) == 1
    msgbox('Actual impulse is eliminated, unmark the elimination for correct changes apply', 'ERROR','error');
    return
end

tnu1 = str2num(get(handles.edit1,'string'));
tnu2 = str2num(get(handles.edit2,'string'));
tnu3 = str2num(get(handles.edit3,'string'));

if tnu1 >-1
else
    set(handles.edit1,'string',maxojo(actual,2)+44)
    return
end
if tnu2 >-1
else
    set(handles.edit2,'string',maxojo(actual,4)+95)
    return
end
if tnu3 >-1
else
    set(handles.edit3,'string',maxojo(actual,6)+135)
    return
end


if tnu1 >175 || tnu1 <0
    set(handles.edit1,'string',maxojo(actual,2)+44)
    return
end
if tnu2 >175 || tnu2 <0
    set(handles.edit2,'string',maxojo(actual,4)+95)
    return
end
if tnu3 >175 || tnu3 <0
    set(handles.edit3,'string',maxojo(actual,6)+135)
    return
end


%Cambio t1
if tnu1 > 0
    maxojo(actual,2) = round(tnu1-44);
    maxojo(actual,1) = vhgenojoizq(tnu1,actual);
    set (handles.text26,'string',round(maxojo(actual,1)));
end
if tnu1 == 0
    maxojo(actual,2) = 0;
    maxojo(actual,1) = 0;
    set (handles.text26,'string',round(maxojo(actual,1)));
end
axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
if tnu1 > 0
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
end

if maxojo(actual,3) > 0
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
end
if maxojo(actual,5) > 0
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
end

ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);
%ylim ([-75 350])

%Cambio t2
if tnu2 > 0
    maxojo(actual,4) = round(tnu2-95);
    maxojo(actual,3) = vhgenojoizq(tnu2,actual);
    set (handles.text27,'string',round(maxojo(actual,3)));
end
if tnu2 == 0
    maxojo(actual,4) = 0;
    maxojo(actual,3) = 0;
    set (handles.text27,'string',round(maxojo(actual,3)));
end
axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
if tnu2 > 0
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
end
if maxojo(actual,1) > 0
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
end
if maxojo(actual,5) > 0
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
end

ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);
%ylim ([-75 350])

%Cambio t3
if tnu3 > 0
    maxojo(actual,6) = round(tnu3-135);
    maxojo(actual,5) = vhgenojoizq(tnu3,actual);
    set (handles.text28,'string',round(maxojo(actual,5)));
end
if tnu3 == 0
    maxojo(actual,6) = 0;
    maxojo(actual,5) = 0;
    set (handles.text28,'string',round(maxojo(actual,5)));
end
axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
if tnu3 >0
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
end
if maxojo(actual,3) > 0
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
end
if maxojo(actual,1) > 0
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
end

ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);
%ylim ([-75 350])

%Dibujar y cálculos de grupo de impulso

%Ajuste de matrices para cálculos
[tama olvida] = size(listae);
n = 1;
n2 = 1;
while tama >= n;
    if listae(n) == 0
        vhgenojoizqx(:,n2)=vhgenojoizq(:,n);
        vhgencabizqx(:,n2)=vhgencabizq(:,n);
        maxojox(n2,:)=maxojo(n,:);
        n2=n2+1;
    end
    n = n+1;
end


axes (handles.grupo);
cla;
hold all
plot(vhgenojoizqx,'color',[1 0.5 0]);
plot(vhgencabizqx,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojox(:,2);
v1=maxojox(:,1);
t2=maxojox(:,4);
v2=maxojox(:,3);
t3=maxojox(:,6);
v3=maxojox(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);

% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21

global listae actual vhgenojoizq vhgencabizq maxojo

[tama olvida] = size(listae);
[r y] =size(nonzeros(listae));
if (tama-r) < 2 && get(hObject,'Value') == 1
    warndlg('All data can not be erased', 'WARNING');
    set(hObject,'Value',0);
    return
end

listae(actual) = get(hObject,'Value');
% Recalcular y redibujar resultados
%Dibujar y cálculos de grupo de impulso
[tama olvida] = size(listae);
n = 1;
n2 = 1;
while tama >= n;
    if listae(n) == 0
        vhgenojoizqx(:,n2)=vhgenojoizq(:,n);
        vhgencabizqx(:,n2)=vhgencabizq(:,n);
        maxojox(n2,:)=maxojo(n,:);
        n2=n2+1;
    end
    n = n+1;
end


axes (handles.grupo);
cla;
hold all
plot(vhgenojoizqx,'color',[1 0.5 0]);
plot(vhgencabizqx,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojox(:,2);
v1=maxojox(:,1);
t2=maxojox(:,4);
v2=maxojox(:,3);
t3=maxojox(:,6);
v3=maxojox(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
salida = questdlg('The output file does NOT contains data from your computer or personal data of test records. This file can be used by the NeuralHIT team without any restrictions. You or the owner of the files imported in NeuralHIT will not have any rights to the distribution of files or financial reward for its use or sale. The NeuralHIT team are not responsible for the use you made with the files generated with NeuralHIT. Only if you agree these terms click "YES".', 'Advertisement','YES','No','YES');

if strcmp(salida,'YES')
    [archivo,directorio] = uiputfile('*.nnf','Save neural network data','red.nnf');
    if archivo == 0
        return
    end
    
    global X TAR
    cd (directorio);
    save (archivo,'X','TAR','-mat')
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guarda vhgenojoizq X TAR desord
[a,c]=size(vhgenojoizq);
if c>=10;
    TAR(1,guarda) = 0;
    X(1:150,guarda) = vhgenojoizq(26:175,1);
    X(151:300,guarda) = vhgenojoizq(26:175,2);
    X(301:450,guarda) = vhgenojoizq(26:175,3);
    X(451:600,guarda) = vhgenojoizq(26:175,4);
    X(601:750,guarda) = vhgenojoizq(26:175,5);
    X(751:900,guarda) = vhgenojoizq(26:175,6);
    X(901:1050,guarda) = vhgenojoizq(26:175,7);
    X(1051:1200,guarda) = vhgenojoizq(26:175,8);
    X(1201:1350,guarda) = vhgenojoizq(26:175,9);
    X(1351:1500,guarda) = vhgenojoizq(26:175,10);
    guarda = guarda + 1;
    desord = desord + 1;
    rt = ['Scattered: ' num2str(desord)];
    set (handles.text56,'string',rt);
end



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guarda vhgenojoizq  X TAR ord desord
valor = str2num(get(handles.edit4,'string'));
try
    if valor >=0 && valor <=1;
    end
catch
    msgbox('Only numeric data min = 0 max = 1 decimal separator is "." not comma","', 'INVALID DATA','error');
    return
end

if valor >=0 && valor <=1;
    [a,c]=size(vhgenojoizq);
    if c>=10;
        TAR(1,guarda) = valor;
        X(1:100,guarda) = vhgenojoizq(46:145,1);
        X(101:200,guarda) = vhgenojoizq(46:145,2);
        X(201:300,guarda) = vhgenojoizq(46:145,3);
        X(301:400,guarda) = vhgenojoizq(46:145,4);
        X(401:500,guarda) = vhgenojoizq(46:145,5);
        X(501:600,guarda) = vhgenojoizq(46:145,6);
        X(601:700,guarda) = vhgenojoizq(46:145,7);
        X(701:800,guarda) = vhgenojoizq(46:145,8);
        X(801:900,guarda) = vhgenojoizq(46:145,9);
        X(901:1000,guarda) = vhgenojoizq(46:145,10);
        guarda = guarda + 1;
        if valor >=0.5
            ord = ord + 1;
            rt = ['Gathered: ' num2str(ord)];
            set (handles.text57,'string',rt);
        else
            desord = desord + 1;
            rt = ['Scattered: ' num2str(desord)];
            set (handles.text56,'string',rt);
        end
    end
else
    msgbox('Only numeric data min = 0 max = 1 decimal separator is "." not comma","', 'INVALID DATA','error');
end


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22
global vhgenojoizq X rnp icono
if get(hObject,'Value') == 0
    
    
    [a,c]=size(vhgenojoizq);
    if c>=10;
        X(1:100,1) = vhgenojoizq(46:145,1);
        X(101:200,1) = vhgenojoizq(46:145,2);
        X(201:300,1) = vhgenojoizq(46:145,3);
        X(301:400,1) = vhgenojoizq(46:145,4);
        X(401:500,1) = vhgenojoizq(46:145,5);
        X(501:600,1) = vhgenojoizq(46:145,6);
        X(601:700,1) = vhgenojoizq(46:145,7);
        X(701:800,1) = vhgenojoizq(46:145,8);
        X(801:900,1) = vhgenojoizq(46:145,9);
        X(901:1000,1) = vhgenojoizq(46:145,10);
        Y = rnp(X);
        if Y >= 0.5;
            set(handles.text50,'string','GATHERED')
        else
            set(handles.text50,'string','SCATTERED')
        end
        resp = ['Pattern factor: ' num2str(Y)];
        set(handles.text51,'string',resp);
    else
        set(handles.text50,'string','not enough data');
        set(handles.text51,'string','not enough data');
    end
else
    set (handles.text50,'string','Neural Network OFF');
    set (handles.text51,'string','Neural Network OFF');
end


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global maxojo listae maxcabeza ganac
[list no] = size(maxojo);

if list < 3
    msgbox('Not enought data, select more saccades for exportation', 'ERROR','error');
    return
end

[archivo,directorio] = uiputfile('*.csv','Save data file','resultados.csv');
if archivo == 0
    return
end

ganacb = ganac*0.0001;
cd (directorio);
[a b] = size(listae);
resulta = zeros(a,1);
resulta2 = zeros(a,1);
resulta3 = zeros(a,1);
resulta4 = zeros(a,1);
resulta5 = zeros(a,1);
encabezado = ['a''b''c''d''e''f''g''h''i''j''k''l'];
resulta(1,1) = str2num(get(handles.text35,'string'));
resulta(2,1) = str2num(get(handles.text36,'string'));
resulta(3,1) = str2num(get(handles.text37,'string'));
resulta2(1,1) = str2num(get(handles.text41,'string'));
resulta2(2,1) = str2num(get(handles.text42,'string'));
resulta2(3,1) = str2num(get(handles.text43,'string'));
resulta3(1,1) = str2num(get(handles.text46,'string'));
resulta3(2,1) = str2num(get(handles.text47,'string'));
resulta3(3,1) = str2num(get(handles.text48,'string'));
resulta4(1,1) = str2num(get(handles.text66,'string'));
resulta4(2,1) = str2num(get(handles.text67,'string'));
resulta4(3,1) = str2num(get(handles.text68,'string'));
resulta5(1,1) = str2num(get(handles.text53,'string'));
resulta5(2,1) = str2num(get(handles.text54,'string'));
resulta5(3,1) = str2num(get(handles.text55,'string'));

guardar = [maxcabeza, ganacb, maxojo,listae, resulta, resulta2, resulta3, resulta4, resulta5];
csvwrite (archivo,guardar)
msgbox('Output file is english (EEUU) coded. This languaje must be specified when csv file will be open.', 'WARNING','help');



% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    info
catch
    msgbox('No information to display', 'ERROR','error');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text76.
function text76_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
email = 'HitCal@hotmail.com';
url = ['mailto:',email];
web(url)


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    structure
catch
    msgbox('No information to display', 'ERROR','error');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guarda vhgenojoizq  X TAR
[a,c]=size(vhgenojoizq);
if c>=10;
    TAR(1,guarda) = 1;
    X(1:150,guarda) = vhgenojoizq(26:175,1);
    X(151:300,guarda) = vhgenojoizq(26:175,2);
    X(301:450,guarda) = vhgenojoizq(26:175,3);
    X(451:600,guarda) = vhgenojoizq(26:175,4);
    X(601:750,guarda) = vhgenojoizq(26:175,5);
    X(751:900,guarda) = vhgenojoizq(26:175,6);
    X(901:1050,guarda) = vhgenojoizq(26:175,7);
    X(1051:1200,guarda) = vhgenojoizq(26:175,8);
    X(1201:1350,guarda) = vhgenojoizq(26:175,9);
    X(1351:1500,guarda) = vhgenojoizq(26:175,10);
    guarda = guarda + 1;
end

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guarda vhgenojoizq  X TAR ord
[a,c]=size(vhgenojoizq);
if c>=10;
    TAR(1,guarda) = 0.5;
    X(1:150,guarda) = vhgenojoizq(26:175,1);
    X(151:300,guarda) = vhgenojoizq(26:175,2);
    X(301:450,guarda) = vhgenojoizq(26:175,3);
    X(451:600,guarda) = vhgenojoizq(26:175,4);
    X(601:750,guarda) = vhgenojoizq(26:175,5);
    X(751:900,guarda) = vhgenojoizq(26:175,6);
    X(901:1050,guarda) = vhgenojoizq(26:175,7);
    X(1051:1200,guarda) = vhgenojoizq(26:175,8);
    X(1201:1350,guarda) = vhgenojoizq(26:175,9);
    X(1351:1500,guarda) = vhgenojoizq(26:175,10);
    guarda = guarda + 1;
    ord = ord + 1;
    rt = ['Gathered: ' num2str(ord)];
    set (handles.text57,'string',rt);
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guarda vhgenojoizq X TAR desord
[a,c]=size(vhgenojoizq);
if c>=10;
    TAR(1,guarda) = 0.25;
    X(1:150,guarda) = vhgenojoizq(26:175,1);
    X(151:300,guarda) = vhgenojoizq(26:175,2);
    X(301:450,guarda) = vhgenojoizq(26:175,3);
    X(451:600,guarda) = vhgenojoizq(26:175,4);
    X(601:750,guarda) = vhgenojoizq(26:175,5);
    X(751:900,guarda) = vhgenojoizq(26:175,6);
    X(901:1050,guarda) = vhgenojoizq(26:175,7);
    X(1051:1200,guarda) = vhgenojoizq(26:175,8);
    X(1201:1350,guarda) = vhgenojoizq(26:175,9);
    X(1351:1500,guarda) = vhgenojoizq(26:175,10);
    guarda = guarda + 1;
    desord = desord + 1;
    rt = ['Scattered: ' num2str(desord)];
    set (handles.text56,'string',rt);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual vhgenojoizq vhgencabizq maxojo listae ganac maxcabeza VHITd VHIT VHIT2 VHIT3 VHIT4 VHIT5 VHIT6 VHIT7 VHIT8 VHIT9 VHIT10 VHIT11 VHIT12 tipo tipo2 tipo3 tipo4 tipo5 tipo6 tipo7 tipo8 tipo9 tipo10 tipo11 tipo12 paciente rnp icono

try
    x = xmlread('2.xml');
catch
    msgbox('Error on open file process', 'ERROR','error');
    return
end
%nodo prueba  = 49
%nodo impulso = 77
set(handles.inicio,'string','File processing...');
y = 77;
prueba1 = leer (x,49,y);
prueba2 = leer (x,51,y);
prueba3 = leer (x,53,y);
prueba4 = leer (x,55,y);
prueba5 = leer (x,57,y);
prueba6 = leer (x,59,y);
prueba7 = leer (x,61,y);
prueba8 = leer (x,63,y);
prueba9 = leer (x,65,y);
prueba10 = leer (x,67,y);
prueba11 = leer (x,69,y);
prueba12 = leer (x,71,y);
VHIT = [];
VHIT2 = [];
VHIT3 = [];
VHIT4 = [];
VHIT5 = [];
VHIT6 = [];
VHIT7 = [];
VHIT8 = [];
VHIT9 = [];
VHIT10 = [];
VHIT11 = [];
VHIT12 = [];

if prueba1 == 0;
    msgbox('Not compatible file', 'ERROR','error');
    return
end
if prueba1 == 3;
    msgbox('Language not supported', 'ERROR','error');
    return
end

if prueba1 == 1;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
    if borrado == 0;
        VHIT(:,2) = cabeza;
        VHIT(:,3) = ojo;
        VHIT(1,1) = lado;
        VHIT(2,1) = ganancia;
        VHIT(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,49,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
            if borrado == 0;
                try [a,b] = size(VHIT);
                catch
                    b = 0;
                end
                VHIT(:,(b+2)) = cabeza;
                VHIT(:,(b+3)) = ojo;
                VHIT(1,(b+1)) = lado;
                VHIT(2,(b+1)) = ganancia;
                VHIT(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba2 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
    if borrado == 0;
        VHIT2(:,2) = cabeza;
        VHIT2(:,3) = ojo;
        VHIT2(1,1) = lado;
        VHIT2(2,1) = ganancia;
        VHIT2(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,51,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
            if borrado == 0;
                try [a,b] = size(VHIT2);
                catch
                    b = 0;
                end
                VHIT2(:,(b+2)) = cabeza;
                VHIT2(:,(b+3)) = ojo;
                VHIT2(1,(b+1)) = lado;
                VHIT2(2,(b+1)) = ganancia;
                VHIT2(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba3 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo3] = leer (x,53,y);
    if borrado == 0;
        VHIT3(:,2) = cabeza;
        VHIT3(:,3) = ojo;
        VHIT3(1,1) = lado;
        VHIT3(2,1) = ganancia;
        VHIT3(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,53,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo3] = leer (x,53,y);
            if borrado == 0;
                try [a,b] = size(VHIT3);
                catch
                    b = 0;
                end
                VHIT3(:,(b+2)) = cabeza;
                VHIT3(:,(b+3)) = ojo;
                VHIT3(1,(b+1)) = lado;
                VHIT3(2,(b+1)) = ganancia;
                VHIT3(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba4 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
    if borrado == 0;
        VHIT4(:,2) = cabeza;
        VHIT4(:,3) = ojo;
        VHIT4(1,1) = lado;
        VHIT4(2,1) = ganancia;
        VHIT4(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,55,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
            if borrado == 0;
                try [a,b] = size(VHIT4);
                catch
                    b = 0;
                end
                VHIT4(:,(b+2)) = cabeza;
                VHIT4(:,(b+3)) = ojo;
                VHIT4(1,(b+1)) = lado;
                VHIT4(2,(b+1)) = ganancia;
                VHIT4(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba5 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
    if borrado == 0;
        VHIT5(:,2) = cabeza;
        VHIT5(:,3) = ojo;
        VHIT5(1,1) = lado;
        VHIT5(2,1) = ganancia;
        VHIT5(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,57,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
            if borrado == 0;
                try [a,b] = size(VHIT5);
                catch
                    b = 0;
                end
                VHIT5(:,(b+2)) = cabeza;
                VHIT5(:,(b+3)) = ojo;
                VHIT5(1,(b+1)) = lado;
                VHIT5(2,(b+1)) = ganancia;
                VHIT5(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba6 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
    if borrado == 0;
        VHIT6(:,2) = cabeza;
        VHIT6(:,3) = ojo;
        VHIT6(1,1) = lado;
        VHIT6(2,1) = ganancia;
        VHIT6(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,59,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
            if borrado == 0;
                try [a,b] = size(VHIT6);
                catch
                    b = 0;
                end
                VHIT6(:,(b+2)) = cabeza;
                VHIT6(:,(b+3)) = ojo;
                VHIT6(1,(b+1)) = lado;
                VHIT6(2,(b+1)) = ganancia;
                VHIT6(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba7 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
    if borrado == 0;
        VHIT7(:,2) = cabeza;
        VHIT7(:,3) = ojo;
        VHIT7(1,1) = lado;
        VHIT7(2,1) = ganancia;
        VHIT7(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,61,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
            if borrado == 0;
                try [a,b] = size(VHIT7);
                catch
                    b = 0;
                end
                VHIT7(:,(b+2)) = cabeza;
                VHIT7(:,(b+3)) = ojo;
                VHIT7(1,(b+1)) = lado;
                VHIT7(2,(b+1)) = ganancia;
                VHIT7(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba8 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
    if borrado == 0;
        VHIT8(:,2) = cabeza;
        VHIT8(:,3) = ojo;
        VHIT8(1,1) = lado;
        VHIT8(2,1) = ganancia;
        VHIT8(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,63,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
            if borrado == 0;
                try [a,b] = size(VHIT8);
                catch
                    b = 0;
                end
                VHIT8(:,(b+2)) = cabeza;
                VHIT8(:,(b+3)) = ojo;
                VHIT8(1,(b+1)) = lado;
                VHIT8(2,(b+1)) = ganancia;
                VHIT8(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba9 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo9] = leer (x,65,y);
    if borrado == 0;
        VHIT9(:,2) = cabeza;
        VHIT9(:,3) = ojo;
        VHIT9(1,1) = lado;
        VHIT9(2,1) = ganancia;
        VHIT9(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,65,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo9] = leer (x,65,y);
            if borrado == 0;
                try [a,b] = size(VHIT9);
                catch
                    b = 0;
                end
                VHIT9(:,(b+2)) = cabeza;
                VHIT9(:,(b+3)) = ojo;
                VHIT9(1,(b+1)) = lado;
                VHIT9(2,(b+1)) = ganancia;
                VHIT9(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba10 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
    if borrado == 0;
        VHIT10(:,2) = cabeza;
        VHIT10(:,3) = ojo;
        VHIT10(1,1) = lado;
        VHIT10(2,1) = ganancia;
        VHIT10(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,67,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
            if borrado == 0;
                try [a,b] = size(VHIT10);
                catch
                    b = 0;
                end
                VHIT10(:,(b+2)) = cabeza;
                VHIT10(:,(b+3)) = ojo;
                VHIT10(1,(b+1)) = lado;
                VHIT10(2,(b+1)) = ganancia;
                VHIT10(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba11 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
    if borrado == 0;
        VHIT11(:,2) = cabeza;
        VHIT11(:,3) = ojo;
        VHIT11(1,1) = lado;
        VHIT11(2,1) = ganancia;
        VHIT11(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,69,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
            if borrado == 0;
                try [a,b] = size(VHIT11);
                catch
                    b = 0;
                end
                VHIT11(:,(b+2)) = cabeza;
                VHIT11(:,(b+3)) = ojo;
                VHIT11(1,(b+1)) = lado;
                VHIT11(2,(b+1)) = ganancia;
                VHIT11(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba12 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
    if borrado == 0;
        VHIT12(:,2) = cabeza;
        VHIT12(:,3) = ojo;
        VHIT12(1,1) = lado;
        VHIT12(2,1) = ganancia;
        VHIT12(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,71,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
            if borrado == 0;
                try [a,b] = size(VHIT12);
                catch
                    b = 0;
                end
                VHIT12(:,(b+2)) = cabeza;
                VHIT12(:,(b+3)) = ojo;
                VHIT12(1,(b+1)) = lado;
                VHIT12(2,(b+1)) = ganancia;
                VHIT12(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


%SECUENCIA DE INICIO ORIGINAL (PRUEBA 1 LADO 1 IMPULSO 1)
VHITd = VHIT;
actual = 1;
paciente = ['Name: ' nombre ' ' apellido];
set(handles.text3,'string',paciente);
tipoprueba = ['Test plane: ' tipo];
set(handles.text19,'string',tipoprueba);
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',1);
vhgencabizq = [];
vhgenojoizq = [];
maxojo = [];
listae = [];
ganac = [];
maxcabeza = [];
n=1;
n2=1;
n3=1;
[a,c]=size(VHITd);
while n < c
    if VHITd(1,n) == 1
        vhgencabizq (:,n2) = VHITd(:,n+1);
        vhgenojoizq (:,n2) = VHITd(:,n+2);
        ganac (n2,1) = VHITd(2,n3);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end

n = 1;
while n <= size(vhgencabizq);
    [h,i] = max(vhgencabizq(:,n));
    maxcabeza(n,[1 2]) = [h i];
    n=n+1;
end


n = 1;

%busqueda de los tres maximos en ojos a intervalos fijos
%SERIA BUENO añadir condicion, si lo vas a marcar comprueba que la
%velocidad del maximo es sensiblemente (40?) superior a la del reflejo
%(dato de la ganancia?)
while n <= size(vhgenojoizq);
    
    [h,i] = max(vhgenojoizq(45:95,n));
    
    gancor = ganac(n);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        pgan = gancor*0.0001;
    else
        pgan = gancor*0.0001;
    end
    
    if h > 100
        pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
        pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
        % pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
        %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
        %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
        %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
        
        if pend1<0&&pend2<0
            if pgan < 0.6
                maxojo(n,[1 2]) = [h i];
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 220
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
            %NUEVO
            if h > 15 + max(vhgenojoizq(20:38+i,n));
                maxojo(n,[1 2]) = [h i];
            end
        end
    else
        maxojo(n,[1 2]) = [0 0];
    end
    
    %NUEVO
    if maxojo(n,1) == 0;
        [hr,ir] = max(vhgenojoizq(65:95,n));
        if hr > 125
            maxojo(n,[1 2]) = [hr (ir+20)];
        end
    end
    
    [h,i] = max(vhgenojoizq(96:135,n));
    if h > 50
        maxojo(n,[3 4]) = [h i];
    else
        maxojo(n,[3 4]) = [0 0];
    end
    [h,i] = max(vhgenojoizq(136:175,n));
    if h > 50
        maxojo(n,[5 6]) = [h i];
    else
        maxojo(n,[5 6]) = [0 0];
    end
    n=n+1;
end

%Dibujo impulso original
gana = num2str(mean(ganac)/10000,4);
gantex = ['Gain: ' gana ' '];
set(handles.text7,'string',gantex);

% DIBUJO Y DATOS UN IMPULSO

%OJO siguiente linea no siempre ?
set(handles.checkbox21,'Value',0);

gancor = ganac(actual);
[desp tam] =size(num2str(gancor));
if tam == 5;
    gancor = gancor*0.0001;
else
    gancor = gancor*0.0001;
end

gancor2 = ['Gain: ' num2str(gancor) ' '];
set(handles.text31,'string',gancor2);

axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);

%ylim ([-75 350])

set (handles.text30,'string',maxcabeza(actual,2));
set (handles.text29,'string',round(maxcabeza(actual,1)));

if maxojo(actual,1) > 0
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',(maxojo(actual,2))+44);
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
else
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',maxojo(actual,2));
    
end

if maxojo(actual,3) > 0
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',(maxojo(actual,4))+95);
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
else
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',maxojo(actual,4));
end
if maxojo(actual,5) > 0
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',(maxojo(actual,6))+135);
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
else
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',maxojo(actual,6));
end
%no copiar en otras funciones
inutila=size(ganac);
inutil = inutila(1);
listae= zeros(inutil,1);
[tam,nulo] = size(listae);
posg = [num2str(actual) '/' num2str(tam)];
set(handles.text10,'string',posg);

%Dibujar y cálculos de grupo de impulso

n=1;
n2=1;
n3=1;
[a,c]=size(vhgencabizq);
while n < c
    if listae(n) == 1
        vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
        vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end
axes (handles.grupo);
cla;
hold all
plot(vhgenojoizq,'color',[1 0.5 0]);
plot(vhgencabizq,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojo(:,2);
v1=maxojo(:,1);
t2=maxojo(:,4);
v2=maxojo(:,3);
t3=maxojo(:,6);
v3=maxojo(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);
%RED NEURAL 10 ELMENTOS
a = [];
b = [];
c = [];
tam = [];
lmaxvalojor = [];
lmaxposojor = [];
lmaxvalojo = [];
lmaxposojo = [];
sens = 12;
sens2 = 35;
vhgenojoizqf = [];
vhgencabizqf = [];


vhgenojoizqf = low(vhgenojoizq);
vhgencabizqf = low(vhgencabizq);
[a,c]=size(vhgenojoizqf);



for  a = 1 : 1 : c
    
    [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
    [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
    [b,c] = size(lmaxvalojor);
    
    if b > 0
        if lmaxposojor(1) < (lmaxposcab(1)+10)
            
            lmaxposojor(1) = [];
            lmaxvalojor(1) = [];
            b = b-1;
        end
        lmaxvalojo(1:b,a) = lmaxvalojor;
        lmaxposojo(1:b,a) = lmaxposojor;
    end
end

[a,b] = size (lmaxposojo);
out = [];
if a > 0
    for p = 1:1:b
        
        if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
            out = horzcat(out,p);
        end
    end
    [r,s] = size(out);
    
    if s >0 && s<=2
        %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
        if s == 1
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(1))=[];
            lmaxvalojo(:,out(1))=[];
        else
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(2));
            lmaxposojo(:,out(1))=[];
            try lmaxposojo(:,out(2))=[];
            end
            lmaxvalojo(:,out(1))=[];
            try lmaxvalojo(:,out(2))=[];
            end
        end
    end
end
[tam,impuls] = size(lmaxposojo);


axes (handles.todos);
cla;
hold all
plot(vhgenojoizqf,'color',[1 0.5 0]);
if get(handles.popupmenu2,'Value') == 1
    plot(vhgencabizqf,'color','blue');
else
    plot(vhgencabizqf,'color','red');
end
xlim ([0 175]);
ylim ([-75 350]);
axis off;

axes (handles.s1)
plot(1,1,'kx')
axis off
axes (handles.s2)
plot(1,1,'k*')
axis off
axes (handles.s3)
plot(1,1,'k+')
axis off
axes (handles.s4)
plot(1,1,'ko')
axis off
axes (handles.todos)

for p=1:1:impuls
    if tam > 0
        x = lmaxposojo(1,:);
        y = lmaxvalojo(1,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'kx')
        
    end
    if tam > 1
        x = lmaxposojo(2,:);
        y = lmaxvalojo(2,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k*')
    end
    if tam > 2
        x = lmaxposojo(3,:);
        y = lmaxvalojo(3,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k+')
        
    end
    if tam > 3
        x = lmaxposojo(4,:);
        y = lmaxvalojo(4,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'ko')
        
    end
    
end
pr1 = 0;
pr2 = 0;
pr3 = 0;
pr4 = 0;

if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    pr1 = (std(x)/mean(x))*100;
end
if tam > 1
    x = lmaxposojo(2,:)*100;
    x(x==0) = [];
    pr2 = (std(x)/mean(x))*100;
end
if tam > 2
    x = lmaxposojo(3,:);
    x(x==0) = [];
    pr3 = (std(x)/mean(x))*100;
end
if tam > 3
    x = lmaxposojo(4,:);
    x(x==0) = [];
    pr4 = (std(x)/mean(x))*100;
end
if isnan(pr1)
    pr1 = 0;
end
if isnan(pr2)
    pr2 = 0;
end
if isnan(pr3)
    pr3 = 0;
end
if isnan(pr4)
    pr4 = 0;
end

set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);

if pr1 <= sens
    if pr2 >= sens2
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    else
        set(handles.text51,'string','GATHERED');
        set(handles.text51,'ForegroundColor',[0 0.9 0]);
    end
end
if pr1 > sens
    set(handles.text51,'string','SCATTERED');
    set(handles.text51,'ForegroundColor',[0.9 0 0]);
end

if isempty (lmaxposojo)
    set(handles.text51,'string','NORMAL');
    set(handles.text51,'ForegroundColor',[0 0 0]);
else
    xu = lmaxposojo(1,:);
    xu(xu==0) = [];
    if size (xu) <4
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    end
end
impuls;
if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    [tam2,impuls2] = size(x);
    ind = 1-(impuls2 / impuls);
else
    ind = 0;
end

prg = 2.5*(0.8*pr1+0.2*pr2);

if prg > 35
    prg = prg -(30*ind);
end
if prg > 100
    prg = 100;
end
set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])

%FIN RED
set(handles.inicio,'string','Wellcome to HitCal: Import XML file to start.');
set(handles.inicio,'visible','off')
set (handles.Untitled_5,'enable','on')

% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual vhgenojoizq vhgencabizq maxojo listae ganac maxcabeza VHITd VHIT VHIT2 VHIT3 VHIT4 VHIT5 VHIT6 VHIT7 VHIT8 VHIT9 VHIT10 VHIT11 VHIT12 tipo tipo2 tipo3 tipo4 tipo5 tipo6 tipo7 tipo8 tipo9 tipo10 tipo11 tipo12 paciente rnp icono

try
    x = xmlread('1.xml');
catch
    msgbox('Error on open file process', 'ERROR','error');
    return
end
%nodo prueba  = 49
%nodo impulso = 77
set(handles.inicio,'string','File processing...');
y = 77;
prueba1 = leer (x,49,y);
prueba2 = leer (x,51,y);
prueba3 = leer (x,53,y);
prueba4 = leer (x,55,y);
prueba5 = leer (x,57,y);
prueba6 = leer (x,59,y);
prueba7 = leer (x,61,y);
prueba8 = leer (x,63,y);
prueba9 = leer (x,65,y);
prueba10 = leer (x,67,y);
prueba11 = leer (x,69,y);
prueba12 = leer (x,71,y);
VHIT = [];
VHIT2 = [];
VHIT3 = [];
VHIT4 = [];
VHIT5 = [];
VHIT6 = [];
VHIT7 = [];
VHIT8 = [];
VHIT9 = [];
VHIT10 = [];
VHIT11 = [];
VHIT12 = [];

if prueba1 == 0;
    msgbox('Not compatible file', 'ERROR','error');
    return
end
if prueba1 == 3;
    msgbox('Language not supported', 'ERROR','error');
    return
end

if prueba1 == 1;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
    if borrado == 0;
        VHIT(:,2) = cabeza;
        VHIT(:,3) = ojo;
        VHIT(1,1) = lado;
        VHIT(2,1) = ganancia;
        VHIT(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,49,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
            if borrado == 0;
                try [a,b] = size(VHIT);
                catch
                    b = 0;
                end
                VHIT(:,(b+2)) = cabeza;
                VHIT(:,(b+3)) = ojo;
                VHIT(1,(b+1)) = lado;
                VHIT(2,(b+1)) = ganancia;
                VHIT(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba2 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
    if borrado == 0;
        VHIT2(:,2) = cabeza;
        VHIT2(:,3) = ojo;
        VHIT2(1,1) = lado;
        VHIT2(2,1) = ganancia;
        VHIT2(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,51,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
            if borrado == 0;
                try [a,b] = size(VHIT2);
                catch
                    b = 0;
                end
                VHIT2(:,(b+2)) = cabeza;
                VHIT2(:,(b+3)) = ojo;
                VHIT2(1,(b+1)) = lado;
                VHIT2(2,(b+1)) = ganancia;
                VHIT2(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba3 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo3] = leer (x,53,y);
    if borrado == 0;
        VHIT3(:,2) = cabeza;
        VHIT3(:,3) = ojo;
        VHIT3(1,1) = lado;
        VHIT3(2,1) = ganancia;
        VHIT3(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,53,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo3] = leer (x,53,y);
            if borrado == 0;
                try [a,b] = size(VHIT3);
                catch
                    b = 0;
                end
                VHIT3(:,(b+2)) = cabeza;
                VHIT3(:,(b+3)) = ojo;
                VHIT3(1,(b+1)) = lado;
                VHIT3(2,(b+1)) = ganancia;
                VHIT3(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba4 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
    if borrado == 0;
        VHIT4(:,2) = cabeza;
        VHIT4(:,3) = ojo;
        VHIT4(1,1) = lado;
        VHIT4(2,1) = ganancia;
        VHIT4(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,55,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
            if borrado == 0;
                try [a,b] = size(VHIT4);
                catch
                    b = 0;
                end
                VHIT4(:,(b+2)) = cabeza;
                VHIT4(:,(b+3)) = ojo;
                VHIT4(1,(b+1)) = lado;
                VHIT4(2,(b+1)) = ganancia;
                VHIT4(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba5 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
    if borrado == 0;
        VHIT5(:,2) = cabeza;
        VHIT5(:,3) = ojo;
        VHIT5(1,1) = lado;
        VHIT5(2,1) = ganancia;
        VHIT5(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,57,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
            if borrado == 0;
                try [a,b] = size(VHIT5);
                catch
                    b = 0;
                end
                VHIT5(:,(b+2)) = cabeza;
                VHIT5(:,(b+3)) = ojo;
                VHIT5(1,(b+1)) = lado;
                VHIT5(2,(b+1)) = ganancia;
                VHIT5(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba6 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
    if borrado == 0;
        VHIT6(:,2) = cabeza;
        VHIT6(:,3) = ojo;
        VHIT6(1,1) = lado;
        VHIT6(2,1) = ganancia;
        VHIT6(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,59,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
            if borrado == 0;
                try [a,b] = size(VHIT6);
                catch
                    b = 0;
                end
                VHIT6(:,(b+2)) = cabeza;
                VHIT6(:,(b+3)) = ojo;
                VHIT6(1,(b+1)) = lado;
                VHIT6(2,(b+1)) = ganancia;
                VHIT6(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba7 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
    if borrado == 0;
        VHIT7(:,2) = cabeza;
        VHIT7(:,3) = ojo;
        VHIT7(1,1) = lado;
        VHIT7(2,1) = ganancia;
        VHIT7(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,61,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
            if borrado == 0;
                try [a,b] = size(VHIT7);
                catch
                    b = 0;
                end
                VHIT7(:,(b+2)) = cabeza;
                VHIT7(:,(b+3)) = ojo;
                VHIT7(1,(b+1)) = lado;
                VHIT7(2,(b+1)) = ganancia;
                VHIT7(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba8 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
    if borrado == 0;
        VHIT8(:,2) = cabeza;
        VHIT8(:,3) = ojo;
        VHIT8(1,1) = lado;
        VHIT8(2,1) = ganancia;
        VHIT8(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,63,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
            if borrado == 0;
                try [a,b] = size(VHIT8);
                catch
                    b = 0;
                end
                VHIT8(:,(b+2)) = cabeza;
                VHIT8(:,(b+3)) = ojo;
                VHIT8(1,(b+1)) = lado;
                VHIT8(2,(b+1)) = ganancia;
                VHIT8(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba9 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo9] = leer (x,65,y);
    if borrado == 0;
        VHIT9(:,2) = cabeza;
        VHIT9(:,3) = ojo;
        VHIT9(1,1) = lado;
        VHIT9(2,1) = ganancia;
        VHIT9(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,65,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo9] = leer (x,65,y);
            if borrado == 0;
                try [a,b] = size(VHIT9);
                catch
                    b = 0;
                end
                VHIT9(:,(b+2)) = cabeza;
                VHIT9(:,(b+3)) = ojo;
                VHIT9(1,(b+1)) = lado;
                VHIT9(2,(b+1)) = ganancia;
                VHIT9(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba10 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
    if borrado == 0;
        VHIT10(:,2) = cabeza;
        VHIT10(:,3) = ojo;
        VHIT10(1,1) = lado;
        VHIT10(2,1) = ganancia;
        VHIT10(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,67,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
            if borrado == 0;
                try [a,b] = size(VHIT10);
                catch
                    b = 0;
                end
                VHIT10(:,(b+2)) = cabeza;
                VHIT10(:,(b+3)) = ojo;
                VHIT10(1,(b+1)) = lado;
                VHIT10(2,(b+1)) = ganancia;
                VHIT10(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba11 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
    if borrado == 0;
        VHIT11(:,2) = cabeza;
        VHIT11(:,3) = ojo;
        VHIT11(1,1) = lado;
        VHIT11(2,1) = ganancia;
        VHIT11(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,69,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
            if borrado == 0;
                try [a,b] = size(VHIT11);
                catch
                    b = 0;
                end
                VHIT11(:,(b+2)) = cabeza;
                VHIT11(:,(b+3)) = ojo;
                VHIT11(1,(b+1)) = lado;
                VHIT11(2,(b+1)) = ganancia;
                VHIT11(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba12 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
    if borrado == 0;
        VHIT12(:,2) = cabeza;
        VHIT12(:,3) = ojo;
        VHIT12(1,1) = lado;
        VHIT12(2,1) = ganancia;
        VHIT12(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,71,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
            if borrado == 0;
                try [a,b] = size(VHIT12);
                catch
                    b = 0;
                end
                VHIT12(:,(b+2)) = cabeza;
                VHIT12(:,(b+3)) = ojo;
                VHIT12(1,(b+1)) = lado;
                VHIT12(2,(b+1)) = ganancia;
                VHIT12(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


%SECUENCIA DE INICIO ORIGINAL (PRUEBA 1 LADO 1 IMPULSO 1)
VHITd = VHIT;
actual = 1;
paciente = ['Name: ' nombre ' ' apellido];
set(handles.text3,'string',paciente);
tipoprueba = ['Test plane: ' tipo];
set(handles.text19,'string',tipoprueba);
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',1);
vhgencabizq = [];
vhgenojoizq = [];
maxojo = [];
listae = [];
ganac = [];
maxcabeza = [];
n=1;
n2=1;
n3=1;
[a,c]=size(VHITd);
while n < c
    if VHITd(1,n) == 1
        vhgencabizq (:,n2) = VHITd(:,n+1);
        vhgenojoizq (:,n2) = VHITd(:,n+2);
        ganac (n2,1) = VHITd(2,n3);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end

n = 1;
while n <= size(vhgencabizq);
    [h,i] = max(vhgencabizq(:,n));
    maxcabeza(n,[1 2]) = [h i];
    n=n+1;
end


n = 1;

%busqueda de los tres maximos en ojos a intervalos fijos
%SERIA BUENO añadir condicion, si lo vas a marcar comprueba que la
%velocidad del maximo es sensiblemente (40?) superior a la del reflejo
%(dato de la ganancia?)
while n <= size(vhgenojoizq);
    
    [h,i] = max(vhgenojoizq(45:95,n));
    
    gancor = ganac(n);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        pgan = gancor*0.0001;
    else
        pgan = gancor*0.0001;
    end
    
    if h > 100
        pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
        pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
        % pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
        %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
        %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
        %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
        
        if pend1<0&&pend2<0
            if pgan < 0.6
                maxojo(n,[1 2]) = [h i];
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 220
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
            %NUEVO
            if h > 15 + max(vhgenojoizq(20:38+i,n));
                maxojo(n,[1 2]) = [h i];
            end
        end
    else
        maxojo(n,[1 2]) = [0 0];
    end
    
    %NUEVO
    if maxojo(n,1) == 0;
        [hr,ir] = max(vhgenojoizq(65:95,n));
        if hr > 125
            maxojo(n,[1 2]) = [hr (ir+20)];
        end
    end
    
    [h,i] = max(vhgenojoizq(96:135,n));
    if h > 50
        maxojo(n,[3 4]) = [h i];
    else
        maxojo(n,[3 4]) = [0 0];
    end
    [h,i] = max(vhgenojoizq(136:175,n));
    if h > 50
        maxojo(n,[5 6]) = [h i];
    else
        maxojo(n,[5 6]) = [0 0];
    end
    n=n+1;
end

%Dibujo impulso original
gana = num2str(mean(ganac)/10000,4);
gantex = ['Gain: ' gana ' '];
set(handles.text7,'string',gantex);

% DIBUJO Y DATOS UN IMPULSO

%OJO siguiente linea no siempre ?
set(handles.checkbox21,'Value',0);

gancor = ganac(actual);
[desp tam] =size(num2str(gancor));
if tam == 5;
    gancor = gancor*0.0001;
else
    gancor = gancor*0.0001;
end

gancor2 = ['Gain: ' num2str(gancor) ' '];
set(handles.text31,'string',gancor2);

axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);

%ylim ([-75 350])

set (handles.text30,'string',maxcabeza(actual,2));
set (handles.text29,'string',round(maxcabeza(actual,1)));

if maxojo(actual,1) > 0
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',(maxojo(actual,2))+44);
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
else
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',maxojo(actual,2));
    
end

if maxojo(actual,3) > 0
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',(maxojo(actual,4))+95);
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
else
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',maxojo(actual,4));
end
if maxojo(actual,5) > 0
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',(maxojo(actual,6))+135);
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
else
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',maxojo(actual,6));
end
%no copiar en otras funciones
inutila=size(ganac);
inutil = inutila(1);
listae= zeros(inutil,1);
[tam,nulo] = size(listae);
posg = [num2str(actual) '/' num2str(tam)];
set(handles.text10,'string',posg);

%Dibujar y cálculos de grupo de impulso

n=1;
n2=1;
n3=1;
[a,c]=size(vhgencabizq);
while n < c
    if listae(n) == 1
        vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
        vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end
axes (handles.grupo);
cla;
hold all
plot(vhgenojoizq,'color',[1 0.5 0]);
plot(vhgencabizq,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojo(:,2);
v1=maxojo(:,1);
t2=maxojo(:,4);
v2=maxojo(:,3);
t3=maxojo(:,6);
v3=maxojo(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);
%RED NEURAL 10 ELMENTOS
a = [];
b = [];
c = [];
tam = [];
lmaxvalojor = [];
lmaxposojor = [];
lmaxvalojo = [];
lmaxposojo = [];
sens = 12;
sens2 = 35;
vhgenojoizqf = [];
vhgencabizqf = [];


vhgenojoizqf = low(vhgenojoizq);
vhgencabizqf = low(vhgencabizq);
[a,c]=size(vhgenojoizqf);



for  a = 1 : 1 : c
    
    [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
    [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
    [b,c] = size(lmaxvalojor);
    
    if b > 0
        if lmaxposojor(1) < (lmaxposcab(1)+10)
            
            lmaxposojor(1) = [];
            lmaxvalojor(1) = [];
            b = b-1;
        end
        lmaxvalojo(1:b,a) = lmaxvalojor;
        lmaxposojo(1:b,a) = lmaxposojor;
    end
end

[a,b] = size (lmaxposojo);
out = [];
if a > 0
    for p = 1:1:b
        
        if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
            out = horzcat(out,p);
        end
    end
    [r,s] = size(out);
    
    if s >0 && s<=2
        %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
        if s == 1
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(1))=[];
            lmaxvalojo(:,out(1))=[];
        else
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(2));
            lmaxposojo(:,out(1))=[];
            try lmaxposojo(:,out(2))=[];
            end
            lmaxvalojo(:,out(1))=[];
            try lmaxvalojo(:,out(2))=[];
            end
        end
    end
end
[tam,impuls] = size(lmaxposojo);


axes (handles.todos);
cla;
hold all
plot(vhgenojoizqf,'color',[1 0.5 0]);
if get(handles.popupmenu2,'Value') == 1
    plot(vhgencabizqf,'color','blue');
else
    plot(vhgencabizqf,'color','red');
end
xlim ([0 175]);
ylim ([-75 350]);
axis off;

axes (handles.s1)
plot(1,1,'kx')
axis off
axes (handles.s2)
plot(1,1,'k*')
axis off
axes (handles.s3)
plot(1,1,'k+')
axis off
axes (handles.s4)
plot(1,1,'ko')
axis off
axes (handles.todos)

for p=1:1:impuls
    if tam > 0
        x = lmaxposojo(1,:);
        y = lmaxvalojo(1,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'kx')
        
    end
    if tam > 1
        x = lmaxposojo(2,:);
        y = lmaxvalojo(2,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k*')
    end
    if tam > 2
        x = lmaxposojo(3,:);
        y = lmaxvalojo(3,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k+')
        
    end
    if tam > 3
        x = lmaxposojo(4,:);
        y = lmaxvalojo(4,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'ko')
        
    end
    
end
pr1 = 0;
pr2 = 0;
pr3 = 0;
pr4 = 0;

if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    pr1 = (std(x)/mean(x))*100;
end
if tam > 1
    x = lmaxposojo(2,:)*100;
    x(x==0) = [];
    pr2 = (std(x)/mean(x))*100;
end
if tam > 2
    x = lmaxposojo(3,:);
    x(x==0) = [];
    pr3 = (std(x)/mean(x))*100;
end
if tam > 3
    x = lmaxposojo(4,:);
    x(x==0) = [];
    pr4 = (std(x)/mean(x))*100;
end

if isnan(pr1)
    pr1 = 0;
end
if isnan(pr2)
    pr2 = 0;
end
if isnan(pr3)
    pr3 = 0;
end
if isnan(pr4)
    pr4 = 0;
end

if isnan(pr1)
    pr1 = 0;
end
if isnan(pr2)
    pr2 = 0;
end
if isnan(pr3)
    pr3 = 0;
end
if isnan(pr4)
    pr4 = 0;
end

set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);

if pr1 <= sens
    if pr2 >= sens2
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    else
        set(handles.text51,'string','GATHERED');
        set(handles.text51,'ForegroundColor',[0 0.9 0]);
    end
end
if pr1 > sens
    set(handles.text51,'string','SCATTERED');
    set(handles.text51,'ForegroundColor',[0.9 0 0]);
end

if isempty (lmaxposojo)
    set(handles.text51,'string','NORMAL');
    set(handles.text51,'ForegroundColor',[0 0 0]);
else
    xu = lmaxposojo(1,:);
    xu(xu==0) = [];
    if size (xu) <4
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    end
end
impuls;
if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    [tam2,impuls2] = size(x);
    ind = 1-(impuls2 / impuls);
else
    ind = 0;
end

prg = 2.5*(0.8*pr1+0.2*pr2);

if prg > 35
    prg = prg -(30*ind);
end
if prg > 100
    prg = 100;
end
set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])

%FIN RED
set(handles.inicio,'string','Wellcome to HitCal: Import XML file to start.');
set(handles.inicio,'visible','off')
set (handles.Untitled_5,'enable','on')

% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actual vhgenojoizq vhgencabizq maxojo listae ganac maxcabeza VHITd VHIT VHIT2 VHIT3 VHIT4 VHIT5 VHIT6 VHIT7 VHIT8 VHIT9 VHIT10 VHIT11 VHIT12 tipo tipo2 tipo3 tipo4 tipo5 tipo6 tipo7 tipo8 tipo9 tipo10 tipo11 tipo12 paciente rnp icono

try
    x = xmlread('3.xml');
catch
    msgbox('Error on open file process', 'ERROR','error');
    return
end
%nodo prueba  = 49
%nodo impulso = 77
set(handles.inicio,'string','File processing...');
y = 77;
prueba1 = leer (x,49,y);
prueba2 = leer (x,51,y);
prueba3 = leer (x,53,y);
prueba4 = leer (x,55,y);
prueba5 = leer (x,57,y);
prueba6 = leer (x,59,y);
prueba7 = leer (x,61,y);
prueba8 = leer (x,63,y);
prueba9 = leer (x,65,y);
prueba10 = leer (x,67,y);
prueba11 = leer (x,69,y);
prueba12 = leer (x,71,y);
VHIT = [];
VHIT2 = [];
VHIT3 = [];
VHIT4 = [];
VHIT5 = [];
VHIT6 = [];
VHIT7 = [];
VHIT8 = [];
VHIT9 = [];
VHIT10 = [];
VHIT11 = [];
VHIT12 = [];

if prueba1 == 0;
    msgbox('Not compatible file', 'ERROR','error');
    return
end
if prueba1 == 3;
    msgbox('Language not supported', 'ERROR','error');
    return
end

if prueba1 == 1;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
    if borrado == 0;
        VHIT(:,2) = cabeza;
        VHIT(:,3) = ojo;
        VHIT(1,1) = lado;
        VHIT(2,1) = ganancia;
        VHIT(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,49,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer (x,49,y);
            if borrado == 0;
                try [a,b] = size(VHIT);
                catch
                    b = 0;
                end
                VHIT(:,(b+2)) = cabeza;
                VHIT(:,(b+3)) = ojo;
                VHIT(1,(b+1)) = lado;
                VHIT(2,(b+1)) = ganancia;
                VHIT(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba2 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
    if borrado == 0;
        VHIT2(:,2) = cabeza;
        VHIT2(:,3) = ojo;
        VHIT2(1,1) = lado;
        VHIT2(2,1) = ganancia;
        VHIT2(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,51,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo2] = leer (x,51,y);
            if borrado == 0;
                try [a,b] = size(VHIT2);
                catch
                    b = 0;
                end
                VHIT2(:,(b+2)) = cabeza;
                VHIT2(:,(b+3)) = ojo;
                VHIT2(1,(b+1)) = lado;
                VHIT2(2,(b+1)) = ganancia;
                VHIT2(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba3 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo3] = leer (x,53,y);
    if borrado == 0;
        VHIT3(:,2) = cabeza;
        VHIT3(:,3) = ojo;
        VHIT3(1,1) = lado;
        VHIT3(2,1) = ganancia;
        VHIT3(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,53,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo3] = leer (x,53,y);
            if borrado == 0;
                try [a,b] = size(VHIT3);
                catch
                    b = 0;
                end
                VHIT3(:,(b+2)) = cabeza;
                VHIT3(:,(b+3)) = ojo;
                VHIT3(1,(b+1)) = lado;
                VHIT3(2,(b+1)) = ganancia;
                VHIT3(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba4 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
    if borrado == 0;
        VHIT4(:,2) = cabeza;
        VHIT4(:,3) = ojo;
        VHIT4(1,1) = lado;
        VHIT4(2,1) = ganancia;
        VHIT4(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,55,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo4] = leer (x,55,y);
            if borrado == 0;
                try [a,b] = size(VHIT4);
                catch
                    b = 0;
                end
                VHIT4(:,(b+2)) = cabeza;
                VHIT4(:,(b+3)) = ojo;
                VHIT4(1,(b+1)) = lado;
                VHIT4(2,(b+1)) = ganancia;
                VHIT4(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba5 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
    if borrado == 0;
        VHIT5(:,2) = cabeza;
        VHIT5(:,3) = ojo;
        VHIT5(1,1) = lado;
        VHIT5(2,1) = ganancia;
        VHIT5(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,57,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo5] = leer (x,57,y);
            if borrado == 0;
                try [a,b] = size(VHIT5);
                catch
                    b = 0;
                end
                VHIT5(:,(b+2)) = cabeza;
                VHIT5(:,(b+3)) = ojo;
                VHIT5(1,(b+1)) = lado;
                VHIT5(2,(b+1)) = ganancia;
                VHIT5(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba6 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
    if borrado == 0;
        VHIT6(:,2) = cabeza;
        VHIT6(:,3) = ojo;
        VHIT6(1,1) = lado;
        VHIT6(2,1) = ganancia;
        VHIT6(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,59,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo6] = leer (x,59,y);
            if borrado == 0;
                try [a,b] = size(VHIT6);
                catch
                    b = 0;
                end
                VHIT6(:,(b+2)) = cabeza;
                VHIT6(:,(b+3)) = ojo;
                VHIT6(1,(b+1)) = lado;
                VHIT6(2,(b+1)) = ganancia;
                VHIT6(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba7 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
    if borrado == 0;
        VHIT7(:,2) = cabeza;
        VHIT7(:,3) = ojo;
        VHIT7(1,1) = lado;
        VHIT7(2,1) = ganancia;
        VHIT7(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,61,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo7] = leer (x,61,y);
            if borrado == 0;
                try [a,b] = size(VHIT7);
                catch
                    b = 0;
                end
                VHIT7(:,(b+2)) = cabeza;
                VHIT7(:,(b+3)) = ojo;
                VHIT7(1,(b+1)) = lado;
                VHIT7(2,(b+1)) = ganancia;
                VHIT7(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


if prueba8 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
    if borrado == 0;
        VHIT8(:,2) = cabeza;
        VHIT8(:,3) = ojo;
        VHIT8(1,1) = lado;
        VHIT8(2,1) = ganancia;
        VHIT8(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,63,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo8] = leer (x,63,y);
            if borrado == 0;
                try [a,b] = size(VHIT8);
                catch
                    b = 0;
                end
                VHIT8(:,(b+2)) = cabeza;
                VHIT8(:,(b+3)) = ojo;
                VHIT8(1,(b+1)) = lado;
                VHIT8(2,(b+1)) = ganancia;
                VHIT8(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba9 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo9] = leer (x,65,y);
    if borrado == 0;
        VHIT9(:,2) = cabeza;
        VHIT9(:,3) = ojo;
        VHIT9(1,1) = lado;
        VHIT9(2,1) = ganancia;
        VHIT9(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,65,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado,tipo9] = leer (x,65,y);
            if borrado == 0;
                try [a,b] = size(VHIT9);
                catch
                    b = 0;
                end
                VHIT9(:,(b+2)) = cabeza;
                VHIT9(:,(b+3)) = ojo;
                VHIT9(1,(b+1)) = lado;
                VHIT9(2,(b+1)) = ganancia;
                VHIT9(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba10 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
    if borrado == 0;
        VHIT10(:,2) = cabeza;
        VHIT10(:,3) = ojo;
        VHIT10(1,1) = lado;
        VHIT10(2,1) = ganancia;
        VHIT10(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,67,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo10] = leer (x,67,y);
            if borrado == 0;
                try [a,b] = size(VHIT10);
                catch
                    b = 0;
                end
                VHIT10(:,(b+2)) = cabeza;
                VHIT10(:,(b+3)) = ojo;
                VHIT10(1,(b+1)) = lado;
                VHIT10(2,(b+1)) = ganancia;
                VHIT10(3,(b+1)) = picocabeza;
            end
        end
    end
    
end

if prueba11 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
    if borrado == 0;
        VHIT11(:,2) = cabeza;
        VHIT11(:,3) = ojo;
        VHIT11(1,1) = lado;
        VHIT11(2,1) = ganancia;
        VHIT11(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,69,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo11] = leer (x,69,y);
            if borrado == 0;
                try [a,b] = size(VHIT11);
                catch
                    b = 0;
                end
                VHIT11(:,(b+2)) = cabeza;
                VHIT11(:,(b+3)) = ojo;
                VHIT11(1,(b+1)) = lado;
                VHIT11(2,(b+1)) = ganancia;
                VHIT11(3,(b+1)) = picocabeza;
            end
        end
    end
    
end
if prueba12 == 1;
    y = 77;
    imp = 0;
    [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
    if borrado == 0;
        VHIT12(:,2) = cabeza;
        VHIT12(:,3) = ojo;
        VHIT12(1,1) = lado;
        VHIT12(2,1) = ganancia;
        VHIT12(3,1) = picocabeza;
    else
        
    end
    
    %FOR
    while imp < 700
        imp = imp + 1;
        y = y+2;
        
        prueba = leer (x,71,y);
        if prueba == 1;
            [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo12] = leer (x,71,y);
            if borrado == 0;
                try [a,b] = size(VHIT12);
                catch
                    b = 0;
                end
                VHIT12(:,(b+2)) = cabeza;
                VHIT12(:,(b+3)) = ojo;
                VHIT12(1,(b+1)) = lado;
                VHIT12(2,(b+1)) = ganancia;
                VHIT12(3,(b+1)) = picocabeza;
            end
        end
    end
    
end


%SECUENCIA DE INICIO ORIGINAL (PRUEBA 1 LADO 1 IMPULSO 1)
VHITd = VHIT;
actual = 1;
paciente = ['Name: ' nombre ' ' apellido];
set(handles.text3,'string',paciente);
tipoprueba = ['Test plane: ' tipo];
set(handles.text19,'string',tipoprueba);
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu2,'Value',1);
vhgencabizq = [];
vhgenojoizq = [];
maxojo = [];
listae = [];
ganac = [];
maxcabeza = [];
n=1;
n2=1;
n3=1;
[a,c]=size(VHITd);
while n < c
    if VHITd(1,n) == 1
        vhgencabizq (:,n2) = VHITd(:,n+1);
        vhgenojoizq (:,n2) = VHITd(:,n+2);
        ganac (n2,1) = VHITd(2,n3);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end

n = 1;
while n <= size(vhgencabizq);
    [h,i] = max(vhgencabizq(:,n));
    maxcabeza(n,[1 2]) = [h i];
    n=n+1;
end


n = 1;

%busqueda de los tres maximos en ojos a intervalos fijos
%SERIA BUENO añadir condicion, si lo vas a marcar comprueba que la
%velocidad del maximo es sensiblemente (40?) superior a la del reflejo
%(dato de la ganancia?)
while n <= size(vhgenojoizq);
    
    [h,i] = max(vhgenojoizq(45:95,n));
    
    gancor = ganac(n);
    [desp tam] =size(num2str(gancor));
    if tam == 5;
        pgan = gancor*0.0001;
    else
        pgan = gancor*0.0001;
    end
    
    if h > 100
        pend1 = (vhgenojoizq(40+i,n))-(vhgenojoizq(42+i,n))+2;
        pend2 = (vhgenojoizq(38+i,n))-(vhgenojoizq(40+i,n))+2;
        % pend3 = (vhgenojoizq(36+i,n))-(vhgenojoizq(38+i,n))+2;
        %       pend4 = (vhgenojoizq(34+i,n))-(vhgenojoizq(36+i,n))+2;
        %       pend5 = (vhgenojoizq(32+i,n))-(vhgenojoizq(34+i,n))+2;
        %       pend6 = (vhgenojoizq(30+i,n))-(vhgenojoizq(32+i,n))+2;
        
        if pend1<0&&pend2<0
            if pgan < 0.6
                maxojo(n,[1 2]) = [h i];
            else
                maxojo(n,[1 2]) = [0 0];
                %NUEVO
                if h > 220
                    maxojo(n,[1 2]) = [h i];
                end
            end
        else
            maxojo(n,[1 2]) = [0 0];
            %NUEVO
            if h > 15 + max(vhgenojoizq(20:38+i,n));
                maxojo(n,[1 2]) = [h i];
            end
        end
    else
        maxojo(n,[1 2]) = [0 0];
    end
    
    %NUEVO
    if maxojo(n,1) == 0;
        [hr,ir] = max(vhgenojoizq(65:95,n));
        if hr > 125
            maxojo(n,[1 2]) = [hr (ir+20)];
        end
    end
    
    [h,i] = max(vhgenojoizq(96:135,n));
    if h > 50
        maxojo(n,[3 4]) = [h i];
    else
        maxojo(n,[3 4]) = [0 0];
    end
    [h,i] = max(vhgenojoizq(136:175,n));
    if h > 50
        maxojo(n,[5 6]) = [h i];
    else
        maxojo(n,[5 6]) = [0 0];
    end
    n=n+1;
end

%Dibujo impulso original
gana = num2str(mean(ganac)/10000,4);
gantex = ['Gain: ' gana ' '];
set(handles.text7,'string',gantex);

% DIBUJO Y DATOS UN IMPULSO

%OJO siguiente linea no siempre ?
set(handles.checkbox21,'Value',0);

gancor = ganac(actual);
[desp tam] =size(num2str(gancor));
if tam == 5;
    gancor = gancor*0.0001;
else
    gancor = gancor*0.0001;
end

gancor2 = ['Gain: ' num2str(gancor) ' '];
set(handles.text31,'string',gancor2);

axes (handles.impulso);
hold all
cla
plot(vhgencabizq(:,actual),'color','blue','LineWidth',2);
plot(vhgenojoizq(:,actual),'color',[1 0.5 0],'LineWidth',2);
ylim('auto')
ejey = get(handles.impulso,'ylim');
ylim([ejey(1) 350]);
xlim ([0 175])
line (45:94,345,'color', 'black','LineWidth',2);
line (95:134,345,'color', 'white','LineWidth',2);
line (135:175,345,'color', 'black','LineWidth',2);

%ylim ([-75 350])

set (handles.text30,'string',maxcabeza(actual,2));
set (handles.text29,'string',round(maxcabeza(actual,1)));

if maxojo(actual,1) > 0
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',(maxojo(actual,2))+44);
    plot ((maxojo(actual,2)+44),maxojo(actual,1),'kx');
else
    set (handles.text26,'string',round(maxojo(actual,1)));
    set (handles.edit1,'string',maxojo(actual,2));
    
end

if maxojo(actual,3) > 0
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',(maxojo(actual,4))+95);
    plot ((maxojo(actual,4)+95),maxojo(actual,3),'k*');
else
    set (handles.text27,'string',round(maxojo(actual,3)));
    set (handles.edit2,'string',maxojo(actual,4));
end
if maxojo(actual,5) > 0
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',(maxojo(actual,6))+135);
    plot ((maxojo(actual,6)+135),maxojo(actual,5),'k+');
else
    set (handles.text28,'string',round(maxojo(actual,5)));
    set (handles.edit3,'string',maxojo(actual,6));
end
%no copiar en otras funciones
inutila=size(ganac);
inutil = inutila(1);
listae= zeros(inutil,1);
[tam,nulo] = size(listae);
posg = [num2str(actual) '/' num2str(tam)];
set(handles.text10,'string',posg);

%Dibujar y cálculos de grupo de impulso

n=1;
n2=1;
n3=1;
[a,c]=size(vhgencabizq);
while n < c
    if listae(n) == 1
        vhgencabizqborr (:,n2) = vhgencabizq(:,n+1);
        vhgenojoizqborr (:,n2) = vhgenojoizq(:,n+2);
        n2=n2+1;
        n3=n3+3;
    end
    n = n + 1;
end
axes (handles.grupo);
cla;
hold all
plot(vhgenojoizq,'color',[1 0.5 0]);
plot(vhgencabizq,'color','blue');
xlim ([0 175]);
%ylim ([-75 350]);

%Ajuste de matrices para cálculos
t1=maxojo(:,2);
v1=maxojo(:,1);
t2=maxojo(:,4);
v2=maxojo(:,3);
t3=maxojo(:,6);
v3=maxojo(:,5);

[a,c]=size(t1);
n = 1;
while a >= n
    t1(n)=(t1(n)+44);
    n=n+1;
end
n = a;
while n>1
    if t1(n)==44
        t1(n)=[];
    end
    n = n-1;
end
[a,c]=size(t1);
if a==1&&t1(1)==44
    t1(1)=0;
    v1(1)=0;
end
if a>1&&t1(1)==44
    t1(1)=[];
    v1(1)=[];
end

[a,c]=size(t2);
n = 1;
while a >= n
    t2(n)=(t2(n)+95);
    n=n+1;
end
n = a;
while n>1
    if t2(n)==95
        t2(n)=[];
    end
    n = n-1;
end
[a,c]=size(t2);
if a==1&&t2(1)==95
    t2(1)=0;
    v2(1)=0;
end
if a>1&&t2(1)==95
    t2(1)=[];
    v2(1)=[];
end

[a,c]=size(t3);
n = 1;
while a >= n
    t3(n)=(t3(n)+135);
    n=n+1;
end
n = a;
while n>1
    if t3(n)==135
        t3(n)=[];
    end
    n = n-1;
end
[a,c]=size(t3);
if a==1&&t3(1)==135
    t3(1)=0;
    v3(1)=0;
end
if a>1&&t3(1)==135
    t3(1)=[];
    v3(1)=[];
end

%El elemento 1 está sin ajustar en la velocidad ¿?
[n,c]=size(v3);
while n>1
    if v3(n)==0
        v3(n)=[];
    end
    n = n-1;
end
[n,c]=size(v3);
if n>1&&v3(1)==0
    v3(1)=[];
end

[n,c]=size(v2);
while n>1
    if v2(n)==0
        v2(n)=[];
    end
    n = n-1;
end
[n,c]=size(v2);
if n>1&&v2(1)==0
    v2(1)=[];
end

[n,c]=size(v1);
while n>1
    if v1(n)==0
        v1(n)=[];
    end
    n = n-1;
end
[n,c]=size(v1);
if n>1&&v1(1)==0
    v1(1)=[];
end

%Cálculos coef.var

[n,c]=size(t1);
[n2,c]=size(t2);
[n3,c]=size(t3);

a = mean(t1);
b = mean(t2);
c = mean(t3);
g = mean(v1);
h = mean(v2);
i = mean(v3);

if a == 0
    n = 0;
end
if b == 0
    n2 = 0;
end
if c == 0
    n3 = 0;
end

if a > 0
    d = std(t1)/mean(t1);
else
    d = 0;
end
if b > 0
    e = std(t2)/mean(t2);
else
    e = 0;
end
if c > 0
    f = std(t3)/mean(t3);
else
    f = 0;
end

if g > 0
    j = std(v1)/mean(v1);
else
    j = 0;
end
if h > 0
    k = std(v2)/mean(v2);
else
    k = 0;
end
if i > 0
    l = std(v3)/mean(v3);
else
    l = 0;
end

% SALIDA RESULTADOS ad = ['Media t1: ' num2str(round(a)) ' (n=' num2str(n) ')'];
na = num2str(n);
nb = num2str(n2);
nc = num2str(n3);
ad = num2str(round(a));
bd = num2str(round(b));
xd = num2str(round(c));
dd = num2str(d);
ed = num2str(e);
fd = num2str(f);
gd = num2str(round(g));
hd = num2str(round(h));
id = num2str(round(i));
jd = num2str(j);
kd = num2str(k);
ld = num2str(l);


cvm = round(((d+e+f)/3)*100);
r = [num2str(cvm) ' % '];
rta = num2str(round(((j+k+l)/3)*100));
rt = [rta ' % '];


set (handles.text35,'string',ad);
set (handles.text36,'string',bd);
set (handles.text37,'string',xd);
set (handles.text41,'string',dd);
set (handles.text42,'string',ed);
set (handles.text43,'string',fd);
set (handles.text44,'string',r);
set (handles.text49,'string',rt);
set (handles.text46,'string',gd);
set (handles.text47,'string',hd);
set (handles.text48,'string',id);
set (handles.text66,'string',jd);
set (handles.text67,'string',kd);
set (handles.text68,'string',ld);
set (handles.text53,'string',na);
set (handles.text54,'string',nb);
set (handles.text55,'string',nc);
%RED NEURAL 10 ELMENTOS
a = [];
b = [];
c = [];
tam = [];
lmaxvalojor = [];
lmaxposojor = [];
lmaxvalojo = [];
lmaxposojo = [];
sens = 12;
sens2 = 35;
vhgenojoizqf = [];
vhgencabizqf = [];


vhgenojoizqf = low(vhgenojoizq);
vhgencabizqf = low(vhgencabizq);
[a,c]=size(vhgenojoizqf);



for  a = 1 : 1 : c
    
    [lmaxvalojor,lmaxposojor] = findpeaks(vhgenojoizqf(:,a),'minpeakdistance',15,'minpeakheight',65);
    [lmaxvalcab,lmaxposcab] = findpeaks(vhgencabizqf(:,1),'minpeakheight',40,'minpeakdistance',30,'npeaks',1);
    [b,c] = size(lmaxvalojor);
    
    if b > 0
        if lmaxposojor(1) < (lmaxposcab(1)+10)
            
            lmaxposojor(1) = [];
            lmaxvalojor(1) = [];
            b = b-1;
        end
        lmaxvalojo(1:b,a) = lmaxvalojor;
        lmaxposojo(1:b,a) = lmaxposojor;
    end
end

[a,b] = size (lmaxposojo);
out = [];
if a > 0
    for p = 1:1:b
        
        if lmaxposojo(1,p)>mean(lmaxposojo(1,:))+20 || lmaxposojo(1,p)<mean(lmaxposojo(1,:))-20
            out = horzcat(out,p);
        end
    end
    [r,s] = size(out);
    
    if s >0 && s<=2
        %warndlg('Outlayer data has been detected and deleted', 'NOTICE')
        if s == 1
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(1))=[];
            lmaxvalojo(:,out(1))=[];
        else
            lmaxposojo(:,out(1));
            lmaxposojo(:,out(2));
            lmaxposojo(:,out(1))=[];
            try lmaxposojo(:,out(2))=[];
            end
            lmaxvalojo(:,out(1))=[];
            try lmaxvalojo(:,out(2))=[];
            end
        end
    end
end
[tam,impuls] = size(lmaxposojo);


axes (handles.todos);
cla;
hold all
plot(vhgenojoizqf,'color',[1 0.5 0]);
if get(handles.popupmenu2,'Value') == 1
    plot(vhgencabizqf,'color','blue');
else
    plot(vhgencabizqf,'color','red');
end
xlim ([0 175]);
ylim ([-75 350]);
axis off;

axes (handles.s1)
plot(1,1,'kx')
axis off
axes (handles.s2)
plot(1,1,'k*')
axis off
axes (handles.s3)
plot(1,1,'k+')
axis off
axes (handles.s4)
plot(1,1,'ko')
axis off
axes (handles.todos)

for p=1:1:impuls
    if tam > 0
        x = lmaxposojo(1,:);
        y = lmaxvalojo(1,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'kx')
        
    end
    if tam > 1
        x = lmaxposojo(2,:);
        y = lmaxvalojo(2,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k*')
    end
    if tam > 2
        x = lmaxposojo(3,:);
        y = lmaxvalojo(3,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'k+')
        
    end
    if tam > 3
        x = lmaxposojo(4,:);
        y = lmaxvalojo(4,:);
        x(x==0) = [];
        y(y==0) = [];
        plot(x,y+0.05,'ko')
        
    end
    
end
pr1 = 0;
pr2 = 0;
pr3 = 0;
pr4 = 0;

if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    pr1 = (std(x)/mean(x))*100;
end
if tam > 1
    x = lmaxposojo(2,:)*100;
    x(x==0) = [];
    pr2 = (std(x)/mean(x))*100;
end
if tam > 2
    x = lmaxposojo(3,:);
    x(x==0) = [];
    pr3 = (std(x)/mean(x))*100;
end
if tam > 3
    x = lmaxposojo(4,:);
    x(x==0) = [];
    pr4 = (std(x)/mean(x))*100;
end

if isnan(pr1)
    pr1 = 0;
end
if isnan(pr2)
    pr2 = 0;
end
if isnan(pr3)
    pr3 = 0;
end
if isnan(pr4)
    pr4 = 0;
end

set(handles.text82,'string',['1st Saccades PR score: ',num2str(pr1,'%.2f'), ' %']);
set(handles.text83,'string',['2nd Saccades PR score: ',num2str(pr2,'%.2f'), ' %']);
set(handles.text84,'string',['3rd Saccades PR score: ',num2str(pr3,'%.2f'), ' %']);
set(handles.text85,'string',['4th Saccades PR score: ',num2str(pr4,'%.2f'), ' %']);

if pr1 <= sens
    if pr2 >= sens2
        set(handles.text51,'string','SCATTERED');
        set(handles.text51,'ForegroundColor',[0.9 0 0]);
    else
        set(handles.text51,'string','GATHERED');
        set(handles.text51,'ForegroundColor',[0 0.9 0]);
    end
end
if pr1 > sens
    set(handles.text51,'string','SCATTERED');
    set(handles.text51,'ForegroundColor',[0.9 0 0]);
end

if isempty (lmaxposojo)
    set(handles.text51,'string','NORMAL');
    set(handles.text51,'ForegroundColor',[0 0 0]);
else
    xu = lmaxposojo(1,:);
    xu(xu==0) = [];
    if size (xu) <4
        set(handles.text51,'string','NORMAL');
        set(handles.text51,'ForegroundColor',[0 0 0]);
    end
end

impuls;
if tam > 0
    x = lmaxposojo(1,:);
    x(x==0) = [];
    [tam2,impuls2] = size(x);
    ind = 1-(impuls2 / impuls);
else
    ind = 0;
end

prg = 2.5*(0.8*pr1+0.2*pr2);

if prg > 35
    prg = prg -(30*ind);
end
if prg > 100
    prg = 100;
end
set(handles.text88,'string',['PR Score: ',num2str(round(prg)), ' %'])

%FIN RED
set(handles.inicio,'string','Wellcome to HitCal: Import XML file to start.');
set(handles.inicio,'visible','off')
set (handles.Untitled_5,'enable','on')


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text79.
function text79_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    train
catch
    msgbox('No information to display', 'ERROR','error');
end




% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    train
catch
    msgbox('No information to display', 'ERROR','error');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try 
    AUC
catch
   msgbox('Calculus tool is not avaliable', 'ERROR','error'); 
end
    


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try 
    SPV
catch
   msgbox('Slow Phase Inspector is not avaliable', 'ERROR','error'); 
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj(gcf,'type','axes');
selected = findobj(h,'tag','impulso');
fig2 = figure('visible','off');
newax = copyobj(selected,fig2);
set(newax, 'units', 'normalized', 'position', [0.13 0.11 0.775 0.815]);
print(fig2,'-r300','-depsc2', 'Impulse');
close(fig2);


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj(gcf,'type','axes');
selected = findobj(h,'tag','grupo');
lines = findobj(selected,'type','line');
%set(lines,'linewidth',1.25);
fig3 = figure('visible','off');
newax = copyobj(selected,fig3);
set(newax, 'units', 'normalized', 'position', [0.13 0.11 0.775 0.815]);
print(fig3,'-r300','-depsc2', 'Test');
close(fig3);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj(gcf,'type','axes');
selected = findobj(h,'tag','todos');
fig4 = figure('visible','off');
newax = copyobj(selected,fig4);
set(newax, 'units', 'normalized', 'position', [0.13 0.11 0.775 0.815]);
print(fig4,'-r300','-depsc2', 'Saccades');
close(fig4);


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vvor


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%FOURIER EXPERIMENTAL
global vhgencabizq vhgenojoizq actual
head = (vhgencabizq(:,actual));
eye = (vhgenojoizq(:,actual));
[fH,pH] = fourier(head);
[fE,pE] = fourier(eye);
%Plots
figureFourier = figure('name','Fourier ANALYSIS','Position',[5 5 800 550]);
hold on
stem(fH,pH,'b');
title('Single-Side Amplitude Spectrum of Head and Eye')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 50])
stem(fE,pE,'r');
legend('Head','Eye')
hold off
[maxValHead,posMaxHead] = max(pH);
frecMaxHead = fH(posMaxHead);
[c,index] = min(abs(fE-frecMaxHead));
frqEyeValue = fE(index);
fourierGain = pE(index)/maxValHead;
display(fourierGain)
mTextBox = uicontrol('style','text');
result = strcat('Fourier Gain: ',num2str(fourierGain),' measured at(Hz): ',num2str(frqEyeValue));
set(mTextBox,'String',result)
set(mTextBox,'FontSize',12)
set(mTextBox,'Position',[5 5 400 25])
set(figureFourier,'MenuBar','figure')

% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vhgencabizq vhgenojoizq
[archivo,directorio] = uiputfile('*.mat','Save data to .mat file','impulses.mat');
if archivo == 0
    return
end
dirinicial = cd;
cd(directorio)
headData = vhgencabizq;
eyeData = vhgenojoizq;
save (archivo,'headData','eyeData')
cd(dirinicial)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vhgencabizq vhgenojoizq ganac
headData = vhgencabizq;
eyeData = vhgenojoizq;
[~,tam]= size(headData);
pos = 1;
wGain = [];
while pos <= tam
    [Gain,HW6,HW5,HW4,HW3,HW2,HW1,EW6,EW5,EW4,EW3,EW2,EW1,HC1,HC2,HC3,HC4,HC5,HC6,EC1,EC2,EC3,EC4,EC5,EC6] = wav(headData(1:100,pos),eyeData(1:100,pos));
    wGain = vertcat(wGain,Gain);
    pos = pos + 1;
end
statistics = questdlg( num2str(mean(wGain)),'Wavelet method vHIT Gain','Ok','Output Statistics','Ok');
if strcmp(statistics,'Output Statistics')
    display(wGain,'Wavelet gain')
    display(std(wGain),'Wavelet SD')
    display((ganac)*0.0001,'AUC gain')
    display(std((ganac)*0.0001),'AUC SD')
end


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isLeft
tipo_act = get(handles.text19,'string');
if strcmp(tipo_act, 'Test plane: SHIMP Lateral')
    if get(handles.popupmenu2,'Value') == 1
        isLeft = 1;
    else
        isLeft = 0;
    end
    shimp
else
    warndlg('The actual selected impulse is not a SHIMP impulse, please select a SHIMP impulse to run this mode','Not SHIMP')
end
