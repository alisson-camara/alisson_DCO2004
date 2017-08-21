function varargout = exemplo1(varargin)
% EXEMPLO1 MATLAB code for exemplo1.fig
%      EXEMPLO1, by itself, creates a new EXEMPLO1 or raises the existing
%      singleton*.
%
%      H = EXEMPLO1 returns the handle to a new EXEMPLO1 or the handle to
%      the existing singleton*.
%
%      EXEMPLO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXEMPLO1.M with the given input arguments.
%
%      EXEMPLO1('Property','Value',...) creates a new EXEMPLO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exemplo1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exemplo1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exemplo1

% Last Modified by GUIDE v2.5 19-Mar-2013 14:03:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exemplo1_OpeningFcn, ...
                   'gui_OutputFcn',  @exemplo1_OutputFcn, ...
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


% --- Executes just before exemplo1 is made visible.
function exemplo1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exemplo1 (see VARARGIN)

% Choose default command line output for exemplo1
handles.output = hObject;

% Update handles structure
handles.tempo = 0:0.1:6;
guidata(hObject, handles);
% UIWAIT makes exemplo1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exemplo1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.dominio_tempo);%seleciona janela dominio_frequencia como saida de graficos
y=get(handles.amplitude,'Value').*sin(get(handles.frequencia,'Value')*handles.tempo); % calcula o seno baseado nas informações dos sliders
plot(handles.tempo,y); %faz o gráfico!

axes(handles.dominio_frequencia); %seleciona janela dominio_frequencia como saida de graficos
Y = fft(y); % faz a FFT do seno calculado
Y(1)=[]; % elimina a posição 1 do vetor dda FFT, uma vez que a primeira posição é apenas o valor da soma das componentes
Y_mag = abs(Y); % Calcula a magnitude da transformada
plot(Y_mag); % Faz o gráfico da amplitude da FFT do seno em relação ao número de amostras

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function frequencia_Callback(hObject, eventdata, handles)
% hObject    handle to frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.dominio_tempo);
y=get(handles.amplitude,'Value').*sin(get(handles.frequencia,'Value')*handles.tempo);
plot(handles.tempo,y);

axes(handles.dominio_frequencia);
Y = fft(y);
Y(1)=[];
Y_mag = abs(Y);
plot(Y_mag);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function frequencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
