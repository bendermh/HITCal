function varargout = shimp(varargin)
% SHIMP MATLAB code for shimp.fig
%      SHIMP, by itself, creates a new SHIMP or raises the existing
%      singleton*.
%
%      H = SHIMP returns the handle to a new SHIMP or the handle to
%      the existing singleton*.
%
%      SHIMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHIMP.M with the given input arguments.
%
%      SHIMP('Property','Value',...) creates a new SHIMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shimp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shimp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shimp

% Last Modified by GUIDE v2.5 06-Jun-2017 20:31:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shimp_OpeningFcn, ...
                   'gui_OutputFcn',  @shimp_OutputFcn, ...
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


% --- Executes just before shimp is made visible.
function shimp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shimp (see VARARGIN)

% Choose default command line output for shimp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shimp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shimp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global vhgencabizq vhgenojoizq ganac isLeft
gains = (ganac)*0.0001;
eyeData = vhgenojoizq;
headData = vhgencabizq;
[~,sizeRAW] = size(eyeData);
pos = 1;
HeadValues = [];
HeadPosition = [];
HeadWidth = [];
HeadProminence = [];
EyePValues = [];
EyePPosition = [];
EyePWidth = [];
EyePProminence = [];
EyeNValues = [];
EyeNPosition = [];
EyeNWidth = [];
EyeNProminence = [];
lowImpulses = [];
covertSaccades = [];
errors = [];
while pos <= sizeRAW
    [EpositiveValue,EpositiveLocation,EpositiveWidth,EpositiveProminence] = findpeaks(eyeData(:,pos),'NPeaks',1,'MinPeakProminence',100);
    [EnegativeValue,EnegativeLocation,EnegativeWidth,EnegativeProminence] = findpeaks(-eyeData(:,pos),'NPeaks',1,'MinPeakProminence',80);
    [HpositiveValue,HpositiveLocation,HpositiveWidth,HpositiveProminence] = findpeaks(headData(:,pos),'NPeaks',1,'MinPeakProminence',80);
    %Peak prominence correction (sometimes it is not well computed)
    if EnegativeValue < 85
        EnegativeValue = NaN;
        EnegativeLocation = NaN;
        EnegativeWidth = NaN;
        EnegativeProminence = NaN;
    end
    HeadValues = horzcat(HeadValues,HpositiveValue);
    HeadPosition = horzcat(HeadPosition,HpositiveLocation);
    HeadWidth = horzcat(HeadWidth,HpositiveWidth);
    HeadProminence = horzcat(HeadProminence,HpositiveProminence);
    EyePValues = horzcat(EyePValues,EpositiveValue);
    EyePPosition = horzcat(EyePPosition,EpositiveLocation);
    EyePWidth = horzcat(EyePWidth,EpositiveWidth);
    EyePProminence = horzcat(EyePProminence,EpositiveProminence);
    EyeNValues = horzcat(EyeNValues,EnegativeValue);
    EyeNPosition = horzcat(EyeNPosition,EnegativeLocation);
    EyeNWidth = horzcat(EyeNWidth,EnegativeWidth);
    EyeNProminence = horzcat(EyeNProminence,EnegativeProminence);
    if HpositiveValue < 131
        isLow = 1;
    else
        isLow = 0;
    end
    if EnegativeLocation < (HpositiveLocation + (HpositiveWidth/1.5) + EnegativeWidth)
        isCovert = 1;
    else
        isCovert = 0;
    end
    if isempty(EnegativeValue)
        isError = 1;
    else
        isError = 0;
    end
    lowImpulses = horzcat(lowImpulses,isLow);
    covertSaccades = horzcat(covertSaccades,isCovert);
    errors = horzcat(errors,isError);
    pos = pos + 1;
end
axes (handles.SHIMPaxes);
cla;
hold all
plot(headData,'color','black','LineWidth',1.5);
plot(eyeData,'color',[1 0.5 0],'LineWidth',1.5);
plot(EyeNPosition,-EyeNValues,'bo','MarkerSize',7.5,'MarkerFaceColor','g')
%Erase impulses without eye saccades
corrHeadPosition = [];
corrcovertSaccades = [];
pos = 1;
while pos <= sizeRAW
    if errors(pos) == 0
        corrHeadPosition = horzcat(corrHeadPosition,HeadPosition(pos));
        corrcovertSaccades = horzcat(corrcovertSaccades,covertSaccades(pos));
    end
    pos = pos+1;
