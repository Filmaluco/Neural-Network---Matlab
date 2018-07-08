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

% Last Modified by GUIDE v2.5 07-Jul-2018 18:22:36

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
addpath(genpath('./Functions'));
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RNFolhas (see VARARGIN)

% Choose default command line output for RNFolhas
handles.output = hObject;

%Variables
handles.scale = 100;
handles.path_to_files = './Tema 1 - RN/'; 
handles.data_file = '.\Tema 1 - RN\ClassificaçãoFolhas.xlsx';

%Train Variables
handles.currentTrainNN = 'EMPTY';
handles.trainDataset = './Tema 1 - RN\Folhas_';

%Simulation Variables
handles.currentSimulationNN = 'EMPTY';

%Classificaion Variable
handles.currentClassificationNN = 'EMPTY';
handles.currentImage = 'EMPTY';

handles.dataTable.ColumnName = {'Result','Target'};

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
[file,path] = uigetfile('*.mat');
try
    NN = load([path file]);
   NN = NN.NN;
catch exception
   NN = 'EMPTY';
   errordlg('Por favor carregue uma rede neuronal','NN not found');
end

if strcmp(NN, 'EMPTY') ~= 1
    handles.currentClassificationNN = NN;
    guidata(hObject, handles);
end




% --- Executes on button press in bt_loadImage.
function bt_loadImage_Callback(hObject, eventdata, handles)
% hObject    handle to bt_loadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if strcmp(handles.currentClassificationNN, 'EMPTY') == 1
   errordlg('Por favor carregue uma rede primeiro','NN not found');
else 
    [file, path]=uigetfile('*.jpg*','Specify an image file','on');
     image=fullfile(path,file);
     handles.currentImage = ConverterImagemParaMatrizBinaria([path file], handles.scale);
     guidata(hObject, handles);
     imshow(image); %not even calling axes and it works WTF????
end




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
[file,path] = uigetfile('*.mat');
try
   NN = load([path file]);
   NN = NN.NN;
catch exception
   NN = 'EMPTY';
   errordlg('Por favor carregue uma rede neuronal','NN not found');
end

if strcmp(NN, 'EMPTY') ~= 1
    handles.currentSimulationNN = NN;
    guidata(hObject, handles);
end


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
if strcmp(handles.currentSimulationNN, 'EMPTY') == 1
   errordlg('Por favor carregue uma rede primeiro','NN not found');
else 
    
    set(handles.figure1, 'pointer', 'watch')
    drawnow;

    
    NN = handles.currentSimulationNN;
    
    selectedDataset = get(handles.pop_dataset,'String');
    selectedDataset = selectedDataset(get(handles.pop_dataset,'Value'),:);
    
    selectedDataset = strcat(handles.path_to_files, selectedDataset);
    
    imagens = LoadImages(selectedDataset{1,1}, handles.scale);
    imagens = UpdateImages(imagens,handles.data_file, handles.scale);
    %- Input and Output Generation
    input = inputfromImageExtration(imagens, handles.scale);
    target = targetCodigoEspecie(imagens);
    
    output = NN(input);
    
    [species subSpecies codeSpecies codeSubEspecies] = ClassificationExtration(handles.data_file);
    
    count = size(input);
    count = count(1,2);
    
    certas = 0;
    erradas = 0;
    
    colergen = @(color,text) ['<html><table border=0 width=400 bgcolor=',color,'><TR><TD>',text,'</TD></TR> </table></html>'];
   
    %output = nnOutputToSpecieCode (output, species);
    for i = 1 : count
        str1 = nnOutputToSpecieCode(output(:,i), species);
        str2 = nnOutputToSpecieCode(target(:,i), species);
    
        
        if strcmp(str1, str2) == 1
             d{i, 1} = colergen('#9ACD32',str1{1,1});
             d{i, 2} = colergen('#9ACD32',str2{1,1}); 
             certas = certas + 1;
             
        else
            d{i, 1} = colergen('#FF4500',str1{1,1});
            d{i, 2} = colergen('#FF4500',str2{1,1});
            erradas = erradas + 1;
        end

    
    end
    handles.dataTable.Data = d;
    
    
    set(handles.text19, 'String', certas);
    set(handles.text20, 'String', erradas);
    set(handles.text21, 'String', (certas/count)*100);
    set(handles.text22, 'String', (erradas/count)*100);
    
    set(handles.figure1, 'pointer', 'arrow')
    
end


if strcmp(handles.currentSimulationNN, 'EMPTY') == 1
   errordlg('Por favor carregue uma rede primeiro','NN not found');
else 
   %efetuar agora 
end


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

%Loaded from GUI

set(handles.figure1, 'pointer', 'watch')
drawnow;


all_topologias = get(handles.pop_topologia,'String');
NNparam.topologia = all_topologias(get(handles.pop_topologia,'Value'),:);
NNparam.topologia = NNparam.topologia{1,1};


all_fAtivacao = get(handles.pop_fAtivacao,'String');
NNparam.fAtivacao = all_fAtivacao(get(handles.pop_fAtivacao,'Value'),:);
NNparam.fAtivacao = NNparam.fAtivacao{1,1};

all_fTreino = get(handles.pop_fTreino,'String');
NNparam.fTreino = all_fTreino(get(handles.pop_fTreino,'Value'),:);
NNparam.fTreino = NNparam.fTreino{1,1};

%Default param
NNparam.neuronios = 10;
NNparam.trainRatio = 0.7;
NNparam.valRatio = 0.15;
NNparam.testRatio = 0.15;
NNparam.max_fail = 10;

imagens = LoadImages(handles.trainDataset, handles.scale);
imagens = UpdateImages(imagens,handles.data_file, handles.scale);
    %- Input and Output Generation
input = inputfromImageExtration(imagens, handles.scale);
target = targetCodigoEspecie(imagens);

[currentTrainNN data pTotal pTeste] = especieNeuralNetwork(NNparam, input, target);

handles.currentTrainNN = currentTrainNN;

set(handles.txt_pTotal, 'String', pTotal);
set(handles.txt_pTeste, 'String', pTeste);

% your computation
set(handles.figure1, 'pointer', 'arrow')

% Update handles structure
guidata(hObject, handles);
%view(redeNeuronal);




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

if strcmp(handles.currentTrainNN, 'EMPTY') == 1
   errordlg('Por favor treine uma rede primeiro','NN not found');
else 
    old_dir = pwd;
    cd (handles.path_to_files);
    nr_files=dir(['*.mat']);
    nr_files=size(nr_files,1);
    nr_files=num2str(nr_files);
    name = {['NN', nr_files]};
    name = name{1,1};
    NN = handles.currentTrainNN;
    save(name,'NN');
    cd (old_dir);
end


% --- Executes on button press in bt_class.
function bt_class_Callback(hObject, eventdata, handles)
% hObject    handle to bt_class (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if strcmp(handles.currentImage, 'EMPTY') == 1
   errordlg('Por favor carregue uma imagem primeiro','NN not found');
else 
   [species subSpecies codeSpecies codeSubEspecies] = ClassificationExtration(handles.data_file);
   net = handles.currentClassificationNN;
   %input = inputfromImageExtration(handles.currentImage, handles.scale);  
   
   %Image Extration of Features
            points = detectHarrisFeatures(handles.currentImage);
            points = points.selectStrongest(handles.scale).Location;
            
            points = points(:);
            points = points(1:1:20,:);
            input(:,1) = points;
   
   
   output = net(input)
   output = nnOutputToSpecieCode(output, species);
   set(handles.edit1, 'String', output);
   
   
   
end


% --- Executes during object creation, after setting all properties.
function imageDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate imageDisplay
