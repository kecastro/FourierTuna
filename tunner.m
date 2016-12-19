%Guitar

function varargout = tunner(varargin)
% TUNNER MATLAB code for tunner.fig
%      TUNNER, by itself, creates a new TUNNER or raises the existing
%      singleton*.
%
%      H = TUNNER returns the handle to a new TUNNER or the handle to
%      the existing singleton*.
%
%      TUNNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUNNER.M with the given input arguments.
%
%      TUNNER('Property','Value',...) creates a new TUNNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tunner_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tunner_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tunner

% Last Modified by GUIDE v2.5 19-Nov-2016 21:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tunner_OpeningFcn, ...
                   'gui_OutputFcn',  @tunner_OutputFcn, ...
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

% --- Executes just before tunner is made visible.
function tunner_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tunner (see VARARGIN)

% Choose default command line output for tunner
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global audio1fs;
global audio1;
global audio2fs;
global audio2;

[audio1,audio1fs] = audioread('media/tensar.m4a');
[audio2,audio2fs] = audioread('media/destensar.m4a');
% UIWAIT makes tunner wait for user response (see UIRESUME)
% uiwait(handles.figure1);
lg = imread('media/logo.png');
axes(handles.logo);
imshow(lg);


% --- Outputs from this function are returned to the command line.
function varargout = tunner_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','On');
set(handles.uipanel2,'Visible','Off');
set(handles.text5,'Visible','Off');
set(handles.text6,'Visible','Off');
set(handles.text1,'Visible','On');
set(handles.mensaje,'Visible','On');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'Visible','Off');
set(handles.uipanel2,'Visible','On');
set(handles.text1,'Visible','Off');
set(handles.mensaje,'Visible','Off');
set(handles.text5,'Visible','On');
set(handles.text6,'Visible','On');

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global audio1fs;
global audio1;
global audio2fs;
global audio2;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text11, 'Visible', 'off');
set(handles.text8, 'Visible', 'off');
set(handles.text14, 'Visible', 'off');
set(handles.text15, 'Visible', 'off');
set(handles.mensaje,'String','');
handles.String='Grababdo';
set(handles.pushbutton1,'String','Grabando 3 segundos....');
set(handles.pushbutton1,'ForegroundColor','red');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Frecuencia de las notas en Hz%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