end
%coloringcovert
if sum(corrcovertSaccades)> 0
   positions = find(corrcovertSaccades==1);
   plot(EyeNPosition(positions),-EyeNValues(positions),'bo','MarkerSize',7.5,'MarkerFaceColor','r')
end
ylabel('Velocity in deg/s');
xlabel('Time in samples (~250 Hz)');
xlim([0 175])
ylim([-500 300])
%Statistics output
set(handles.text12,'string',num2str(sizeRAW,'%.0f'));
set(handles.text13,'string',num2str(sum(lowImpulses),'%.0f'));
set(handles.text31,'string',[num2str(mean(HeadValues),'%.2f'),' (SD:',num2str(std(HeadValues),'%.2f'),')']);
RawLatency = EyeNPosition - corrHeadPosition;
RawLatency(find(isnan(RawLatency))) = [];
set(handles.text14,'string',[num2str(mean(RawLatency),'%.2f'),' (SD:',num2str(std(RawLatency),'%.2f'),')']);
set(handles.text15,'string',num2str(sum(corrcovertSaccades),'%.0f'));
set(handles.text16,'string',[num2str((sum(corrcovertSaccades)/sizeRAW)*100,'%.0f'),' %']);
set(handles.text17,'string',num2str(find(covertSaccades == 1)));
RawCovertLatency = EyeNPosition(find(corrcovertSaccades == 1))-corrHeadPosition(find(corrcovertSaccades == 1));
RawCovertLatency(find(isnan(RawCovertLatency))) = [];
RawCovertWidth = EyeNWidth(find(corrcovertSaccades == 1));
RawCovertWidth(find(isnan(RawCovertWidth))) = [];
RawCovertVeloc = EyeNValues(find(corrcovertSaccades == 1));
RawCovertVeloc(find(isnan(RawCovertVeloc))) = [];
set(handles.text18,'string',[num2str(mean(RawCovertLatency),'%.2f'),' (SD:',num2str(std(RawCovertLatency),'%.2f'),')']);
set(handles.text22,'string',[num2str(mean(RawCovertWidth),'%.2f'),' (SD:',num2str(std(RawCovertWidth),'%.2f'),')']);
set(handles.text23,'string',[num2str(mean(-RawCovertVeloc),'%.2f'),' (SD:',num2str(std(RawCovertVeloc),'%.2f'),')']);
RawOvertLatency = EyeNPosition(find(corrcovertSaccades == 0))-corrHeadPosition(find(corrcovertSaccades == 0));
RawOvertLatency(find(isnan(RawOvertLatency))) = [];
RawOvertWidth = EyeNWidth(find(corrcovertSaccades == 0));
RawOvertWidth(find(isnan(RawOvertWidth))) = [];
RawOvertVeloc = EyeNValues(find(corrcovertSaccades == 0));
RawOvertVeloc(find(isnan(RawOvertVeloc))) = [];
set(handles.text19,'string',[num2str(mean(RawOvertLatency),'%.2f'),' (SD:',num2str(std(RawOvertLatency),'%.2f'),')']);
set(handles.text26,'string',[num2str(mean(RawOvertWidth),'%.2f'),' (SD:',num2str(std(RawOvertWidth),'%.2f'),')']);
set(handles.text27,'string',[num2str(mean(-RawOvertVeloc),'%.2f'),' (SD:',num2str(std(RawOvertVeloc),'%.2f'),')']);

if isLeft == 1
    set(handles.text28,'string','Left side SHIMP impulses')
else
    set(handles.text28,'string','Right side SHIMP impulses')
end
set(handles.text29,'string',['Gain: ',num2str(mean(gains),'%.2f'),' (SD:',num2str(std(gains),'%.2f'),')'])

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj(gcf,'type','axes');
selected = findobj(h,'tag','SHIMPaxes');
fig5 = figure('visible','off');
newax = copyobj(selected,fig5);
set(newax, 'units', 'normalized', 'position', [0.13 0.11 0.775 0.815]);
print(fig5,'-r300','-depsc2', 'SHIMP_Saccades');
close(fig5);
