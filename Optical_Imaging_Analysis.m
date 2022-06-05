function varargout = Optical_Imaging_Analysis(varargin)
% OPTICAL_IMAGING_ANALYSIS MATLAB code for Optical_Imaging_Analysis.fig
%      OPTICAL_IMAGING_ANALYSIS, by itself, creates a new OPTICAL_IMAGING_ANALYSIS or raises the existing
%      singleton*.Z:\Imaging group\Katie\3 color\geph mutants\geph268\268- 3c\oi\RESULT OF ipsi only_E0B.mat
%
%      H = OPTICAL_IMAGING_ANALYSIS returns the handle to a new OPTICAL_IMAGING_ANALYSIS or the handle to
%      the existing singleton*.
%
%      OPTICAL_IMAGING_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTICAL_IMAGING_ANALYSIS.M with the given input arguments.
%
%      OPTICAL_IMAGING_ANALYSIS('Property','Value',...) creates a new OPTICAL_IMAGING_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Optical_Imaging_Analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Optical_Imaging_Analy  sis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Optical_Imaging_Analysis


% Last Modified by GUIDE v2.5 27-Jul-2013 17:48:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Optical_Imaging_Analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Optical_Imaging_Analysis_OutputFcn, ...
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


% --- Executes just before Optical_Imaging_Analysis is made visible.
function Optical_Imaging_Analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Optical_Imaging_Analysis (see VARARGIN)

% Choose default command line output for Optical_Imaging_Analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Optical_Imaging_Analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Optical_Imaging_Analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bothMat.
function bothMat_Callback(hObject, eventdata, handles)
% hObject    handle to bothMat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% this works by getting the values from both fields then if both fields are
% empty it starts the path at the current folder. If the ipsi field is
% blank it starts with what is in the both field and if both is blank and
% ipsi is not then you use the ipsi folder. For each of these if the cancel
% button is pressed the set command is skipped

previous=[get(handles.textBoth,'String')];
previous_ipsi=get(handles.textIpsi,'String');
if isempty(max(strfind(previous,':\'))) && isempty(max(strfind(previous_ipsi,':\')))
   'one';
    [filename, pathname] = uigetfile('*.mat', 'Choose mat file');
    if ~exist('filename') || isa(filename,'double')
      'choose a file 1';
      return
    else
      set(handles.textBoth,'String',[pathname, filename]);
    end
    
    
elseif isempty(max(strfind(previous_ipsi,':\')))
    'two' ;
    
    previous=previous(1:max(strfind(previous,'\')));
    [filename, pathname] = uigetfile([previous,'*.mat'], 'Choose mat file');
    
    if ~exist('filename') || isa(filename,'double')
      'choose a file 2';
      return
    end
    
    set(handles.textBoth,'String',[pathname, filename]);
    
else
   'three';

     previous=previous_ipsi(1:max(strfind(previous_ipsi,'\')));
    [filename, pathname] = uigetfile([previous,'*.mat'], 'Choose mat file');
     
    if ~exist('filename') || isa(filename,'double')
      'choose a file 3';
        return
    end
     
     
     set(handles.textBoth,'String',[pathname, filename]);
    
    
        
end

% --- Executes on button press in ipsiMat.
function ipsiMat_Callback(hObject, eventdata, handles)
% hObject    handle to ipsiMat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
previous=[get(handles.textIpsi,'String')];
previous_both=get(handles.textBoth,'String');
if isempty(max(strfind(previous,':\'))) && isempty(max(strfind(previous_both,':\')))
   'one';
    [filename, pathname] = uigetfile('*.mat', 'Choose mat file');
    if ~exist('filename') || isa(filename,'double')
      'choose a file 1';
      return
    else
      set(handles.textIpsi,'String',[pathname, filename]);
    end
    
    
elseif isempty(max(strfind(previous_both,':\')))
    'two' ;
   
    previous=previous(1:max(strfind(previous,'\')));
    [filename, pathname] = uigetfile([previous,'*.mat'], 'Choose mat file');
    
    if ~exist('filename') || isa(filename,'double')
      'choose a file 2';
      return
    end
    
    set(handles.textIpsi,'String',[pathname, filename]);
    
else
   'three';

     previous=previous_both(1:max(strfind(previous_both,'\')));
    [filename, pathname] = uigetfile([previous,'*.mat'], 'Choose mat file');
     
    if ~exist('filename') || isa(filename,'double')
      'choose a file 3';
        return
    end
     
     
     set(handles.textIpsi,'String',[pathname, filename]);
      
        
end
% --- Executes on button press in saveFolder.
function saveFolder_Callback(hObject, eventdata, handles)
% hObject    handle to saveFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

previous=[get(handles.textSave,'String')]
if isempty(max(strfind(previous,':\')))
    [pathname] = uigetdir('C:/','Choose Save Folder');
    set(handles.textSave,'String',[pathname]);
else
    previous=previous(1:max(strfind(previous,'\')));
    [pathname] = uigetdir(previous,'Choose Save Folder');
    set(handles.textSave,'String',[pathname]);
end
% --- Executes on button press in IpsiROI.
function IpsiROI_Callback(hObject, eventdata, handles)
% hObject    handle to IpsiROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawboundry(handles.textIpsi,'bin',handles)

function bothROI_Callback(hObject, eventdata, handles)
% hObject    handle to bothROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawboundry(handles.textBoth,'mon',handles)

% --- Executes on button press in MagROI.
function MagROI_Callback(hObject, eventdata, handles)
% hObject    handle to MagROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MagROI
set(handles.MagROI,'Value',1);
set(handles.phaseROI,'Value',0);

% --- Executes on button press in phaseROI.
function phaseROI_Callback(hObject, eventdata, handles)
% hObject    handle to phaseROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of phaseROI
set(handles.MagROI,'Value',0);
set(handles.phaseROI,'Value',1);


% --- Executes on button press in DrawFullWindow.
function DrawFullWindow_Callback(hObject, eventdata, handles)
% hObject    handle to DrawFullWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DrawFullWindow(hObject, handles)


function thresh_Callback(hObject, eventdata, handles)
% hObject    handle to thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thresh as text
%        str2double(get(hObject,'String')) returns contents of thresh as a double


% --- Executes during object creation, after setting all properties.
function thresh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fullwindow_text_Callback(hObject, eventdata, handles)
% hObject    handle to fullwindow_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fullwindow_text as text
%        str2double(get(hObject,'String')) returns contents of fullwindow_text as a double


% --- Executes during object creation, after setting all properties.
function fullwindow_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fullwindow_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FullWindow.
function FullWindow_Callback(hObject, eventdata, handles)
% hObject    handle to FullWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

previous=[get(handles.textBoth,'String')];

previous=previous(1:max(strfind(previous,'\')));

[filename, pathname] = uigetfile([previous,'*.bmp'], 'Choose Full Window image');

if ~exist('filename') || isa(filename,'double')
    'choose a file 2';
    return
end
set(handles.fullwindow_text,'String',[pathname filename]);


    
    


% --- Executes on button press in thresholdon.
function thresholdon_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of thresholdon


% --- Executes on button press in saveTiffs.
function saveTiffs_Callback(hObject, eventdata, handles)
% hObject    handle to saveTiffs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bothloc=[get(handles.textBoth,'String')];
Ipsiloc=[get(handles.textIpsi,'String')];

if ismember('\',Bothloc)
   
BW='new';
[Ang,Ab]=Analyze_mat(handles.textBoth,BW);
Ab=Ab.*10000000;

end




