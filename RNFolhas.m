function varargout = RNFolhas(varargin)
% RNFOLHAS MATLAB code for RNFolhas.fig
%      RNFOLHAS, by itself, creates a new RNFOLHAS or raises the existing
%      singleton*.
%
%      H = RNFOLHAS returns the handle to a new RNFOLHAS or the handle to
%      the existing singleton*.
%
%      RNFOLHAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RNFOLHAS.M with the given input arguments.
%
%      RNFOLHAS('Property','Value',...) creates a new RNFOLHAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RNFolhas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RNFolhas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RNFolhas

% Last Modified by GUIDE v2.5 07-Jul-2018 17:22:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RNFolhas_OpeningFcn, ...
                   'gui_OutputFcn',  @RNFolhas_OutputFcn, ...
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


% --- Executes just before RNFolhas is made visible.
function RNFolhas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RNFolhas (see VARARGIN)

% Choose default command line output for RNFolhas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RNFolhas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RNFolhas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bt_useNN.
function bt_useNN_Callback(hObject, eventdata, handles)
% hObject    handle to bt_useNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_loadImage.
function bt_loadImage_Callback(hObject, eventdata, handles)
% hObject    handle to bt_loadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in bt_loadNN.
function bt_loadNN_Callback(hObject, eventdata, handles)
% hObject    handle to bt_loadNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pop_dataset.
function pop_dataset_Callback(hObject, eventdata, handles)
% hObject    handle to pop_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_dataset contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_dataset


% --- Executes during object creation, after setting all properties.
function pop_dataset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_simNN.
function bt_simNN_Callback(hObject, eventdata, handles)
% hObject    handle to bt_simNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pop_topologia.
function pop_topologia_Callback(hObject, eventdata, handles)
% hObject    handle to pop_topologia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_topologia contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_topologia


% --- Executes during object creation, after setting all properties.
function pop_topologia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_topologia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_fAtivacao.
function pop_fAtivacao_Callback(hObject, eventdata, handles)
% hObject    handle to pop_fAtivacao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_fAtivacao contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_fAtivacao


% --- Executes during object creation, after setting all properties.
function pop_fAtivacao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_fAtivacao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_trainNN.
function bt_trainNN_Callback(hObject, eventdata, handles)
% hObject    handle to bt_trainNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in pop_fTreino.
function pop_fTreino_Callback(hObject, eventdata, handles)
% hObject    handle to pop_fTreino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_fTreino contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_fTreino


% --- Executes during object creation, after setting all properties.
function pop_fTreino_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_fTreino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_saveNN.
function bt_saveNN_Callback(hObject, eventdata, handles)
% hObject    handle to bt_saveNN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bt_class.
function bt_class_Callback(hObject, eventdata, handles)
% hObject    handle to bt_class (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