E2 = 82.407;  %Mi
A2 = 110.00;  %LA
D3 = 146.832; %RE
G3 = 195.998; %SOL
B3 = 246.942; %SI
E4 = 329.628; %MI

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Parnmetros de la grabacion%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%`
Fs=1000;                                % Frecuencia de muestreo
nBits = 16;                             % Bits por muestreo
nChannels = 1;                          % Numero de canales: 1-Mono, 2-Stereo
timeRecord = 3;                         % Tiempo de grabacinn en segundos

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Grabando...%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
recObj = audiorecorder(Fs, nBits, nChannels);% Crea un objeto para grabar el audioexterior
recordblocking(recObj, timeRecord);     % Graba el sonido en recObj durante 5segundos
myRecordingBeforeFilter = getaudiodata(recObj);     % Obtiene el audio almacenado en recObj de forma digital y lo guarda en el arreglo myRecording

%Filtro BandPass
order    = 10;
fcutlow  = 70;
fcuthigh = 450;
[b,a]    = butter(order,[fcutlow fcuthigh]/(Fs/2), 'bandpass');
myRecording = filter(b,a,myRecordingBeforeFilter);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Transformando al dominio de f%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[i j] = size(myRecording);              % i: Numero de filas del vector myRecording (tamano de la senal) - j: Numero de columnas (canales usados en la grabacinn)
NFFT = 2^nextpow2(i);                   % Optimiza la fft
fastFT = fft(myRecording, NFFT)/i;      % Se hace uso de la funcion fft (fast fouriertransform) para hacer una conversinn al dominio de la frecuencia
f = Fs/2*linspace(0,1,NFFT/2+1);        % Se toman muestras equidistantes para modelar el eje x de la frecuencia
Y = 2*abs(fastFT(1:NFFT/2+1));          % Corresponde al eje |Y(f)| de la grnfica dela fft

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Graficando%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%handles.axes1=plot(handles.axes1,Fs*t(1:timeRecord*1000),myRecording(1:timeRecord*1000));   % Grafica en el tiempo la senal myRecording
handles.axes1=plot(handles.axes1,myRecording);

handles.axes2=plot(handles.axes2,f,Y);           % Grafica la senal de entrada en el dominio de Fourier                              % Nombre del eje y del grafico generado

musicalNoteFrequency = f(Y == max(Y));           % Frecuencia fundamental del audio almacenado

chord = get(handles.popupmenu1,'Value');         % Trae el valor del menu desplegable de la cuerda seleccionada por el usuario.
tensar=imread('media/tensar.png');
destensar=imread('media/destensar.png');
ok = imread('media/ok.png');

axes(handles.logo);
set(gca,'visible','off')
set(get(gca,'children'),'visible','off')


set(handles.text12, 'Visible', 'on');
set(handles.text13, 'Visible', 'on');
set(handles.mensaje, 'Visible', 'on');

set(handles.text11, 'Visible', 'on');
set(handles.text8, 'Visible', 'on');
set(handles.text14, 'Visible', 'on');
set(handles.text15, 'Visible', 'on');


axes(handles.afinarImg);
switch chord                                     %Segun la cuerda que se haya elegido se realiza la respectiva comparacion de las frecuencias fundamentales
    case 1                                                                 % Cuerda 1 (MI)
        set(handles.text8,'String',musicalNoteFrequency);
        set(handles.text15,'String','329.628');
        if abs(musicalNoteFrequency - E4) < 2                              % Se da una tolerancia de 2Hz por encima o por debajo de la nota
            imshow(ok);
            set(handles.mensaje,'String','Cuerda 1 afinada en MI');         % Los mensajes se muestran en el cuadro de texto estatico ubicado sobre el boton "Afinar!" 
        elseif (musicalNoteFrequency - E4) < 0                           % Si la frecuencia de la cuerda es menor a la ideal
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tensar cuerda');
        elseif (musicalNoteFrequency - E4) > 0                           % Si la frecuencia fundamental de la cuerda es mayor a la ideal
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Destensar cuerda');
        
        end
      
    case 2                                                                 % Cuerda 2 (SI)
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','246.942');
        if abs(musicalNoteFrequency - B3) < 2                              % Se da una tolerancia de 2Hz por encima o por debajo de la nota
            imshow(ok);
            set(handles.mensaje,'String','Cuerda 2 afinada en SI');         % Los mensajes se muestran en el cuadro de texto estntico ubicado sobre el boton "Afinar!" 
        elseif (musicalNoteFrequency - B3) < 0                             % Si la frecuencia de la cuerda es menor a la ideal
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tensar cuerda');
        elseif (musicalNoteFrequency - B3) > 0                             % Si la frecuencia fundamental de la cuerda es mayor a la ideal
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Destensar cuerda');
        end
        
    case 3                                                                 % Cuerda 3 (SOL)
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','195.998');
        if abs(musicalNoteFrequency - G3) < 2                              % Se da una tolerancia de 2Hz por encima o por debajo de la nota
            imshow(ok);
            set(handles.mensaje,'String','Cuerda 3 afinada en SOL');        % Los mensajes se muestran en el cuadro de texto estntico ubicado sobre el boton "Afinar!" 
        elseif (musicalNoteFrequency - G3) < 0                             % Si la frecuencia de la cuerda es menor a la ideal
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tensar cuerda');
        elseif (musicalNoteFrequency - G3) > 0                             % Si la frecuencia fundamental de la cuerda es mayor a la ideal
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Destensar cuerda');
        end
         
    case 4                                                                 % Cuerda 4 (RE)
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','146.832');
        if abs( musicalNoteFrequency - D3) < 2                              % Se da una tolerancia de 2Hz por encima o por debajo de la nota
            imshow(ok);
            set(handles.mensaje,'String','Cuerda 4 afinada en RE');         % Los mensajes se muestran en el cuadro de texto estntico ubicado sobre el boton "Afinar!" 
        elseif ( musicalNoteFrequency - D3) < 0                             % Si la frecuencia de la cuerda es menor a la ideal
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tensar cuerda');
        elseif ( musicalNoteFrequency - D3) > 0                             % Si la frecuencia fundamental de la cuerda es mayor a la ideal
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Destensar cuerda');
        end
         
    case 5                                                                 % Cuerda 5 (LA)
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','110.00');
        if abs(musicalNoteFrequency - A2) < 2                              % Se da una tolerancia de 2Hz por encima o por debajo de la nota
            imshow(ok);
            set(handles.mensaje,'String','Cuerda 5 afinada en LA');         % Los mensajes se muestran en el cuadro de texto estntico ubicado sobre el boton "Afinar!" 
        elseif (musicalNoteFrequency - A2) < 0                             % Si la frecuencia de la cuerda es menor a la ideal
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tensar cuerda');
        elseif (musicalNoteFrequency - A2) > 0                             % Si la frecuencia fundamental de la cuerda es mayor a la ideal
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Destensar cuerda');
        end
         
    case 6                                                                 % Cuerda 6 (MI)
        set(handles.text8,'String', musicalNoteFrequency);
        set(handles.text15,'String','82.407');
        if abs(musicalNoteFrequency - E2) < 2                              % Se da una tolerancia de 2Hz por encima o por debajo de la nota
            imshow(ok);
            set(handles.mensaje,'String','Cuerda 6 afinada en MI');         % Los mensajes se muestran en el cuadro de texto estntico ubicado sobre el boton "Afinar!" 
        elseif (musicalNoteFrequency - E2) < 0                             % Si la frecuencia de la cuerda es menor a la ideal
            imshow(tensar);
            sound(audio1, audio1fs);
            set(handles.mensaje,'String','Tensar cuerda');
        elseif (musicalNoteFrequency - E2) > 0                             % Si la frecuencia fundamental de la cuerda es mayor a la ideal
            imshow(destensar);
            sound(audio2, audio2fs);
            set(handles.mensaje,'String','Destensar cuerda');
        end                 
end


set(handles.pushbutton1,'ForegroundColor','black');
set(handles.pushbutton1,'String','Afinar!');
