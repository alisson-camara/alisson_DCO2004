function varargout = piano(varargin)
% PIANO MATLAB code for piano.fig
%      PIANO, by itself, creates a new PIANO or raises the existing
%      singleton*.
%
%      H = PIANO returns the handle to a new PIANO or the handle to
%      the existing singleton*.
%
%      PIANO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIANO.M with the given input arguments.
%
%      PIANO('Property','Value',...) creates a new PIANO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before piano_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to piano_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help piano

% Last Modified by GUIDE v2.5 27-Aug-2017 02:03:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @piano_OpeningFcn, ...
                   'gui_OutputFcn',  @piano_OutputFcn, ...
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


% --- Executes just before piano is made visible.
function piano_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to piano (see VARARGIN)

% Choose default command line output for piano
handles.output = hObject;

handles.tf =1;
handles.tf = 1;                   % Tempo de dura��o da nota
handles.fc = 512;                 % Frequ�ncia da nota D�
handles.fs = 100*handles.fc;              % Frequ�ncia de amostragem da nota. 
handles.t = 0:1/handles.fs:handles.tf;            % Vetor tempo. Para cada elemento do vetor t, haver� um elemento em y correspondente.
handles.A = 1;                    % Amplitude do sinal
handles.yDo=handles.A*cos(2*pi*handles.fc*handles.t); % Sinal senoidal
handles.notaDo = audioplayer(handles.yDo, handles.fs);
handles.yRe =handles.A*cos(2*pi*(9/8)*handles.fc*handles.t); % Sinal senoidal
handles.notaRe = audioplayer(handles.yRe, handles.fs);
handles.yMi =handles.A*cos(2*pi*(5/4)*handles.fc*handles.t); % Sinal senoidal
handles.notaMi = audioplayer(handles.yMi, handles.fs);
handles.yFa =handles.A*cos(2*pi*(4/3)*handles.fc*handles.t); % Sinal senoidal
handles.notaFa = audioplayer(handles.yFa, handles.fs);
handles.ySol =handles.A*cos(2*pi*(3/2)*handles.fc*handles.t); % Sinal senoidal
handles.notaSol = audioplayer(handles.ySol, handles.fs);
handles.yLa =handles.A*cos(2*pi*(5/3)*handles.fc*handles.t); % Sinal senoidal
handles.notaLa = audioplayer(handles.yLa, handles.fs);
handles.ySi =handles.A*cos(2*pi*(15/8)*handles.fc*handles.t); % Sinal senoidal
handles.notaSi = audioplayer(handles.ySi, handles.fs);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes piano wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = piano_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in do.
function do_Callback(hObject, eventdata, handles)
% hObject    handle to do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaDo);                              % Reproduzir o sinal gerado
       %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.yDo);
        axis([0 0.02 -2 2 ]);

% --- Executes on button press in re.
function re_Callback(hObject, eventdata, handles)
% hObject    handle to re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaRe);                              % Reproduzir o sinal gerado
        %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.yRe);
        axis([0 0.02 -2 2 ]);

% --- Executes on button press in mi.
function mi_Callback(hObject, eventdata, handles)
% hObject    handle to mi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaMi);                              % Reproduzir o sinal gerado
       %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.yMi);
        axis([0 0.02 -2 2 ]);

% --- Executes on button press in fa.
function fa_Callback(hObject, eventdata, handles)
% hObject    handle to fa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaFa);                              % Reproduzir o sinal gerado
        %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.yFa);
        axis([0 0.02 -2 2 ]);

% --- Executes on button press in sol.
function sol_Callback(hObject, eventdata, handles)
% hObject    handle to sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaSol);                              % Reproduzir o sinal gerado
        %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.ySol);
        axis([0 0.02 -2 2 ]);

% --- Executes on button press in la.
function la_Callback(hObject, eventdata, handles)
% hObject    handle to la (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaLa);                              % Reproduzir o sinal gerado
        %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.yLa);
        axis([0 0.02 -2 2 ]);

% --- Executes on button press in si.
function si_Callback(hObject, eventdata, handles)
% hObject    handle to si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        play(handles.notaSi);                              % Reproduzir o sinal gerado
        %pause(handles.tf);
        axes(handles.onda);
        plot(handles.t,handles.ySi);
        axis([0 0.02 -2 2 ]);
