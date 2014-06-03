function varargout = interface(varargin)
    % INTERFACE MATLAB code for interface.fig
    %      INTERFACE, by itself, creates a new INTERFACE or raises the existing
    %      singleton*.
    %
    %      H = INTERFACE returns the handle to a new INTERFACE or the handle to
    %      the existing singleton*.
    %
    %      INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in INTERFACE.M with the given input arguments.
    %
    %      INTERFACE('Property','Value',...) creates a new INTERFACE or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before interface_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to interface_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @interface_OpeningFcn, ...
                       'gui_OutputFcn',  @interface_OutputFcn, ...
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

% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to interface (see VARARGIN)

    % Choose default command line output for interface
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes interface wait for user response (see UIRESUME)
    % uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(~, ~, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;

function playButton_Callback(~, ~, handles)
    f = get(handles.filePathName, 'String');
    
    [s, fs] = audioread(f);
    
    [~,b] = size(s);
    
    if b == 1
        plot(handles.AxisInLeft,s);
        plot(handles.AxisInRight,s);
    else
        plot(handles.AxisInLeft,s(:,1));
        plot(handles.AxisInRight,s(:,2));
    end
    
    echoButton = get(handles.echoButton, 'Value');
    echoSlider = get(handles.echoSlider, 'Value');
    echo = echoButton*echoSlider;
    
    reverbButton = get(handles.reverbButton, 'Value');
    reverbSlider = get(handles.reverbSlider, 'Value');
    reverb = reverbButton*reverbSlider;
    
    distButton = get(handles.distButton, 'Value');
    distSlider = get(handles.distSlider, 'Value');
    dist = distButton*distSlider;
    
    alfa = str2double(get(handles.alfa, 'String'));
    
    s = play(s, fs, alfa, echo, reverb, dist);
    
    if b == 1
        plot(handles.AxisOutLeft,s);
        plot(handles.AxisOutRight,s);
    else
        plot(handles.AxisOutLeft,s(:,1));
        plot(handles.AxisOutRight,s(:,2));
    end
    

function selectFile_Callback(~, ~, handles)
    [fileName path] = uigetfile('*.wav', 'Abrir Arquivo');
    
    if fileName ~= 0
        if path ~= 0
            set(handles.filePathName, 'String', strcat(path, fileName));
        end
    end

function filePathName_CreateFcn(hObject, ~, ~)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function echoSlider_CreateFcn(hObject, ~, ~)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end

function echoSlider_Callback(~, ~, ~)

function echoButton_Callback(~, ~, ~)

function reverbButton_Callback(~, ~, ~)

function reverbSlider_Callback(~, ~, ~)

function reverbSlider_CreateFcn(hObject, ~, ~)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end

function alfa_Callback(~, ~, ~)

function alfa_CreateFcn(hObject, ~, ~)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function distButton_Callback(~, ~, ~)

function distSlider_Callback(~, ~, ~)

function distSlider_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
