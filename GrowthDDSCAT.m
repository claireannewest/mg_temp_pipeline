function varargout = WulffDDSCAT(varargin)

%Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @WulffDDSCAT_OpeningFcn, ...
    'gui_OutputFcn',  @WulffDDSCAT_OutputFcn, ...
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
%End initialization code - DO NOT EDIT

% --- Executes just before WulffDDSCAT is made visible.
function WulffDDSCAT_OpeningFcn(hObject,~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WulffDDSCAT (see VARARGIN)

% Choose default command line output for WulffDDSCAT
handles.output = hObject;
set(hObject,'toolbar','figure');

% Update handles structure
guidata(hObject, handles);
cla

% axes(handles.logo_axes);
% imshow(hObject,'ON_Logo_draft2.png')

axes(handles.logo_axes)
matlabImage = imread('ON_Logo_white.png');
image(matlabImage)
axis off
axis image

axes(handles.wolf_axes)
matlabImage = imread('Wulff_logo_inverted.jpg');
image(matlabImage)
axis off
axis image

axes(handles.label_basicpar_0001);
text('Interpreter','LaTex','string','$0 0 0 1$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.label_basicpar_10_10);
text('Interpreter','LaTex','string','$1 0 \bar{1} 0$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.label_basicpar_10_11);
text('Interpreter','LaTex','string','$1 0 \bar{1} 1$','FontSize',14,...
    'Color','white','FontName','Arial')

axes(handles.pb_label_10_11);
text('Interpreter','LaTex','string','$1 0 \bar{1} 1$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.pb_label_10_12);
text('Interpreter','LaTex','string','$1 0 \bar{1} 2$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.pb_label_10_13);
text('Interpreter','LaTex','string','$1 0 \bar{1} 3$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.pb_label_11_21);
text('Interpreter','LaTex','string','$1 1 \bar{2} 1$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.pb_label_11_22);
text('Interpreter','LaTex','string','$1 1 \bar{2} 2$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.pb_label_11_23);
text('Interpreter','LaTex','string','$1 1 \bar{2} 3$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.pb_label_11_24);
text('Interpreter','LaTex','string','$1 1 \bar{2} 4$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.label_basicpar_0001);
text('Interpreter','LaTex','string','$0 0 0 1$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.label_basicpar_10_10);
text('Interpreter','LaTex','string','$1 0 \bar{1} 0$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.label_basicpar_10_11);
text('Interpreter','LaTex','string','$1 0 \bar{1} 1$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.label_basicpar_11_20);
text('Interpreter','LaTex','string','$1 1 \bar{2} 0$','FontSize',14,...
    'Color','white','FontName','Arial')
axis off

axes(handles.blank_axes);
axis off

% Set crystal type drop down to FCC (initialization)
set(handles.crystalType_popupmenu,'Value',1);
buttons_list_fcc = [handles.singlecrystal_radio_selector, handles.monotwin_radio_selector,  ...
    handles.pentatwin_radio_selector];
set(buttons_list_fcc, 'Visible', 'on');
buttons_list_hcp = [handles.HCP_single_radiobutton, handles.HCP_10_11_radiobutton, handles.HCP_10_12_radiobutton, ...
    handles.HCP_10_13_radiobutton,handles.HCP_11_21_radiobutton,handles.HCP_11_22_radiobutton, ...
    handles.HCP_11_23_radiobutton,handles.HCP_11_24_radiobutton,];
set(buttons_list_hcp, 'Visible', 'off');
set(handles.uipanel20,'Visible','off');
set(handles.uipanel21,'Visible','off');
set(handles.Basicparameters,'Visible','on');
set(handles.Basicparameters_hcp,'Visible','off');
set(handles.help_basicparams_pushbutton,'Visible','on');
set(handles.help_basicparams_hcp_pushbutton,'Visible','off');
set(handles.singlecrystal_radio_selector, 'Value', 1);
set(handles.text6, 'enable', 'off'); 
set(handles.reentrantenhancement, 'enable', 'off'); 
set(handles.text18, 'enable', 'off'); 
set(handles.twinenhancement, 'enable', 'off'); 
set(handles.text21, 'enable', 'off'); 
set(handles.disclinationenhancement, 'enable', 'off');
set(handles.help_twinning_pushbutton,'Visible','on');
set(handles.help_twinning_hcp_pushbutton,'Visible','off');
set(handles.ac_panel,'Visible','off');
set(handles.calcbound, 'String', '20');
set(handles.EffRadiusCalc, 'enable', 'off');
set(handles.dipoles_distance, 'enable', 'off');
set(handles.CreateShell, 'enable', 'off');
set(handles.DDSCATdipolescreate, 'enable', 'off');
set(handles.DDSCATgenerateparfile, 'enable', 'off');
guidata(hObject, handles);
cla

% --- Outputs from this function are returned to the command line.
function varargout = WulffDDSCAT_OutputFcn(~,~, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(~, ~, ~)


% -------------------------------------------------------------------------
% ---------------------------CRYSTAL TYPE----------------------------------
% -------------------------------------------------------------------------


% --- Executes on selection change in crystalType_popupmenu.
function crystalType_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to crystalType_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns crystalType_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from crystalType_popupmenu

switch get(handles.crystalType_popupmenu,'Value')
    case 1 % FCC
        set(handles.Basicparameters,'Visible','on');
        set(handles.Basicparameters_hcp,'Visible','off');
        buttons_list_fcc = [handles.singlecrystal_radio_selector, handles.monotwin_radio_selector,  ...
            handles.pentatwin_radio_selector];
        set(buttons_list_fcc, 'Visible', 1);
        buttons_list_hcp = [handles.HCP_single_radiobutton, handles.HCP_10_11_radiobutton, handles.HCP_10_12_radiobutton, ...
            handles.HCP_10_13_radiobutton,handles.HCP_11_21_radiobutton,handles.HCP_11_22_radiobutton, ...
            handles.HCP_11_23_radiobutton,handles.HCP_11_24_radiobutton,];
        set(buttons_list_hcp, 'Visible', 0);
        set(handles.singlecrystal_radio_selector, 'Value', 1);
        set(handles.text6, 'enable', 'off'); 
        set(handles.reentrantenhancement, 'enable', 'off'); 
        set(handles.text18, 'enable', 'off'); 
        set(handles.twinenhancement, 'enable', 'off'); 
        set(handles.text21, 'enable', 'off'); 
        set(handles.disclinationenhancement, 'enable', 'off');
        set(handles.uipanel20,'Visible','off');
        set(handles.uipanel21,'Visible','off');
        set(handles.calcbound, 'String', '20');
        set(handles.help_basicparams_pushbutton,'Visible','on')
        set(handles.help_basicparams_hcp_pushbutton,'Visible','off')
        set(handles.help_twinning_pushbutton,'Visible','on')
        set(handles.help_twinning_hcp_pushbutton,'Visible','off')
        set(handles.ac_panel,'Visible','off')
        
    case 2 % HCP
        set(handles.Basicparameters,'Visible','off');
        set(handles.Basicparameters_hcp,'Visible','on');
        buttons_list_fcc = [handles.singlecrystal_radio_selector, handles.monotwin_radio_selector,  ...
            handles.pentatwin_radio_selector];
        set(buttons_list_fcc, 'Visible', 0);
        buttons_list_hcp = [handles.HCP_single_radiobutton, handles.HCP_10_11_radiobutton, handles.HCP_10_12_radiobutton, ...
            handles.HCP_10_13_radiobutton,handles.HCP_11_21_radiobutton,handles.HCP_11_22_radiobutton, ...
            handles.HCP_11_23_radiobutton,handles.HCP_11_24_radiobutton,];
        set(buttons_list_hcp, 'Visible', 1);
        set(handles.HCP_single_radiobutton, 'Value', 1);
        set(handles.text39, 'enable', 'off'); 
        set(handles.reentrantenhancement_hcp, 'enable', 'off'); 
        set(handles.text44, 'enable', 'off'); 
        set(handles.twinenhancement_hcp, 'enable', 'off'); 
        set(handles.text43, 'enable', 'off'); 
        set(handles.disclinationenhancement_hcp, 'enable', 'off');
        set(handles.uipanel20,'Visible','on');
        set(handles.uipanel21,'Visible','on');
        set(handles.calcbound, 'String', '20');
        set(handles.help_basicparams_pushbutton,'Visible','off')
        set(handles.help_basicparams_hcp_pushbutton,'Visible','on')
        set(handles.help_twinning_pushbutton,'Visible','off')
        set(handles.help_twinning_hcp_pushbutton,'Visible','on')
        set(handles.ac_panel,'Visible','on')
end

% --- Executes during object creation, after setting all properties.
function crystalType_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to crystalType_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% -------------------------------------------------------------------------
% ------------------------BASIC INPUT--------------------------------------
% --------------------------- FCC -----------------------------------------
% -------------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function Basicparameters_CreateFcn(~, ~, ~)

function input100_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
% If input is empty set value to 1
if (isempty(input))
    set(hObject,'String','1')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function input100_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input110_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 1
if (isempty(input))
    set(hObject,'String','1')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function input110_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input111_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 1
if (isempty(input))
    set(hObject,'String','1')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function input111_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function reentrantenhancement_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 0
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function reentrantenhancement_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function twinenhancement_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 0
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function twinenhancement_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function disclinationenhancement_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 0
if (isempty(input))
    set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function disclinationenhancement_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% -------------------------------------------------------------------------
% ------------------------BASIC INPUT--------------------------------------
% --------------------------- HCP -----------------------------------------
% -------------------------------------------------------------------------

function input0001_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function input0001_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input0001 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input10_10_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function input10_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input10_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input10_11_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function input10_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input10_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function reentrantenhancement_hcp_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function reentrantenhancement_hcp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to reentrantenhancement_hcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function twinenhancement_hcp_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function twinenhancement_hcp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to twinenhancement_hcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function disclinationenhancement_hcp_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function disclinationenhancement_hcp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to disclinationenhancement_hcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input11_20_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function input11_20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input11_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% -------------------------------------------------------------------------
% ---------------------------ADVANCED INPUT--------------------------------
% -------------------------------------------------------------------------


% --- Executes during object creation, after setting all properties.
function Advancedparameters_CreateFcn(~, ~, ~)

function calcstep_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 0.5
if (isempty(input))
    set(hObject,'String','0.5')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function calcstep_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function calcbound_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 10
if (isempty(input))
    set(hObject,'String','10')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function calcbound_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function smbox_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
% If input is empty set value to 3
if (isempty(input))
    set(hObject,'String','3')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function smbox_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function smbeta_Callback(hObject, ~, handles)
input = str2double(get(hObject,'String'));
%If input is empty set value to 5
if (isempty(input))
    set(hObject,'String','5')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function smbeta_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% -------------------------------------------------------------------------
% ------------------CRYSTALLOGRAPHY SELECTION BUTTONS----------------------
% -------------------------------------------------------------------------

function singlecrystal_radio_selector_CreateFcn(~,~,~)

% --- Executes on button press in radiobutton1.
function singlecrystal_radio_selector_Callback(hObject, eventdata, handles)
if get(handles.singlecrystal_radio_selector, 'Value')==1   
    set(handles.text6, 'enable', 'off'); 
    set(handles.reentrantenhancement, 'enable', 'off'); 
    set(handles.text18, 'enable', 'off'); 
    set(handles.twinenhancement, 'enable', 'off'); 
    set(handles.text21, 'enable', 'off'); 
    set(handles.disclinationenhancement, 'enable', 'off'); 
end
   
function monotwin_radio_selector_Callback(hObject, eventdata, handles)
if get(handles.monotwin_radio_selector, 'Value')==1
    set(handles.text6, 'enable', 'on'); 
    set(handles.reentrantenhancement, 'enable', 'on'); 
    set(handles.text18, 'enable', 'on'); 
    set(handles.twinenhancement, 'enable', 'on'); 
    set(handles.text21, 'enable', 'off'); 
    set(handles.disclinationenhancement, 'enable', 'off');
end

function pentatwin_radio_selector_Callback(hObject, eventdata, handles)
if get(handles.pentatwin_radio_selector, 'Value')==1   
    set(handles.text6, 'enable', 'on'); 
    set(handles.reentrantenhancement, 'enable', 'on'); 
    set(handles.text18, 'enable', 'on'); 
    set(handles.twinenhancement, 'enable', 'on'); 
    set(handles.text21, 'enable', 'on'); 
    set(handles.disclinationenhancement, 'enable', 'on');
end

function HCP_single_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_single_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'off'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'off'); 
    set(handles.text44, 'enable', 'off'); 
    set(handles.twinenhancement_hcp, 'enable', 'off'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off'); 
end

function HCP_10_11_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_10_11_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off'); 
end

function HCP_10_12_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_10_12_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off'); 
end

function HCP_10_13_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_10_13_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off'); 
end

function HCP_11_21_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_11_21_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off');  
end

function HCP_11_22_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_11_22_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off');  
end

function HCP_11_23_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_11_23_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off');  
end

function HCP_11_24_radiobutton_Callback(hObject, eventdata, handles)
if get(handles.HCP_11_24_radiobutton, 'Value')==1   
    set(handles.text39, 'enable', 'on'); 
    set(handles.reentrantenhancement_hcp, 'enable', 'on'); 
    set(handles.text44, 'enable', 'on'); 
    set(handles.twinenhancement_hcp, 'enable', 'on'); 
    set(handles.text43, 'enable', 'off'); 
    set(handles.disclinationenhancement_hcp, 'enable', 'off'); 
end


% -------------------------------------------------------------------------
% ---------------------LAYER PARAMETERS INPUT------------------------------
% -------------------------------------------------------------------------

function thick_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function thick_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in shapetypemenu.
function shapetypemenu_Callback(~, ~, ~)

% --- Executes during object creation, after setting all properties.
function shapetypemenu_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% -------------------------------------------------------------------------
% --------------------------ACTION BUTTONS---------------------------------
% -------------------------------------------------------------------------


% --- Executes on button press in createfigure.
function createfigure_Callback(hObject, eventdata, handles)

numberselected = get(handles.singlecrystal_radio_selector, 'Value') + ...
    get(handles.monotwin_radio_selector, 'Value') +...
    get(handles.pentatwin_radio_selector, 'Value') +...
    get(handles.HCP_single_radiobutton, 'Value') +...
    get(handles.HCP_10_11_radiobutton, 'Value') +...
    get(handles.HCP_10_12_radiobutton, 'Value') +...
    get(handles.HCP_10_13_radiobutton, 'Value') +...
    get(handles.HCP_11_21_radiobutton, 'Value') +...
    get(handles.HCP_11_22_radiobutton, 'Value') +...
    get(handles.HCP_11_23_radiobutton, 'Value') +...
    get(handles.HCP_11_24_radiobutton, 'Value') ;

if numberselected > 1
    errormessage = errordlg('Too many twinning types selected');
    
elseif numberselected < 1
    errormessage = errordlg('Please select a twinning type');
    
elseif get(handles.singlecrystal_radio_selector, 'Value')==1
    %FCC SINGLE CRYSTAL MODELING
    
    a_100 = get(handles.input100,'String');
    a_100 = str2double(a_100);
    a_110 = get(handles.input110,'String');
    a_110 = str2double(a_110);
    a_111 = get(handles.input111,'String');
    a_111 = str2double(a_111);
    
    [coordmatrix,iso] = fcc_singlecrystal(a_100, a_110, a_111, hObject, handles);
    if isempty(iso) == 1
        return
    end

    %create shape
    axes(handles.axes1)
    p = patch(iso);
    set(p,'FaceColor',[0.1,0.4,0.1],'EdgeColor','none');

    %Set appropriate lighting, color and orientation for figure
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    view(0,0);
    axis tight
    
elseif get(handles.monotwin_radio_selector, 'Value')==1
    %FCC MONOTWIN CRYSTAL MODELING
    a_100 = get(handles.input100,'String');
    a_100 = str2double(a_100);
    a_110 = get(handles.input110,'String');
    a_110 = str2double(a_110);
    a_111 = get(handles.input111,'String');
    a_111 = str2double(a_111);
    
    [coordmatrix,iso] = fcc_monotwin(a_100, a_110, a_111, 0, 0, 0, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape    
    axes(handles.axes1)
    p = patch(iso);
    set(p,'FaceColor',[0.6,0.1,0.1],'EdgeColor','none');

    %Set appropriate lighting, color and orientation for figure
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight   
    
elseif get(handles.pentatwin_radio_selector, 'Value')==1
	%FCC PENTATWIN CRYSTAL MODELING
    a_100 = get(handles.input100,'String');
    a_100 = str2double(a_100);
    a_110 = get(handles.input110,'String');
    a_110 = str2double(a_110);
    a_111 = get(handles.input111,'String');
    a_111 = str2double(a_111);
    
    [coordmatrix,iso] = fcc_pentatwin(a_100, a_110, a_111, 0, 0, 0, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
    set(p,'FaceColor',[0.2,0.4,0.6],'EdgeColor','none');

    %Set appropriate lighting, color and orientation for figure
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    axis tight
    view([-135,0]);
    camlight('headlight');
    view([45,-60])
    camlight('headlight');
    view([45,75]);
    camlight('headlight');
    view([-35,15]);
    camlight('headlight');
    view([90,-90,0]);
    
elseif get(handles.HCP_single_radiobutton, 'Value')==1
	%HCP SINGLE CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_singlecrystal(a_0001, a_10_10, a_10_11, a_11_20, hObject, handles);
    if isempty(iso) == 1
        return
    end
     
    %create shape
    axes(handles.axes1)
    p = patch(iso);

    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[0.8,0.8,0.8],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_10_11_radiobutton, 'Value')==1
    %HCP 10_11 TWINNED CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0,'10_11', 61.94,30, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[.1,.4,0.1],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_10_12_radiobutton, 'Value')==1
    %HCP 10_12 TWINNED CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0,'10_12', 43.2, 30, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[0.2,0.4,0.6],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_10_13_radiobutton, 'Value')==1 
    %HCP 10_13 TWINNED  CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0,'10_13', 32,30, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[0.6,0.1,0.1],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_11_21_radiobutton, 'Value')==1
    %HCP 11_21 TWINNED CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0,'11_21', 73,0, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[0.64,0.5,0.15],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_11_22_radiobutton, 'Value')==1
    %HCP 11_22 TWINNED CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0, '11_22', 58.4,0, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[0.45,0.25,0.50],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_11_23_radiobutton, 'Value')==1
    %HCP 11_23 TWINNED CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0, '11_23', 47.3, 0, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[1,0.41,0.16],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
elseif get(handles.HCP_11_24_radiobutton, 'Value')==1
    %HCP 11_24 TWINNED CRYSTAL MODELING
    a_0001 = get(handles.input0001,'String');
    a_0001 = str2double(a_0001);
    a_10_10 = get(handles.input10_10,'String');
    a_10_10 = str2double(a_10_10);
    a_10_11 = get(handles.input10_11,'String');
    a_10_11 = str2double(a_10_11);
    a_11_20 = get(handles.input11_20,'String');
    a_11_20 = str2double(a_11_20);
    
    [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, 0, 0, 0, 0,'11_24', 39.1,0, hObject, handles);
    if isempty(iso) == 1
        return
    end
    
    %create shape
    axes(handles.axes1)
    p = patch(iso);
        
    %set appropriate lighting, color and orientation for figure
    set(p,'FaceColor',[0.5,0.5,0.5],'EdgeColor','none');
    daspect([1 1 1])
    material([0.4,0.3,0.1]);
    lighting gouraud
    view(135,40);
    camlight(0,0);
    camlight(0,0);
    view(315,0);
    camlight(0,0);
    view(230,0);
    camlight(0,0);
    view(135,-40);
    camlight(0,0);
    axis tight
    axis equal
    
else
    errormessage = errordlg('An error occured; please check input variables');
end

set(handles.EffRadiusCalc, 'enable', 'on');
% set(handles.dipoles_distance, 'enable', 'off');
% set(handles.CreateShell, 'enable', 'off');
set(handles.DDSCATdipolescreate, 'enable', 'on');
% set(handles.DDSCATgenerateparfile, 'enable', 'off');

setappdata(handles.EffRadiusCalc, 'coordmatrix', coordmatrix);
setappdata(handles.DDSCATdipolescreate, 'coordmatrix', coordmatrix);
setappdata(handles.CreateShell, 'coordmatrix', coordmatrix);

% --- Executes on button press in EffRadiusCalc.
function EffRadiusCalc_Callback(~, ~, handles)
% hObject    handle to EffRadiusCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

step=get(handles.calcstep,'String');
step=str2double(step);
coordmatrix = getappdata(handles.EffRadiusCalc,'coordmatrix');
if isempty(coordmatrix) == 1
    h = msgbox(strcat('Dipole matrix not found. Please create shape file first.'));
    movegui(h,'center');
    return
end

%Ask for user input
fig  = uifigure('Name','Size Input (do NOT close this window)','NumberTitle','off','Visible','off', ...
    'Position',[0 0 600 130]);

inst1 = uilabel(fig,'FontName','Arial','FontSize',13,'Position',[20 50 580 22], ...
    'text',"Click on the shape to select two points with known distance. To select the second point hold Shift.");
inst2 = uilabel(fig,'FontSize',13,'Position',[20 30 450 22], ...
    'text',"Press enter to continue.");

distlabel = uilabel(fig,'FontName','Arial','FontSize',13,'Position',[20 90 400 22], ...
    'text',"Enter the desired distance (in nanometers) between the two points.");
dist = uieditfield(fig,'numeric','FontSize',13,'Position',[420 90 80 22], ...
    'value',50);

cursorobj= datacursormode(gcf);
cursorobj.SnapToDataVertex = 'on';

movegui(fig,'center');
fig.Visible = 'on';

while ~waitforbuttonpress
    %Click on figure to activate press enter to exit
    cursorobj.Enable = 'on'; %data cursor on, hold alt for multiple points
end

dist_new = dist.Value/1000;
close(fig)

cursorobj.Enable = 'off';
mypoints = getCursorInfo(cursorobj);
mypointsmat = cell2mat({mypoints.Position}');
xp = squeeze(mypointsmat(:,1));
yp = squeeze(mypointsmat(:,2));
zp = squeeze(mypointsmat(:,3));

dist_old = sqrt((xp(1)-xp(2))*(xp(1)-xp(2)) ...
    +(yp(1)-yp(2))*(yp(1)-yp(2)) ...
    +(zp(1)-zp(2))*(zp(1)-zp(2)));

ratio = dist_new / dist_old;


%Effective radius calculation
% [TriIdx, Vol] = convhull(coordmatrix(:,1),coordmatrix(:,2), ...
%     coordmatrix(:,3));
Vol = length(coordmatrix)*step^3;

NewVol = Vol * ratio^3;
EffR = (3*NewVol/(4*pi))^(1./3);
intdist = step*ratio*1000;

%Make effective radius availbale for following functions
setappdata(handles.dipoles_distance, 'ratio', ratio);
setappdata(handles.CreateShell, 'ratio', ratio);
setappdata(handles.DDSCATgenerateparfile, 'EffR', EffR);

figure(gcf);
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
h = msgbox({strcat('The effective radius has been calculated: ',...
    num2str(EffR),' microns; \newline'),...
    '',...
    strcat('The corresponding interdipole distance is: ', ...
    num2str(intdist,'%.2f'), ' nm')},  CreateStruct);
movegui(h,'center');

set(handles.dipoles_distance, 'enable', 'on');
set(handles.CreateShell, 'enable', 'on');
set(handles.DDSCATdipolescreate, 'enable', 'on');
set(handles.DDSCATgenerateparfile, 'enable', 'on');

% --- Executes on button press in dipoles_distance.
function dipoles_distance_Callback(hObject, eventdata, handles)
% hObject    handle to dipoles_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ratio = getappdata(handles.dipoles_distance, 'ratio');

fig  = uifigure('Name','Dipole Length Input','NumberTitle','off', ...
    'Visible','off','Position',[0 0 600 130]);

lengthlabel = uilabel(fig,'FontName','Arial','FontSize',13,'Position',[20 90 400 22], ...
    'text',"Enter the desired dipole length (in nanometers)");
length = uieditfield(fig,'numeric','FontSize',13,'Position',[420 90 80 22], ...
    'value',2);

savebutton = uibutton(fig,'FontName','Arial','FontSize',13,'Position',[250 40 100 22],'Text','Calculate',...
    'ButtonPushedFcn',@(savebutton,event) calc_new_par(savebutton,event, ...
    hObject,eventdata,handles,fig,ratio,length));

movegui(fig,'center');
fig.Visible = 'on';

%Create ButtonPushedFcn callback
function calc_new_par(~,~,hObject,eventdata,handles,fig,ratio,...
    length)

bound=get(handles.calcbound,'String'); 
bound=str2double(bound);

step = length.Value/1000/ratio;
elements = bound/step;
elements = floor(elements);

if mod(elements,2) ~= 0
    elements = elements + 1;
end

step = round(step,4);
bound = step * elements;
bound = round(bound,4);

bound = num2str(bound,'%.4f');
step = num2str(step,'%.4f');
set(handles.calcbound,'String',bound);
set(handles.calcstep,'String',step);

close(fig)

cla
createfigure_Callback(hObject, eventdata, handles)

% --- Executes on button press in CreateShell.
function CreateShell_Callback(hObject, eventdata, handles)
% hObject    handle to CreateShell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ratio = getappdata(handles.CreateShell, 'ratio');
coordmatrixcore = getappdata(handles.CreateShell, 'coordmatrix');
thickness=get(handles.thick,'String');
thickness=str2double(thickness)/1000; %convert to um

if thickness == 0
    errormessage = errordlg('No thickness input');
else
    
    axes(handles.axes1)
    cla

switch get(handles.crystalType_popupmenu,'Value')
    case 1
        
        a_100 = get(handles.input100,'String');
        a_100 = str2double(a_100);
        a_100_old = a_100;
        a_110 = get(handles.input110,'String');
        a_110 = str2double(a_110);
        a_110_old = a_110;
        a_111 = get(handles.input111,'String');
        a_111 = str2double(a_111);
        a_111_old = a_111;

        step=get(handles.calcstep,'String');
        step=str2double(step);
              
        a_100 = a_100 + thickness/ratio;
        a_110 = a_110 + thickness/ratio;
        a_111 = a_111 + thickness/ratio;
        
        if get(handles.singlecrystal_radio_selector, 'Value')==1
            %FCC SINGLE CRYSTAL MODELING
            [coordmatrix,iso] = fcc_singlecrystal(a_100, a_110, a_111, hObject, handles);
            if isempty(iso) == 1
                return
            end
            coordmatrixALL = coordmatrix;
            coordmatrixshell = setdiff(coordmatrixALL,coordmatrixcore,'rows');
            
            %Find centroid in y
            Npoints=length(coordmatrix);
            yadd = 0;

            for ii = 1:Npoints
                yadd = yadd + coordmatrix(ii,2);
            end
            ynot = yadd / Npoints;
            
            %Get the half section points for both core and thick
            halfshell = coordmatrixshell(coordmatrixshell(:,2)>ynot,:);
            halfin = coordmatrixcore(coordmatrixcore(:,2)>ynot,:); 
            
            %Define plot handles and plot points
            axes(handles.axes1)
            hold on
            scatter3(halfshell(:,1),halfshell(:,2),halfshell(:,3), ...
                'MarkerFaceColor',[0.1,0.4,0.1],...
                'MarkerEdgeColor','none');
            
            hold on
            scatter3(halfin(:,1),halfin(:,2),halfin(:,3), ...
                'MarkerFaceColor',[0.9, 0.7, 0.1],...
                'MarkerEdgeColor','none');

        elseif get(handles.monotwin_radio_selector, 'Value')==1
            %FCC MONOTWIN CRYSTAL MODELING
            [coordmatrix,iso] = fcc_monotwin(a_100, a_110, a_111, a_100_old, a_110_old, a_111_old, hObject, handles);
            if isempty(iso) == 1
                return
            end
            coordmatrixALL = coordmatrix;
            coordmatrixshell = setdiff(coordmatrixALL,coordmatrixcore,'rows');
            
            %Find centroid
            Npoints=length(coordmatrixALL);
            xadd = 0; yadd = 0; zadd = 0;

            for ii = 1:Npoints
                xadd = xadd + coordmatrixALL(ii,1);
                yadd = yadd + coordmatrixALL(ii,2);
                zadd = zadd + coordmatrixALL(ii,3);
            end

            xnot = xadd / Npoints;
            ynot = yadd / Npoints;
            znot = zadd / Npoints;
            
            %Get the half section points for both core and thick
            halfshell = coordmatrixshell(coordmatrixshell(:,1) + coordmatrixshell(:,2)+coordmatrixshell(:,3) < ...
                        xnot + ynot + znot,:);
            halfin = coordmatrixcore(coordmatrixcore(:,1) + coordmatrixcore(:,2)+ coordmatrixcore(:,3) < ...
                        xnot + ynot + znot,:);
            
            %Define plot handles and plot points
            axes(handles.axes1)
            hold on
            scatter3(halfshell(:,1),halfshell(:,2),halfshell(:,3), ...
                'MarkerFaceColor',[0.6,0.1,0.1],...
                'MarkerEdgeColor','none');
            
            hold on
            scatter3(halfin(:,1),halfin(:,2),halfin(:,3), ...
                'MarkerFaceColor',[0.9, 0.7, 0.1],...
                'MarkerEdgeColor','none');

        elseif get(handles.pentatwin_radio_selector, 'Value')==1
            %FCC PENTATWIN CRYSTAL MODELING
            [coordmatrix,iso] = fcc_pentatwin(a_100, a_110, a_111, a_100_old, a_110_old, a_111_old, hObject, handles);
            if isempty(iso) == 1
                return
            end
            coordmatrixALL = coordmatrix;
            coordmatrixshell = setdiff(coordmatrixALL,coordmatrixcore,'rows');
            
            %Find centroid
            Npoints=length(coordmatrixALL);
            xadd = 0; yadd = 0;

            for ii = 1:Npoints
                xadd = xadd + coordmatrixALl(ii,1);
                yadd = yadd + coordmatrixALL(ii,2);
            end
            xnot = xadd / Npoints;
            ynot = yadd / Npoints;
                        
            %Get the points for half the shape for both core and shell
            halfshell = coordmatrixshell(coordmatrixshell(:,1) - coordmatrixshell(:,2) < xnot - ynot,:);
            halfin = coordmatrixcore(coordmatrixcore(:,1) - coordmatrixcore(:,2) < xnot - ynot,:);
            
            %Define plot handles and plot points
            axes(handles.axes1)
            hold on
            scatter3(halfshell(:,1),halfshell(:,2),halfshell(:,3),20, ...
                'MarkerFaceColor',[0.2,0.4,0.6],...
                'MarkerEdgeColor','none');
            
            hold on
            scatter3(halfin(:,1),halfin(:,2),halfin(:,3),20, ...
                'MarkerFaceColor',[0.9, 0.7, 0.1],...
                'MarkerEdgeColor','none');
        end          
        
    case 2
        a_0001 = get(handles.input0001,'String');
        a_0001 = str2double(a_0001);
        a_0001_old = a_0001;
        a_10_10 = get(handles.input10_10,'String');
        a_10_10 = str2double(a_10_10);
        a_10_10_old = a_10_10;
        a_10_11 = get(handles.input10_11,'String');
        a_10_11 = str2double(a_10_11);
        a_10_11_old = a_10_11;
        a_11_20 = get(handles.input11_20,'String'); 
        a_11_20 = str2double(a_11_20);
        a_11_20_old = a_11_20;
        step=get(handles.calcstep,'String');
        step=str2double(step);
        aaxis_in=get(handles.hcp_a,'String');
        aaxis_in=str2double(aaxis_in);
        caxis_in=get(handles.hcp_c,'String');
        caxis_in=str2double(caxis_in);
               
        a_0001 = a_0001 + thickness/ratio;      
        a_10_10 = a_10_10 + thickness/ratio*0.8;
        a_10_11 = a_10_11 + thickness/ratio; 
        a_11_20 = a_11_20 + thickness/ratio;  
        
       if get(handles.HCP_single_radiobutton, 'Value')==1
            %HCP SINGLE CRYSTAL MODELING
            [coordmatrix,iso] = hcp_singlecrystal(a_0001, a_10_10, a_10_11, a_11_20, hObject, handles);
            pointcolour = [0.8,0.8,0.8];
            
        elseif get(handles.HCP_10_11_radiobutton, 'Value')==1
            %HCP 10_11 TWINNED CRYSTAL MODELING
            U2 = 1;
            V2 = 0;
            W2 = 1*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old, a_11_20_old, '10_11', omega, 30, hObject, handles);
            pointcolour = [.1,.4,0.1];
            
        elseif get(handles.HCP_10_12_radiobutton, 'Value')==1
            %HCP 10_12 TWINNED CRYSTAL MODELING
            U2 = 1;
            V2 = 0;
            W2 = 2*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old,a_11_20_old, '10_12', omega,30, hObject, handles);
            pointcolour = [0.2,0.4,0.6];
            
        elseif get(handles.HCP_10_13_radiobutton, 'Value')==1
            %HCP 10_13 TWINNED  CRYSTAL MODELING
            U2 = 1;
            V2 = 0;
            W2 = 3*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old, a_11_20_old,'10_13', omega,30, hObject, handles);
            pointcolour = [0.6,0.1,0.1];
            
        elseif get(handles.HCP_11_21_radiobutton, 'Value')==1
            %HCP 11_21 TWINNED CRYSTAL MODELING
            U2 = 1;
            V2 = 1;
            W2 = 1*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old, a_11_20_old, '11_21', omega, 0, hObject, handles);
            pointcolour = [0.64,0.5,0.15];
            
        elseif get(handles.HCP_11_22_radiobutton, 'Value')==1
            %HCP 11_22 TWINNED CRYSTAL MODELING
            U2 = 1;
            V2 = 1;
            W2 = 2*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old,a_11_20_old, '11_22', omega, 0, hObject, handles);
            pointcolour = [0.45,0.25,0.50];
            
        elseif get(handles.HCP_11_23_radiobutton, 'Value')==1
            %HCP 11_23 TWINNED CRYSTAL MODELING
            U2 = 1;
            V2 = 1;
            W2 = 3*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old, a_11_20_old,'11_23', omega, 0, hObject, handles);
            pointcolour = [1,0.41,0.16];
            
        elseif get(handles.HCP_11_24_radiobutton, 'Value')==1
            %HCP 11_24 TWINNED CRYSTAL MODELING
            U2 = 1;
            V2 = 1;
            W2 = 4*3*aaxis_in^2/(2*caxis_in^2);
            CosOmega = caxis_in*W2/sqrt(3*aaxis_in^2*(U2^2+U2*V2+V2^2)+caxis_in^2*W2^2);
            omega = acos(CosOmega)*180/pi;
            [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, a_0001_old, a_10_10_old, a_10_11_old,a_11_20_old,'11_24', omega, 0, hObject, handles);
            pointcolour = [0.5,0.5,0.5];
       end
       
       if isempty(iso) == 1
           return
       end
        
        coordmatrixALL = coordmatrix;
        coordmatrixshell = setdiff(coordmatrixALL,coordmatrixcore,'rows');
                     
        %Get the half section points for both core and thick
        halfshell = coordmatrixshell(coordmatrixshell(:,2)>0,:);
        halfcore = coordmatrixcore(coordmatrixcore(:,2)>0,:);

        %Define plot handles and plot points
        axes(handles.axes1)
        hold on
        scatter3(halfshell(:,1),halfshell(:,2),halfshell(:,3), ...
            'MarkerFaceColor',pointcolour,...
            'MarkerEdgeColor','none');
        
        hold on
        scatter3(halfcore(:,1),halfcore(:,2),halfcore(:,3), ...
            'MarkerFaceColor',[0.9, 0.7, 0.1],...
            'MarkerEdgeColor','none');
        
        view(0,0)      
end

        %New Volume calculation
        Vol2 = length(coordmatrixALL)*step^3;
        
        NewVol2 = Vol2 * ratio^3;
        EffR2 = (3*NewVol2/(4*pi))^(1./3);
        
        %Make variables availbale for the DDSCATgenerateparfiel function
        setappdata(handles.DDSCATdipolescreate, 'coordmatrixcore', coordmatrixcore);
        setappdata(handles.DDSCATdipolescreate, 'coordmatrixshell', coordmatrixshell);
        setappdata(handles.DDSCATdipolescreate, 'coordmatrixALL', coordmatrixALL);
        setappdata(handles.DDSCATgenerateparfile, 'EffR', EffR2);
        
        h = msgbox(strcat('The new effective radius has been calculated: ',...
            num2str(EffR2),' microns'));
        movegui(h,'center');
end

% --- Executes on button press in DDSCATdipolescreate.
function DDSCATdipolescreate_Callback(hObject, eventdata, handles)
% hObject    handle to DDSCATdipolescreate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

progressbar = waitbar(0,'Shape file creation in progress');

step=get(handles.calcstep,'String');
step=str2double(step);
shell=get(handles.thick,'String');
shell=str2double(shell);

%Divide coordmatrix with step to get integers

if shell > 0
    
    coordmatrixshell=getappdata(handles.DDSCATdipolescreate,'coordmatrixshell');
    coordmatrixcore=getappdata(handles.DDSCATdipolescreate,'coordmatrixcore');
    coordmatrixALL=getappdata(handles.DDSCATdipolescreate,'coordmatrixALL');
    
    Icoordmatrixshell = coordmatrixshell./step;
    IcoordmatrixALL = coordmatrixALL./step;
    Icoordmatrixcore = coordmatrixcore./step;
    
else
    coordmatrixALL=getappdata(handles.DDSCATdipolescreate,'coordmatrix');
    IcoordmatrixALL = coordmatrixALL./step;
    Icoordmatrixcore = [];
    Icoordmatrixshell = [];
end

waitbar(0.8,progressbar,'Shape file creation in progress');

%Find centroid
Npoints=length(IcoordmatrixALL);

xadd = 0;
yadd = 0;
zadd = 0;

for ii = 1:Npoints
    xadd = xadd + IcoordmatrixALL(ii,1);
    yadd = yadd + IcoordmatrixALL(ii,2);
    zadd = zadd + IcoordmatrixALL(ii,3);
end

xnot = xadd / Npoints;
ynot = yadd / Npoints;
znot = zadd / Npoints;

Ncentre(1) = xnot;
Ncentre(2) = ynot;
Ncentre(3) = znot;

disp(Ncentre)

close(progressbar);

%Ask user for file inputs
fig  = uifigure('Name','Shape File Input','Visible','off',...
    'NumberTitle','off','Position',[20 20 600 200]);

titlable = uilabel(fig,'FontName','Arial','FontSize',13,'Position',[20 160 400 22], ...
    'text',"What would you like to call this shape?");
tit = uieditfield(fig,'text','FontSize',13,'Position',[420 160 100 22], ...
    'value','shape');

a1lablel = uilabel(fig,'FontName','Arial','FontSize',13,'Position',[20 120 580 22], ...
    'text',"Enter target vector a1 (in target frame), with spaces (x y z)");
a1 = uieditfield(fig,'text','FontSize',13,'Position',[420 120 100 22], ...
    'value','1 0 0');

a2lablel = uilabel(fig,'FontName','Arial','FontSize',13,'Position',[20 80 450 22], ...
    'text',"Enter target vector a2 (in target frame), with spaces (x y z");
a2 = uieditfield(fig,'text','FontSize',13,'Position',[420 80 100 22], ...
    'value','0 1 0');

savebutton = uibutton(fig,'FontName','Arial','Position',[250 20 100 22],'Text','Save',...
    'ButtonPushedFcn',@(savebutton,event) saveshape(savebutton,event, ...
    handles,fig,tit,a1,a2,Ncentre,Npoints,shell, ...
    IcoordmatrixALL, Icoordmatrixcore,Icoordmatrixshell));

movegui(fig,'center');
fig.Visible = 'on';

%Create ButtonPushedFcn callback (create and save shape.dat file)
function saveshape(~,~,handles,fig,tit,a1,a2,Ncentre,Npoints, shell, ...
    IcoordmatrixALL, Icoordmatrixcore, Icoordmatrixshell)

title = tit.Value;
tv_a1 = a1.Value;
tv_a2 = a2.Value;
close(fig)

%Create shape file
workingfile=fopen(strcat(title,'.dat'),'w');
%Title from input
fprintf(workingfile,'%s %s %s \r\n','---', title, '---');
%Number of dipoles
fprintf(workingfile,'%d %s \r\n',Npoints, '= NAT');
%Target vector 1
fprintf(workingfile, '%s %s \r\n',tv_a1, ' = target vector a1 (in TF)');
%Target vector 2
fprintf(workingfile, '%s %s \r\n',tv_a2, ' = target vector a2 (in TF)');
%Dimensions (fixed at 111)
fprintf(workingfile, '%f %f %f %s\r\n', 1., 1., 1., ...
    ' = d_x/d d_y/d d_z/d (normally 1 1 1 )'); %
%Center of the lattice
fprintf(workingfile, '%f %f %f %s\r\n', Ncentre(1), Ncentre(2), Ncentre(3), ...
    ' = X0(1-3) = location in lattice of "target origin"');
%Header for matrix
fprintf(workingfile, '%s\r\n', 'J JX JY JZ ICOMPX,ICOMPY,ICOMPZ');

%Create dipole matrix

%First column is 1,2,3...
dipolematrix(:,1)=(1:Npoints);
%Columns 2-4 correspond to dipoles


%Columns 5-7 are composition attributes, currently up to 2 materials when
%there is a thick
if shell > 0
    dipolematrix(:,2:4)=[Icoordmatrixcore; Icoordmatrixshell];
    for ii = 1:length(Icoordmatrixcore)
        dipolematrix(ii,5:7) = [1 1 1];
    end
    
    for ii = (length(Icoordmatrixcore)+1):(length(Icoordmatrixcore)+length(Icoordmatrixshell))
        dipolematrix(ii,5:7) = [2 2 2];
    end
else
    dipolematrix(:,2:4)=IcoordmatrixALL;
    for ii = 1:Npoints
        dipolematrix(ii,5:7) = [1 1 1];
    end
    
end

for row=1:Npoints
    fprintf(workingfile, '%d %0.0f %0.0f %0.0f %d %d %d\r\n',dipolematrix(row,:));
end
fclose(workingfile);
msgbox('The shape file was created and saved in the current working folder');


% --- Executes on button press in DDSCATgenerateparfile.
function DDSCATparfile_Callback(~, ~, handles)
% hObject    handle to DDSCATgenerateparfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get input
shell=get(handles.thick,'String');
shell=str2double(shell);
EffR = getappdata(handles.DDSCATgenerateparfile, 'EffR');
if isempty(EffR) == 1
    h = msgbox(strcat('Effective radius not found. Please calculate effective radius first.'));
    movegui(h,'center');
    return
end

%Ask for user input
fig  = uifigure('Name','DDSCAT File Input','Visible','off',...
    'NumberTitle','off','Position',[0 0 600 450]);
movegui(fig,'center');
fig.Visible = 'on';

tabgp = uitabgroup(fig,'Position',[0 0 600 450]);
tab1 = uitab(tabgp,'Title','Preliminaries');
tab2 = uitab(tabgp,'Title','Computational');
tab3 = uitab(tabgp,'Title','Composition & target orientation');
tab4 = uitab(tabgp,'Title','Incident radiation & scattering');
tab5 = uitab(tabgp,'Title','Output & save');

%tab text properties
Propstext.FontSize = 13;
Propstext.HorizontalAlignment = 'left';
Propsdd.FontSize = 13;
Propsdd.FontName = 'Arial';

% Create tab 1
trqlabel = uilabel(tab1,Propstext,'Position',[20 380 280 22], ...
    'text',"Perform radiative torque calculation?");
trq = uidropdown(tab1,Propsdd,'Position',[300 380 60 22],...
    'items', {'No','Yes'});%'ValueChangedFcn',@(trq,event) trqChanged(trq,event));

ccglabel = uilabel(tab1,Propstext,'Position',[20 340 200 22], ...
    'text',"Select CCG method");
ccg = uidropdown(tab1,Propsdd,'Position',[300 340 80 22],...
    'items', {'PBCGS2', 'PBCGST', 'GPBICG', 'QMRCCG', 'PETRKP'});

fftlabel = uilabel(tab1,Propstext,'Position',[20 300 200 22], ...
    'text',"Select FFT method");
fft = uidropdown(tab1,Propsdd,'Position',[300 300 80 22],...
    'items', {'GPFAFT','FFTMKL'});

ddalabel = uilabel(tab1,Propstext,'Position',[20 260 200 22], ...
    'text',"Select DDA method");
dda = uidropdown(tab1,Propsdd,'Position',[300 260 80 22],...
    'items', {'GKDLDR', 'LATTDR', 'FLTRCD'});

binlabel = uilabel(tab1,Propstext,'Position',[20 220 200 22], ...
    'text',"Select binary output");
bin = uidropdown(tab1,Propsdd,'Position',[300 220 80 22],...
    'items', {'NOTBIN', 'ORIBIN', 'ALLBIN'});

nfvollabel1 = uilabel(tab1,Propstext,'Position',[20 140 250 22], ...
    'text'," Set fractional extension of calc. vol.");
nfvollabel2 = uilabel(tab1,Propstext,'Position',[20 1200 200 22], ...
    'text',"(-x,+x,-y,+y,-z,+z)");
nfvol = uieditfield(tab1,'text',Propstext,'Position',[300 140 150 22],...
    'value', '0.0 0.0 0.0 0.0 0.0 0.0','Editable','off','Enable','off');

nflabel = uilabel(tab1,Propstext,'Position',[20 180 250 22], ...
    'text',"Perform additional near field calculations?");
nf = uidropdown(tab1,Propsdd,'Position',[300 180 80 22],...
    'items', {'No','Yes'}, ...
    'ValueChangedFcn',@(nf,event) nfchanged(nf,event,nfvol));

%Create tab 2
memlabel = uilabel(tab2,Propstext,'Position',[20 380 200 22], ...
    'text',"Set initial memory allocation");
memNx = uilabel(tab2,Propstext,'Position',[300 380 25 22], ...250
    'text',"NX:");
memNy = uilabel(tab2,Propstext,'Position',[370 380 25 22], ...
    'text',"NY:");
memNz = uilabel(tab2,Propstext,'Position',[440 380 25 22], ...
    'text',"NZ:");
memNx = uieditfield(tab2,'numeric',Propstext,'Position',[323 380 40 22], ...
    'value',200);
memNy = uieditfield(tab2,'numeric',Propstext,'Position',[393 380 40 22], ...
    'value',200);
memNz = uieditfield(tab2,'numeric',Propstext,'Position',[463 380 40 22], ...
    'value',200);

tollabel = uilabel(tab2,Propstext,'Position',[20 340 200 22], ...
    'text',"Set maximum error tolerance");
tol = uieditfield(tab2,'numeric',Propstext,'Position',[300 340 80 22], ...
    'value',1.00e-5);

itlabel = uilabel(tab2,Propstext,'Position',[20 300 200 22], ...
    'text',"Set maximum number of iterations");
it = uieditfield(tab2,'numeric',Propstext,'Position',[300 300 80 22], ...
    'value',20000);

pbclabel = uilabel(tab2,Propstext,'Position',[20 260 250 22], ...
    'text',"Set integration limiter for PBC calc.");
pbc = uieditfield(tab2,'numeric',Propstext,'Position',[300 260 80 22], ...
    'value',1.00e-3);

angreslabel = uilabel(tab2,Propstext,'Position',[20 220 280 22], ...
    'text',"Set angular resolution for calc. of <cos>, etc.");
angres = uieditfield(tab2,'numeric',Propstext,'Position',[300 220 80 22], ...
    'value',0.5);

%Create tab 3
dielabel = uilabel(tab3,Propstext,'Position',[20 380 250 22], ...
    'text',"Enter number of dielectric materials");
die = uieditfield(tab3,'numeric',Propstext,'Position',[300 380 60 22], ...
    'value',1);

reflabel = uilabel(tab3,Propstext,'Position',[20 340 250 22], ...
    'text',"Enter file name with refractive index");
ref = uieditfield(tab3,'text',Propstext,'Position',[300 340 150 22], ...
    'value','Au_evap');

reflabelsh = uilabel(tab3,Propstext,'Position',[20 300 280 22], ...
    'text',"Enter file name with refractive index for shell");
refsh = uieditfield(tab3,'text',Propstext,'Position',[300 300 150 22], ...
    'value','m1.33_0.01','Editable','off','Enable','off');

if shell > 0
    refsh.Editable = 'on';
    refsh.Enable = 'on';
end

amblabel = uilabel(tab3,Propstext,'Position',[20 260 250 22], ...
    'text',"Enter refractive index of ambient medium");
amb = uieditfield(tab3,'numeric',Propstext,'Position',[300 260 60 22], ...
    'value',1);

uit2label = uilabel(tab3,Propstext,'Position',[20 220 400 22], ...
    'text',"Enter target rotation properties in the table below");
targetrot = {0., 0., 1 ; 0., 0., 1 ; 0., 0., 1};
uit2 = uitable(tab3,'Position',[100 120 410 23.6+3*18.5], ...
    'ColumnName',{'min','max','steps'},...
    'RowName',{'beta','theta','phi'}, ...
    'Data',targetrot,'ColumnEditable',true);

%Create tab 4
wavelabel = uilabel(tab4,Propstext,'Position',[20 380 250 22], ...
    'text',"Enter wavelength boundaries (microns)");
wavelabelmin = uilabel(tab4,Propstext,'Position',[300 380 25 22], ...
    'text',"min:");
wavelabelmax = uilabel(tab4,Propstext,'Position',[400 380 30 22], ...
    'text',"max:");
wavemin = uieditfield(tab4,'numeric',Propstext,'Position',[326 380 60 22], ...
    'value',0.5);
wavemax = uieditfield(tab4,'numeric',Propstext,'Position',[430 380 60 22], ...
    'value',0.5);

wavesteplabel = uilabel(tab4,Propstext,'Position',[20 340 300 22], ...
    'text',"Enter wavelength step number & type ");
wavestep = uieditfield(tab4,'numeric',Propstext,'Position',[300 340 60 22], ...
    'value',1);
wavesteptype = uidropdown(tab4,Propsdd,'Position',[380 340 60 22], ...
    'items',{'LIN','INV','LOG','TAB'});

pollabel = uilabel(tab4,Propstext,'Position',[20 300 300 22], ...
    'text',"Set the polarization state e01 (k along x axis)");
pol = uieditfield(tab4,'text',Propstext,'Position',[300 300 200 22], ...
    'value','(0,0) (1.,0.) (0.,0.)');

poltypelabel = uilabel(tab4,Propstext,'Position',[20 260 200 22], ...
    'text',"Calculate orthogonal polarization?");
poltype = uidropdown(tab4,Propsdd,'Position',[300 260 60 22], ...
    'items',{'Yes','No'});

framelabel = uilabel(tab4,Propstext,'Position',[20 220 280 22], ...
    'text',"Select scatteting plane reference frame");
frame = uidropdown(tab4,Propsdd,'Position',[300 220 100 22], ...
    'items',{'Target Frame','Lab Frame'});

poltypelabel = uilabel(tab4,Propstext,'Position',[20 140 400 22], ...
    'text',"Define scattering planes in the table below (deg)");
planemat = {0., 0., 180., 1};
inpos = 23.6+18.5;
uit = uitable(tab4,'Position',[100 (120-inpos) 400 inpos], ...
    'ColumnName',{'phi','theta_min','theta_max','dtheta'},...
    'Data',planemat,'ColumnEditable',true);

splanelabel = uilabel(tab4,Propstext,'Position',[20 180 250 22], ...
    'text',"Set number of scattering planes");
splane = uieditfield(tab4,'numeric',Propstext,'Position',[300 180 60 22], ...
    'value',1, ...
    'ValueChangedFcn',@(splane,event) splanechanged(splane,event,uit));

%Create tab 5
suplabel = uilabel(tab5,Propstext,'Position',[20 380 200 22], ...
    'text',"Supress .sca file?");
sup = uidropdown(tab5,Propsdd,'Position',[300 380 60 22], ...
    'items',{'No','Yes'});

elemlabel1 = uilabel(tab5,Propstext,'Position',[20 280 200 22], ...
    'text',"Enter indices ij of elements to print");
elemlabel1 = uilabel(tab5,Propstext,'Position',[20 260 200 22], ...
    'text',"e.g. for 4 elements 11 12 21 22 ");
elem = uieditfield(tab5,'text',Propstext,'Position',[300 280 200 22], ...
    'value','','Editable','off','Enable','off');

noelemlabel1 = uilabel(tab5,Propstext,'Position',[20 340 250 22], ...
    'text',"Enter number of elements of S_ij to print");
noelemlabel2 = uilabel(tab5,Propstext,'Position',[20 320 250 22], ...
    'text',"(not more than 9)");
noelem = uieditfield(tab5,'numeric',Propstext,'Position',[300 340 60 22], ...
    'value',0, ...
    'ValueChangedFcn',@(noelem,event) noelemchanged(noelem,event,elem));

savebutton = uibutton(tab5,'Position',[250 30 100 22],'Text','Save',...
    'ButtonPushedFcn',@(savebutton,event) selection(savebutton,...
    EffR,trq,ccg,fft,dda,bin,nf,nfvol,memNx,memNy,memNz,tol,it,ref,die,amb,...
    wavemin,wavemax,pbc,angres,wavestep,wavesteptype,pol,poltype,sup,...
    noelem,elem,splane,uit,uit2,frame,shell,fig));

%Create ValueChangedFcn callbacks (adjusts options in ddscat.par)
function nfchanged(nf,~,nfvol)
if strcmp(nf.Value,'Yes') == 1
    nfvol.Editable = 'on';
    nfvol.Enable = 'on';
elseif strcmp(nf.Value,'No') == 1
    nfvol.Editable = 'off';
    nfvol.Enable = 'off';
end

function noelemchanged(noelem,~,elem)
if noelem.Value == 0
    elem.Editable = 'off';
    elem.Enable = 'off';
else
    elem.Editable = 'on';
    elem.Enable = 'on';
end

function splanechanged(splane,~,uit)
if splane.Value > 3
    colsize = 23.5 + 3 * 18.5;
else
    colsize = 23.6 + splane.Value * 18.5;
end
planemat = cell(splane.Value,4);
uit.Position = [100 120-colsize 400 colsize];
uit.Data = planemat;

%Create ButtonPushedFcn callback (create and save ddscat.par file)
function selection(savebutton,...
    EffR,trq,ccg,fft,dda,bin,nf,nfvol,memNx,memNy,memNz,tol,it,ref,die,amb,...
    wavemin,wavemax,pbc,angres,wavestep,wavesteptype,pol,poltype,sup,...
    noelem,elem,splane,uit,uit2,frame,shell,fig)

if strcmp(trq.Value,'No') == 1
    CMDTRQ = 'NOTORQ';
elseif strcmp(trq.Value,'Yes') == 1
    CMDTRQ = 'DOTORQ';
end

if strcmp(poltype.Value,'No') == 1
    IORTH = '1';
elseif strcmp(poltype.Value,'Yes') == 1
    IORTH = '2';
end
nf.Value
if strcmp(nf.Value,'No') == 1
    NRFLD = '0';
elseif strcmp(nf.Value,'Yes') == 1
    NRFLD = '1';
end

if strcmp(sup.Value,'No') == 1
    IWRKSC = '1';
elseif strcmp(sup.Value,'Yes') == 1
    IWRKSC = '0';
end

if strcmp(frame.Value,'Lab Frame') == 1
    CMDFRM = 'LFRAME';
elseif strcmp(frame.Value,'Target Frame') == 1
    CMDFRM = 'TFRAME';
end

%Create ddscat.par file
workingfile=fopen(strcat('ddscat.par'),'w');
fprintf(workingfile,'%s \r\n%s \r\n', ...
    '''========== Parameter file for v7.3 ===================''', ...
    '''**** Preliminaries ****''');
fprintf(workingfile,'''%s''%s \r\n',CMDTRQ,' = CMDTRQ*6 (DOTORQ, NOTORQ) -- either do or skip torque calculations');
fprintf(workingfile,'''%s''%s \r\n', ccg.Value,' = CMDSOL*6 (PBCGS2, PBCGST, GPBICG, QMRCCG, PETRKP) -- CCG method');
fprintf(workingfile,'''%s''%s \r\n', fft.Value,' = CMETHD*6 (GPFAFT, FFTMKL) -- FFT method');
fprintf(workingfile,'''%s''%s \r\n', dda.Value,' = CALPHA*6 (GKDLDR, LATTDR, FLTRCD) -- DDA method');
fprintf(workingfile,'''%s''%s \r\n', bin.Value,' = CBINFLAG (NOTBIN, ORIBIN, ALLBIN) -- binary output?');
fprintf(workingfile,'%s \r\n', '''**** Initial Memory Allocation ****''');
fprintf(workingfile,'%d %d %d%s \r\n', memNx.Value, memNy.Value, memNz.Value,' = dimensioning allowance for target generation');
fprintf(workingfile,'%s \r\n', '''**** Target Geometry and Composition ****''');
fprintf(workingfile,'%s \r\n', '''FROM_FILE'' = CSHAPE*9 shape directive');
fprintf(workingfile,'%s \r\n', ''); % empty line for custom made shape files
fprintf(workingfile,'%d%s \r\n', die.Value, ' = NCOMP = number of dielectric materials');
fprintf(workingfile,'%s%s%s \r\n', '''',ref.Value,''' = file with refractive index 1');

if shell > 0
    fprintf(workingfile,'%s%s%s \r\n', '''',ref.Value,''' = file with refractive index 2');
end

fprintf(workingfile,'%s \r\n', '''**** Additional Nearfield calculation? ****''');
fprintf(workingfile,'%s%s \r\n', NRFLD, ' = NRFLD (=0 to skip nearfield calc., =1 to calculate nearfield E)');
fprintf(workingfile,'%s%s \r\n', nfvol.Value,' (fract. extens. of calc. vol. in -x,+x,-y,+y,-z,+z)');
fprintf(workingfile,'%s \r\n', '''**** Error Tolerance ****''');
fprintf(workingfile,'%f%s \r\n', tol.Value, ' = TOL = MAX ALLOWED (NORM OF |G>=AC|E>-ACA|X>)/(NORM OF AC|E>)');
fprintf(workingfile,'%s \r\n', '''**** Maximum number of iterations ****''');
fprintf(workingfile,'%d%s \r\n', it.Value, ' = MXITER');
fprintf(workingfile,'%s \r\n', '''**** Integration limiter for PBC calculations ****''');
fprintf(workingfile,'%f%s \r\n', pbc.Value,' = GAMMA (1e-2 is normal, 3e-3 for greater accuracy)');
fprintf(workingfile,'%s \r\n', '''**** Angular resolution for calculation of <cos>, etc. ****''');
fprintf(workingfile,'%f%s \r\n', angres.Value,' = ETASCA (number of angles is proportional to [(3+x)/ETASCA]^2 )');
fprintf(workingfile,'%s \r\n', '''**** Wavelengths (micron) ****''');
fprintf(workingfile,'%f %f %d %s %s \r\n', wavemin.Value, wavemax.Value, wavestep.Value, wavesteptype.Value,' = wavelengths (1st,last,howmany,how=LIN,INV,LOG,TAB)');
fprintf(workingfile,'%s \r\n', '''**** Refractive index of ambient medium ****''');
fprintf(workingfile,'%f%s \r\n', amb.Value , ' = NAMBIENT');
fprintf(workingfile,'%s \r\n', '''**** Effective Radii (micron) **** ''');
fprintf(workingfile,'%f %f%s \r\n', EffR, EffR, ' 1 ''LIN'' = eff. radii (1st,last,howmany,how=LIN,INV,LOG,TAB)');
fprintf(workingfile,'%s \r\n', '''**** Define Incident Polarizations ****''');
fprintf(workingfile,'%s%s \r\n', pol.Value,' = Polarization state e01 (k along x axis)');
fprintf(workingfile,'%s%s \r\n', IORTH,' = IORTH  (=1 to do only pol. state e01; =2 to also do orth. pol. state)');
fprintf(workingfile,'%s \r\n', '''**** Specify which output files to write ****''');
fprintf(workingfile,'%s%s \r\n', IWRKSC, ' = IWRKSC (=0 to suppress, =1 to write ".sca" file for each target orient.');
fprintf(workingfile,'%s \r\n', '''**** Specify Target Rotations ****''');
fprintf(workingfile,'%0.2f %0.2f %d%s \r\n', cell2mat(uit2.Data(1,:)), ' = BETAMI, BETAMX, NBETA  (beta=rotation around a1)');
fprintf(workingfile,'%0.2f %0.2f %d%s \r\n', cell2mat(uit2.Data(2,:)), ' = THETMI, THETMX, NTHETA (theta=angle between a1 and k)');
fprintf(workingfile,'%0.2f %0.2f %d%s \r\n', cell2mat(uit2.Data(3,:)),' = PHIMIN, PHIMAX, NPHI (phi=rotation angle of a1 around k)');
fprintf(workingfile,'%s \r\n', '''**** Specify first IWAV, IRAD, IORI (normally 0 0 0) ****''');
fprintf(workingfile,'%s \r\n', '0   0   0    = first IWAV, first IRAD, first IORI (0 0 0 to begin fresh)');
fprintf(workingfile,'%s \r\n', '''**** Select Elements of S_ij Matrix to Print ****''');
fprintf(workingfile,'%d%s \r\n', noelem.Value, ' = NSMELTS = number of elements of S_ij to print (not more than 9)');
fprintf(workingfile,'%s%s \r\n', elem.Value ,' = indices ij of elements to print');
fprintf(workingfile,'%s \r\n', '''**** Specify Scattered Directions ****''');
fprintf(workingfile,'%s%s \r\n', CMDFRM,' = CMDFRM (LFRAME, TFRAME for Lab Frame or Target Frame)');
fprintf(workingfile,'%d%s \r\n',splane.Value, '  = NPLANES = number of scattering planes');

for i = 1:splane.Value
    fprintf(workingfile,'%s%s %d \r\n',...
        sprintf('%0.2f %0.2f %0.2f %d',cell2mat(uit.Data(i,:))), ...
        ' = phi, theta_min, theta_max, dtheta (in deg) for plane', i);
end

fclose(workingfile);
close(fig)
msgbox('The ddscat.par file was created and saved in the current work folder');

% --- Executes on button press in clearfig. Clears figure
function clearfig_Callback(hObject, ~, handles)
cla

set(handles.EffRadiusCalc, 'enable', 'off');
set(handles.dipoles_distance, 'enable', 'off');
set(handles.CreateShell, 'enable', 'off');
set(handles.DDSCATdipolescreate, 'enable', 'off');
set(handles.DDSCATgenerateparfile, 'enable', 'off');

%updates the handles
guidata(hObject, handles);
clearvars

% --- Executes on button press in savefigure.
function savefigure_Callback(~, ~, handles)
axesObject = handles.axes1;

%Store savepath for the phase plot
[filename, pathname] = uiputfile({ '*.emf','Enhanced Meta File (*.emf)';...
    '*.bmp','Bitmap (*.bmp)'; ...
    '*.png','PNG (*.png)'; ...
    '*.png','JPG (*.jpg)'; ...
    '*.fig','Figure (*.fig)'; ...
    '*.*','All files (*.*)'}, ...
    'Save picture as','default');

%Cancel save command
if isequal(filename,0) || isequal(pathname,0)
    return
end

%Create new figure
newFig = figure;

%Get the units and position of the axes object
axes_units = get(axesObject,'Units');
axes_pos = get(axesObject,'Position');

%Copy axesObject onto new figure
axesObject2 = copyobj(axesObject,newFig);

%Adjust the new figure
set(newFig,'Units',axes_units);
set(newFig,'Position',[0 0 axes_pos(3)+30 axes_pos(4)+10]);
movegui(newFig,'center')

%Realign the axes object on the new figure
set(axesObject2,'Units',axes_units);
set(axesObject2,'Position',[0.3 0.05 axes_pos(3) axes_pos(4)]); %[15 5 axes_pos(3) axes_pos(4)]

%Save the plot
saveas(newFig,fullfile(pathname, filename))

%Close the figure
close(newFig)



% -------------------------------------------------------------------------
% ------------------------ HCP LATTICE CONSTANTS --------------------------
% -------------------------------------------------------------------------


function hcp_a_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function hcp_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hcp_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function hcp_c_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function hcp_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hcp_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% -------------------------------------------------------------------------
% ----------------------- HELP ACTION BUTTONS -----------------------------
% -------------------------------------------------------------------------

% --- Executes on button press in help_main_pushbutton.
function help_main_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_main_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
macopen('Help_document.pdf') % for Mac computers
%winopen('Help_document.pdf') % for Windows computers

% --- Executes on button press in help_basicparams_hcp_pushbutton.
function help_basicparams_hcp_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_basicparams_hcp_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfBasic parameters for HCP cystals. \rm \newline'...
    '',...
    'Inputs: \newline', ...
    '',...
    'First 4 inputs: the surface energies (thermodynamic modeling) or growth velocities (kinetic modeling) for the stated surfaces. ',... 
    '',...
    'Final 3 inputs: parameters related to the kinetic growth enhancement. These must be set to zero to perform thermodynamic modeling. For kinetic modeling, the growth enhancement parameters are generally between 0 and 3. The re-entrant enhancement acts on the concave corners found in the thermodynamic shape of monotwins. The twin enhancement also applies to the monotwins while for single crystals, these enhancements will have no effect as there are no twin planes.  ',...
    '',...
    'Enhancement for HCP monotwins is NOT supported when {11-20} planes are considered (i.e. when their energy / growth velocity value is comparatively small so that they appear).Suggested values can be found in the help pdf.'}, ...
    CreateStruct);

% --- Executes on button press in help_basicparams_pushbutton.
function help_basicparams_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_basicparams_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfBasic parameters for FCC cystals. \rm \newline'...
    '',...
    'Inputs: \newline', ...
    '',...
    'First 3 inputs: the surface energies (thermodynamic modeling) or growth velocities (kinetic modeling) for the stated surfaces. ',... 
    '',...
    'Final 3 inputs: parameters related to the kinetic growth enhancement. These must be set to zero to perform thermodynamic modeling. For kinetic modeling, the growth enhancement parameters are generally between 0 and 3. The re-entrant enhancement acts on the concave corners found in the thermodynamic shape of both decahedra and monotwins.',...
    '',...
    'The twin enhancement applies to the monotwin, while the disclination enhancement applies to the 5-fold twinning case. For single crystals, these enhancements will have no effect as there are no twin planes.  ', ...
    '',...
    'Suggested values can be found in the help pdf.'},...
    CreateStruct);

% --- Executes on button press in help_advancedparams_pushbutton.
function help_advancedparams_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_advancedparams_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfAdvanced parameters for FCC and HCP cystals. \rm '...
    '',...
    'Inputs: ', ...
    '',...
    'Calculation step: determines the level of detail obtained. A good starting point for step size is 0.2 or 0.5, with 0.1 taking a significant amount of time but yielding detailed figures. Not all computers will be able to handle 0.05.',...
    '',...
    'Calculation bound:  determines the size of the matrix calculated. The default value of 10 should not need changing unless the figure looks hollow, in which case the bound must be increased. The calculation bound must be a multiple of the calculation step.',...
    '',...
    'Smoothing beta: a factor in the exponential edge smoothing included in the model for graphical rendering purposes. If the figure looks too smooth, particularly at the edges, beta can be decreased, although the best way to tweak the parameters to obtain sharper edges is to increase the value of the surface energies/growth velocities and reduce the smoothing box to 3 or 1. ',...
    '',...
    'Smoothing box: an additional smoothing step performed at the end of the calculation; this number must be odd. A good starting point is 3; for very small (0.1 or less) step, 5 works well. No smoothing is performed if set to 1, which works best for single crystals.',...
    '',...
    'Suggested values can be found in the help pdf.'}, CreateStruct);

% --- Executes on button press in help_twinning_hcp_pushbutton.
function help_twinning_hcp_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_twinning_hcp_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfTwinning type for HCP cystals. \rm ',...
    '',...
    'The twin type of the particle assuming a HCP structure. Single crystal has no twin planes, the remainder have one stated twin plane. Only one twinning type can be selected per calculation.',...
    '',...
    'Suggested values can be found in the help pdf.'}, CreateStruct);

% --- Executes on button press in help_twinning_pushbutton.
function help_twinning_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_twinning_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfTwinning type for FCC cystals. \rm ',...
    '',...
    'The twin type of the particle assuming an FCC structure. Single crystal has no twin planes, monotwin has one {111} plane, and pentatwin has five non-parallel {111} twin planes. Only one twinning type can be selected per calculation.',...
    '',...
    'Suggested values can be found in the help pdf.'}, CreateStruct);


% --- Executes on button press in help_layerparams_pushbutton.
function help_layerparams_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to help_layerparams_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfShell parameters. \rm ',...
    '',...
    'Used only when a conformal shape needs to be modelled.', ...
    '',...
    'To model a conformal shell the user must define the thickness of the shell in nanometers',...
    }, CreateStruct);


% --- Executes on button press in help_interdipoledistance.
function help_interdipoledistance_Callback(hObject, eventdata, handles)
% hObject    handle to help_interdipoledistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfDefine interdipole distance (optional). \rm',...
    '',...
    'Opens a dialog box for the user to enter the desired interdipole distance. Instructions on how to choose the interdipole distance can be found in the DDSCAT manual but reasonable values for particles of a few hundred nanometers range between 0.5 and 4. '}, CreateStruct);


% --- Executes on button press in help_createshell.
function help_createshell_Callback(hObject, eventdata, handles)
% hObject    handle to help_createshell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'non-modal';
f = msgbox({'\bfCreate shell (optional). \rm ',...
    '',...
    'Constructs and displays the cross section of a Wulff shape with a shell of thickness defined by the "Shell thickness" input.' ...
    '',...
    'The user can change the shell thickness and perform the “Create Shell’’ calculation without starting from the beginning.'}, CreateStruct);


% -------------------------------------------------------------------------
% ----------------------- MODELLING FUNCTIONS -----------------------------
% -------------------------------------------------------------------------

function [coordmatrix,iso] = fcc_singlecrystal(a_100, a_110, a_111, hObject, handles)
    
    %.......................Short description..................................
    % Loop over all points (x,y,z) in 2*bound by 2*bound by 2*bound cube
    % For every (x,y,z) loop over facets - here only {100}, {110}, and {111}
    % move facets in distance amp from (0,0,0) analogous to surface energy/
    % growth velocity a. Define normal to moved facets vector g = amp*[h,k,l]
    % Velocity is updated in every facet loop as Vscalar = Vscalar*F1
    % If the projection of v =[x,y,z] on g is smaller than g, then (x,y,z) lies
    % within shape and F1 = 1, else define exponential decay factor
    % F1 = exp(-b *((projection v on g)-g)^2). If F1 = 0, (x,y,z) out of shape
    % When loop is over or if F1 = 0, stop and store Vscalar in Vtot matrix
    % Create isosurface by choosing an isovalue, here 0.001.
    %..........................................................................
    
    %Get input
    beta=get(handles.smbeta,'String');
    beta=str2double(beta);
    box=get(handles.smbox,'String');
    box=str2double(box);
    bound=get(handles.calcbound,'String');
    bound=str2double(bound);
    step=get(handles.calcstep,'String');
    step=str2double(step);
    %shell=get(handles.thick,'String');
    %shell=str2double(shell);
    
    if mod(bound,step) ~= 0
    	errormessage = errordlg('Calculation boundaries must be divisible by calculation step to give an integer');
        return
    end
        
    %Update handles
    guidata(hObject, handles);
    
    %Start calculations
    isovalue=0.001;
    steps = 2 * round(bound / step) +1;
    %rounded needed after user sets interdipole distance
    
    Vtot = zeros(steps, steps, steps);
    progressbar = waitbar(0,'Single crystal calculation in progress',...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    setappdata(progressbar,'canceling',0);
    i = 0;
    coordlength = 0;
    coordmatrix = zeros(2000,3);
    
    %Loop over all points within 2*bound x 2*bound x 2*bound cube
    for x = -bound:step:bound
        % Check if cancel button pressed
        if getappdata(progressbar,'canceling')
            break
        end
        i = i+1;
        j = 0;
        for y = -bound:step:bound
            j = j+1;
            m = 0;
            for z = -bound:step:bound
                m = m + 1;
                Vscalar = 1;
                
                %Loop over all {100}, {110}, and {111} facets to get V
                for h = -1:1
                    for k = -1:1
                        for l = -1:1
                            if Vscalar > 1E-8
                                
                                gg = h*h + k*k + l*l;
                                
                                %Determine current facet and find proper normal
                                %vector (divide with norm and multiply with
                                %surface energy/growth velocity)
                                if abs(gg-1) < 1E-8
                                    amp = a_100 ;
                                elseif abs(gg-2) < 1E-8
                                    amp = a_110/sqrt(2) ;
                                elseif abs(gg-3) < 1E-8
                                    amp = a_111/sqrt(3) ;
                                end
                                
                                %Compare [x,y,z] projection on g with g
                                %For (x,y,z) inside the shape F1 = 1
                                %For (x,y,z) outside the shape F1 deacys exp.
                                dotxyz_g = amp*(x*h+y*k+z*l); %i.e. dot([x;y;z],g)
                                dotg_g = amp*amp*(gg);  
                                if dotxyz_g < dotg_g
                                    F1 = 1;
                                else
                                    F1 = exp(-beta*(dotxyz_g-dotg_g)*(dotxyz_g-dotg_g));
                                end
                                Vscalar = Vscalar*F1;
                            end %end of the if Vscalar statement
                        end
                    end
                end %end of loops over facets
                Vtot(i,j,m) = Vscalar;
                if Vscalar>isovalue
                    coordlength = coordlength + 1;
                    coordmatrix(coordlength,:)=[x y z];
                end
            end
        end
        waitbar(i / steps*0.9)
    end %end of loops in space (x,y,z)
    
    % Produce plot and output if the cancel button has not been pressed
    if getappdata(progressbar,'canceling')==1
        delete(progressbar)
        return
    else
        coordmatrix = coordmatrix(1:coordlength,:);
        
        %If no thick is set (=0), create x, y, z grids and patch figure
        Vtotsm=smooth3(Vtot,'box',box);
        [mX,mY,mZ] = meshgrid ...
            (-bound:step:bound,-bound:step:bound,-bound:step:bound);
        iso = isosurface(mX,mY,mZ,Vtotsm,isovalue);   
        
        %Make Vtot and coordmatrix available for the shape file creation
        setappdata(handles.DDSCATdipolescreate, 'Vtot', Vtot);
        setappdata(handles.DDSCATdipolescreate, 'coordmatrix', coordmatrix);
        setappdata(handles.EffRadiusCalc, 'coordmatrix', coordmatrix);
        
        %Update handles
        guidata(hObject, handles)
        delete(progressbar)
    end

function [coordmatrix,iso] = fcc_monotwin(a_100, a_110, a_111, a_100_old, a_110_old, a_111_old, hObject, handles)    
   
    %.......................Short description..............................
    % This models the wulff construction of a crystal with two twin shapes
    % (one (111) twin plane). The same proceedure as in the single crystal
    % construction is followed but it is mirrored on the (111) plane.
    %......................................................................
    
    %Get input
    reentrant = get(handles.reentrantenhancement,'String');
    reentrant=str2double(reentrant);
    twin=get(handles.twinenhancement, 'String');
    twin=str2double(twin);
    beta=get(handles.smbeta,'String');
    beta=str2double(beta);
    box=get(handles.smbox,'String');
    box=str2double(box);
    bound=get(handles.calcbound,'String');
    bound=str2double(bound);
    step=get(handles.calcstep,'String');
    step=str2double(step);
    %shell=get(handles.thick,'String');
    %shell=str2double(shell);
    
    if mod(bound,step) ~= 0
    	errormessage = errordlg('Calculation boundaries must be divisible by calculation step to give an integer');
        return
    end
    
    %Update handles
    guidata(hObject, handles);
    
    %Start calculations
    isovalue = 0.001;
    steps = 2 * round(bound / step) + 1;
    %rounded needed after setting dipole dipole distance
    
    Vtot = zeros(steps, steps, steps);
    progressbar = waitbar(0,'Monotwin calculation in progress',...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    setappdata(progressbar,'canceling',0);
    i = 0;
    coordmatrix = zeros(5000,3);
    coordlength = 0;
    
    %Loop over all points within 2*bound x 2*bound x 2*bound cube
    for x = -bound:step:bound
        % Check if cancel button pressed
        if getappdata(progressbar,'canceling')
            break
        end
        i = i + 1;
        j = 0;
        for y = -bound:step:bound
            j = j + 1;
            m = 0;
            for z = -bound:step:bound
                m = m + 1;
                a = (x+y+z)/3.;
                if a > 0 % Points in the same side of (1,1,1)
                    xx = x ; yy = y ; zz = z;
                else
                    %Mirror about the plane (111)
                    %Move points in the same side of plane
                    xx = x -2*a ; yy = y -2*a ; zz = z -2*a;
                end
                Vscalar=1; %i.e. if dot with 111 or -1-11 is smaller or
                %equal to zero, the xyz point has a nonzero value of V
                %Loop over all {100}, {110}, and {111} facets to get V
                for h = -1:1
                    for k = -1:1
                        for l = -1:1
                            if Vscalar > 1E-8
                                gg = h*h+k*k+l*l ;
                                
                                %Determine current facet and find proper normal
                                %vector (divide with norm and multiply with
                                %growth velocity)
                                if abs(gg-1) < 1E-8
                                    amp = a_100 ;
                                    ampt = a_100_old;
                                elseif abs(gg-2) < 1E-8
                                    amp = a_110/sqrt(2) ;
                                    ampt = a_110_old/sqrt(2);
                                elseif abs(gg-3) < 1E-8
                                    amp = a_111/sqrt(3) ;
                                    ampt = a_111_old/sqrt(3);
                                end
                                
                                if a_100_old == 0 
                                    ampt = amp;
                                end
                                
                                if h + k + l < 0 %dot([h;k;l],[1;1;1])<0 i.e. if the face is re-entrant type
                                    enhance=1.0+ twin %reentrant*ampt/amp+twin*ampt/amp;
                                    %For the twin boundary growth enhancement, the faces involved
                                    %are the re-entrant (111) above, and the (100) faces
                                elseif h+k+l == 1
                                    if k+l == 0
                                        enhance=1.0+twin*ampt/amp ; %WRONG!!
                                    elseif l+h == 0
                                        enhance=1.0+twin*ampt/amp ;
                                    elseif h+k == 0
                                        enhance=1.0+twin*ampt/amp ; 
                                    else
                                        enhance=1;
                                    end
                                else
                                    enhance=1;
                                end
                                
                                %Only the xyz within the boundaries of the
                                %twin will have a non-zero value for V
                                dotxyz_g = amp*enhance*(xx*h+yy*k+zz*l);
                                dotg_g = amp*amp*enhance*enhance*(gg);
                                
                                if dotxyz_g < dotg_g
                                    %i.e. if dot([x;y;z],g) < 0
                                    F1 = 1;
                                    
                                else
                                    F1 = exp(-beta*(dotxyz_g-dotg_g)*(dotxyz_g-dotg_g));
                                end
                                
                                Vscalar = Vscalar*F1;
                                
                            end %end of the if Vscalar statement
                        end
                    end
                end %end of loops over facets
                
                Vtot(i,j,m) = Vscalar;
                if Vscalar>isovalue
                    coordlength = coordlength + 1;
                    coordmatrix(coordlength,:)=[x y z];
                end
            end
        end
        
        waitbar(i / steps*0.9)
        
    end % end of loops over space (x,y,z)
    % Produce plot and output if the cancel button has not been pressed
    if getappdata(progressbar,'canceling')==1
        delete(progressbar)
        return
    else      
        coordmatrix = coordmatrix(1:coordlength,:);
        
        
        %Create x, y, z grids and patch figure
        Vtotsm = smooth3(Vtot,'box',box);
        [mX,mY,mZ] = meshgrid ...
            (-bound:step:bound,-bound:step:bound,-bound:step:bound);
        iso = isosurface(mX,mY,mZ,Vtotsm,isovalue);
        
        setappdata(handles.DDSCATdipolescreate, 'Vtot', Vtot);
        setappdata(handles.DDSCATdipolescreate, 'coordmatrix', coordmatrix);
        setappdata(handles.EffRadiusCalc, 'coordmatrix', coordmatrix);
        
        %Update handles
        guidata(hObject, handles)
        delete(progressbar)
    end
    
function [coordmatrix,iso] = fcc_pentatwin(a_100, a_110, a_111, a_100_old, a_110_old, a_111_old, hObject, handles)     
  
    %.......................Short description..............................
    % This models the wulff construction of a pentatwin shape.
    % The calculation loops over 5 identical twin segments each treated like a
    % singe crystal similarly to the single crystal construction.
    %......................................................................
    
    %Get input
    reentrant = get(handles.reentrantenhancement,'String');
    reentrant=str2double(reentrant);
    disclination = get(handles.disclinationenhancement,'String');
    disclination=str2double(disclination);
    beta=get(handles.smbeta,'String');
    beta=str2double(beta);
    box=get(handles.smbox,'String');
    box=str2double(box);
    bound=get(handles.calcbound,'String');
    bound=str2double(bound);
    step=get(handles.calcstep,'String');
    step=str2double(step);
    guidata(hObject, handles);
    %shell=get(handles.thick,'String');
    %shell=str2double(shell);
    
    if mod(bound,step) ~= 0
    	errormessage = errordlg('Calculation boundaries must be divisible by calculation step to give an integer');
        return
    end
    
    isovalue = 0.001;
    progressbar = waitbar(0,'Pentatwin calculation in progress',...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    setappdata(progressbar,'canceling',0);
    steps = 2 * round(bound/step) + 1; %rounded needed after setting dipole dipole distance
    
    %Vtot=zeros(newsteps,newsteps,newsteps);
    Vtot=zeros(steps,steps,steps);
    i=0;
    coordmatrix = zeros(5000,3);
    coordlength = 0;
    
    %Pre-calculations for rotation matrix
    axee = [1,-1,0];
    axee = axee / norm(axee);
    u = axee(1);
    v = axee(2);
    %w = axee(3); =0
    u2 = u^2;
    v2 = v^2;
    %w2 = w^2; =0
    
    %Loop over all points within 2*bound x 2*bound x 2*bound cube
    for x = -bound:step:bound
        % Check if cancel button pressed
        if getappdata(progressbar,'canceling')
            break
        end
        i = i+1;
        j = 0;
        for y = -bound:step:bound
            j = j+1;
            m = 0;
            for z = -bound:step:bound
                m = m+1;
                
                %Loop over 5 twin segments
                for n = 0:4
                    angle = 72*n;
                    angrad = angle*2*pi/360;
                    c = cos(angrad);
                    s = sin(angrad);
                    
                    %Calculate rotation matrix
                    R = nan(3);
                    R(1,1) =  u2 + v2*c;
                    R(1,2) = u*v*(1-c);
                    R(1,3) = v*s;
                    R(2,1) = u*v*(1-c);
                    R(2,2) = v2 + u2*c;
                    R(2,3) = - u*s;
                    R(3,1) = - v*s;
                    R(3,2) = u*s;
                    R(3,3) = (u2+v2)*c;
                    
                    rot111 = sum(R,2);
                    rot_1_11 = ...
                        [-R(1,1)-R(1,2)+R(1,3); -R(2,1)-R(2,2)+R(2,3); ...
                        -R(3,1)-R(3,2)+R(3,3)];
                    
                    %Dot product with rotated 111 plane
                    dotwith111 = x*rot111(1) + y*rot111(2) +z*rot111(3);
                    
                    %Dot product with rotated -1-11 plane
                    dotwith_1_11 = ...
                        x*rot_1_11(1) + y*rot_1_11(2) +z*rot_1_11(3);
                    
                    if dotwith111 > 0
                        %Twin Facet #2
                        if dotwith_1_11 > 0
                            Vscalar = 1; %i.e. if dot with 111 or -1-11 is
                            %smaller or equal to zero, the xyz point has a
                            %non-zero value of V
                            %Loop over all {100}, {110}, and {111} facets
                            %to get Vscalar
                            for h = -1:1
                                for k = -1:1
                                    for l=-1:1
                                        if Vscalar > 1E-8
                                            hh = R(1,1)*h+R(1,2)*k+R(1,3)*l;
                                            kk = R(2,1)*h+R(2,2)*k+R(2,3)*l;
                                            ll = R(3,1)*h+R(3,2)*k+R(3,3)*l;
                                            gg = hh*hh+kk*kk+ll*ll ;
                                            
                                            
                                            %Determine current facet and find proper
                                            %normal vector (divide with norm and
                                            %multiply with growth velocity)
                                            if abs(gg-1) < 1E-8
                                                amp = a_100 ;
                                                ampt = a_100_old ; 
                                            elseif abs(gg-2) < 1E-8
                                                amp = a_110 / sqrt(2) ;
                                                ampt = a_110_old / sqrt(2); 
                                            elseif abs(gg-3) < 1E-8
                                                amp = a_111 / sqrt(3) ;
                                                ampt = a_111_old / sqrt(3); 
                                            end
                                            
                                            if a_100_old == 0 
                                                ampt = amp;
                                            end
                                            
                                            %A facet [hkl] will be re-entrant if either
                                            %its dot product with 111 or with -1-11 is
                                            %smaller than zero
                                            
                                            if  h+k+l < 0
                                                %i.e if dot([hh;kk;ll],R*[1;1;1])<0;
                                                enhance=1.0+reentrant*ampt/amp ; 
                                                
                                            elseif -h-k+l < 0
                                                %i.e. if dot(R*[hh;kk;ll],R*[-1;-1;1])<0;
                                                enhance=1.0+reentrant*ampt/amp ; 
                                                %variable "enhance" includes both reentrant
                                                %and disclination enhancement;these occur
                                                %on different faces
                                            else
                                                if disclination == 0
                                                    enhance = 1;
                                                else
                                                    if h~=0
                                                        if k~=0
                                                            if l~=0
                                                                %the disclination enhancement only occurs at
                                                                %the {111} facets which are not re-entrant
                                                                enhance = 1+disclination*ampt/amp ; 
                                                            else
                                                                enhance = 1;
                                                            end
                                                        else
                                                            enhance = 1;
                                                        end
                                                    else
                                                        enhance=1;
                                                    end
                                                end
                                            end                                        
                                            
                                            %Only the xyz within the boundaries of the
                                            %twin will have a non-zero value for V
                                            %g = amp*enhance*[hh,kk,ll];
                                            dotxyz_g = amp*enhance*(x*hh+y*kk+z*ll);
                                            dotg_g = amp*amp*enhance*enhance*(gg);
                                            
                                            if dotxyz_g < dotg_g
                                                %i.e. dot([x;y;z],g) < 0;
                                                F1 = 1;
                                                
                                            else
                                                F1 = exp(-beta*(dotxyz_g-dotg_g)*(dotxyz_g-dotg_g));
                                            end
                                            
                                            Vscalar = Vscalar*F1;
                                            
                                        end % end of the if Vscalar statement
                                    end
                                end
                            end %end of the loop over facets {h,k,l}
                            
                            Vtot(i,j,m) = Vscalar;
                        end
                    end
                end %end of loop over 5 segments
            end
        end
        
        waitbar(i / steps*0.9)
        
    end %end of the loop over space (x,y,z)
    
    i = 0;
    Vtotsm = smooth3(Vtot,'box',box);
    for x = -bound:step:bound
        i = i+1;
        j = 0;
        for y = -bound:step:bound
            j = j+1;
            m = 0;
            for z = -bound:step:bound
                m = m+1;
                Vscalar = Vtotsm(i,j,m);
                if Vscalar>isovalue
                    coordlength = coordlength + 1;
                    coordmatrix(coordlength,:)=[x y z];
                end
            end
        end
    end
    
    % Produce plot and output if the cancel button has not been pressed
    if getappdata(progressbar,'canceling')==1
        delete(progressbar)
        return
    else
        coordmatrix = coordmatrix(1:coordlength,:);
        
        clear ii jj mm i j m x y z R n
        
        %Create x, y, z grids and patch figure
        [mX,mY,mZ] = meshgrid ...
            (-bound:step:bound,-bound:step:bound,-bound:step:bound);
        iso = isosurface(mX,mY,mZ,Vtotsm,isovalue);
        
        setappdata(handles.DDSCATdipolescreate, 'Vtot', Vtot);
        setappdata(handles.DDSCATdipolescreate, 'coordmatrix', coordmatrix);
        setappdata(handles.EffRadiusCalc, 'coordmatrix',coordmatrix);
        
        guidata(hObject, handles)
        delete(progressbar)
    end
   
function [coordmatrix,iso] = hcp_singlecrystal(a_0001, a_10_10, a_10_11, a_11_20, hObject, handles) 

    %.......................Short description..................................
    % Loop over all points (x,y,z) in 2*bound by 2*bound by 2*bound cube
    % For every (x,y,z) loop over facets - here {1000},{1010},{1011} and {1020}
    % Move facets in distance amp from (0,0,0) analogous to growth velocity a
    % Facets and corresponding distances from (0,0,0) are given in FacetVec and
    % ampmtx respectively.
    % Define normal to moved facets vector g = amp*[h,k,l]
    % Velocity is updated in every facet loop as Vscalar = Vscalar*F1
    % If the projection of v =[x,y,z] on g is smaller than g, then (x,y,z) lies
    % within shape and F1 = 1, else define exponential decay factor
    % F1 = exp(-b *((projection v on g) - g)^2). If F1 = 0 (x,y,z) out of shape
    % When loop is over or if F1 = 0, stop and store Vscalar in Vtot matrix
    % Create isosurface by choosing an isovalue from the Vtot matrix
    %..........................................................................
    
    
    %define inputs
    beta=get(handles.smbeta,'String');
    beta=str2double(beta);
    box=get(handles.smbox,'String');
    box=str2double(box);
    bound=get(handles.calcbound,'String');
    bound=str2double(bound);
    step=get(handles.calcstep,'String');
    step=str2double(step);
    aaxis=get(handles.hcp_a,'String');
    aaxis=str2double(aaxis);
    caxis=get(handles.hcp_c,'String');
    caxis=str2double(caxis);
    
    if mod(bound,step) ~= 0
    	errormessage = errordlg('Calculation boundaries must be divisible by calculation step to give an integer');
        return
    end
    
    %update handles
    guidata(hObject, handles);
    
    %Start calculations
    isovalue=0.001;
    progressbar = waitbar(0,'Single crystal calculation in progress',...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    setappdata(progressbar,'canceling',0);
    steps = 2 * round(bound / step) +1;
    Vtot = zeros(steps, steps, steps);
    i = 0;
    
    coordmatrix = zeros(10^8,3);
    nnn = 0;
    
    ration = caxis/aaxis;
    aaxis = 1;
    caxis = ration;
    dside = sqrt(3)/2*aaxis;
    hside = sqrt(3)*aaxis*caxis/sqrt(3*aaxis^2+4*caxis^2);
    ODside = sqrt(dside^2*(caxis^2-hside^2)/(caxis^2+dside^2));
    Xoa = ODside*sqrt(3)/2;
    Yoa = ODside/2;
    Zoa = sqrt(hside^2-ODside^2);
    hhside = sqrt(Zoa^2+Xoa^2+Yoa^2);
    dside3 = aaxis/2;
    
    V = zeros(3,13);
    V(:,1) = [0; 0; caxis]; %0001
    V(:,2) = [aaxis*3/4; aaxis*sqrt(3)/4; 0]; %10_10
    V(:,3) = [aaxis*3/4; -aaxis*sqrt(3)/4; 0]; %10_10
    V(:,4) = [0; sqrt(3)/2; 0]; %10_10
    V(:,5) = [Xoa; Yoa; Zoa]; %10_11
    V(:,6) = [-Xoa; Yoa; Zoa]; %10_11
    V(:,7) = [Xoa; -Yoa; Zoa]; %10_11
    V(:,8) = [-Xoa; -Yoa; Zoa]; %10_11
    V(:,9) = [0; ODside; Zoa]; %10_11
    V(:,10) = [0; -ODside; Zoa]; %10_11
    V(:,11) = [1/2 0 0];
    V(:,12) = [1/4 sqrt(3)/4 0];
    V(:,13) = [-1/4 sqrt(3)/4 0]; 
    
    %Set facet vectors and corresponding vector length factor
    FacetVec = [V(:,1) -V(:,1) ...
                V(:,2) -V(:,2) V(:,3) -V(:,3) V(:,4) -V(:,4) ...
                V(:,5) -V(:,5) V(:,6) -V(:,6) V(:,7) -V(:,7) V(:,8) -V(:,8) V(:,9) -V(:,9) V(:,10) -V(:,10)...
                V(:,11) -V(:,11) V(:,12) -V(:,12) V(:,13) -V(:,13)];
            
    ampmtx = zeros(1,26);         
    ampmtx(1,1:2) = a_0001/caxis; 
    ampmtx(1,3:8) = a_10_10/dside;
    ampmtx(1,9:20) = a_10_11/hhside;
    ampmtx(1,21:26) = a_11_20/dside3;
    
    %Loop over all points within 2*bound x 2*bound x 2*bound cube
    for x = -bound:step:bound
        % Check if cancel button pressed
        if getappdata(progressbar,'canceling')
            iso = [];
            coordmatrix = [];
            break
        end
        i = i+1;
        j = 0;
        for y = -bound:step:bound
            j = j+1;
            m = 0;
            for z = -bound:step:bound
                m = m + 1;
                
                Vscalar = 1;
                
                %Loop over all {0001}, {10_11}, and {10_10} facets to get V
                
                for loop = 1:26
                    face = squeeze(FacetVec(:,loop));
                    amp = ampmtx(loop);
                    
                    if Vscalar > 1E-8
                        
                        gg = face(1)*face(1) + face(2)*face(2) + face(3)*face(3);
                        
                        enhance = 1;
                        
                        %Compare [x,y,z] projection on g with g
                        %For (x,y,z) inside the shape F1 = 1
                        %For (x,y,z) outside the shape F1 deacys exp.
                        dotxyz_g = amp*enhance*(x*face(1)+y*face(2)+z*face(3)); %i.e. dot([x;y;z],g)
                        dotg_g = amp*amp*enhance*enhance*(gg);
                        if dotxyz_g < dotg_g
                            F1 = 1;
                        else
                            F1 = exp(-beta*(dotxyz_g-dotg_g)*(dotxyz_g-dotg_g));
                        end
                        Vscalar = Vscalar*F1;
                    end
                end %end of loop over faces
                Vtot(i,j,m) = Vscalar;
                if Vscalar>=isovalue
                    ccm=[x y z];
                    nnn = nnn + 1;
                    coordmatrix(nnn,:)=(ccm);
                end
            end
        end
        waitbar(i / steps)
    end %end of loops in space (x,y,z)
    
    % Produce plot and output if the cancel button has not been pressed
    if getappdata(progressbar,'canceling')==1
        delete(progressbar)
        return
    else
        delete(progressbar)
        
        coordmatrix = coordmatrix(1:nnn,:);
        Vtotsm=smooth3(Vtot,'box',box);
        
        [mX,mY,mZ] = meshgrid(-bound:step:bound,-bound:step:bound,-bound:step:bound);
        iso = isosurface(mX,mY,mZ,Vtotsm,isovalue);
        
        setappdata(handles.DDSCATdipolescreate, 'Vtot', Vtot); %should this stay? ***
        setappdata(handles.DDSCATdipolescreate, 'coordmatrix', coordmatrix);
        setappdata(handles.EffRadiusCalc, 'coordmatrix', coordmatrix);
        
        guidata(hObject, handles)
        
    end

function [coordmatrix,iso] = hcp_monotwin(a_0001, a_10_10, a_10_11, a_11_20, ...
    a_0001_old, a_10_10_old, a_10_11_old, a_11_20_old, ...
    hcp_twin_label, omega, gamma,...
    hObject, handles)

%.......................Short description..............................
% This models the Wulff construction of a crystal with two twin shapes 
% (one twin plane defined by the input hcp_twin_label). The same proceedure 
% as in the single crystal construction is followed but it is mirrored 
% on the plane specified. The angle omega is used to define the rotation
% and is constant for each twin plane.
% The shape is rotated so that the mirror plane is on the x-y plane 
%......................................................................

    %define inputs
    beta=get(handles.smbeta,'String');
    beta=str2double(beta);
    box=get(handles.smbox,'String');
    box=str2double(box);
    bound=get(handles.calcbound,'String');
    bound=str2double(bound);
    step=get(handles.calcstep,'String');
    step=str2double(step);
    reentrant=get(handles.reentrantenhancement_hcp,'String');
    reentrant=str2double(reentrant);
    twin=get(handles.twinenhancement_hcp,'String');
    twin=str2double(twin);
    aaxis_in=get(handles.hcp_a,'String');
    aaxis_in=str2double(aaxis_in);
    caxis_in=get(handles.hcp_c,'String');
    caxis_in=str2double(caxis_in);
    
    if mod(bound,step) ~= 0
    	errormessage = errordlg('Calculation boundaries must be divisible by calculation step to give an integer');
        return
    end
    
    %update handles
    guidata(hObject, handles);

    %Start calculations
    isovalue=0.001;
    progressbar = waitbar(0,'Monotwin calculation in progress',...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)'); 
    setappdata(progressbar,'canceling',0); 
    steps = 2 * round(bound / step) +1;
    Vtot = zeros(steps, steps, steps);
    i = 0;
    
    coordmatrix = zeros(10^8,3);
    nnn = 0;
    
    ration = caxis_in/aaxis_in;
    aaxis = 1;
    caxis = ration;
    dside = sqrt(3)/2*aaxis;
    hside = sqrt(3)*aaxis*caxis/sqrt(3*aaxis^2+4*caxis^2);
    ODside = sqrt(dside^2*(caxis^2-hside^2)/(caxis^2+dside^2));
    Xoa = ODside*sqrt(3)/2;
    Yoa = ODside/2;
    Zoa = sqrt(hside^2-ODside^2);
    hhside = sqrt(Zoa^2+Xoa^2+Yoa^2);
    dside2 = aaxis/2;
    
    V = zeros(3,13);
    V(:,1) = [0; 0; caxis]; %0001
    V(:,2) = [aaxis*3/4; aaxis*sqrt(3)/4; 0]; %10_10
    V(:,3) = [aaxis*3/4; -aaxis*sqrt(3)/4; 0]; %10_10
    V(:,4) = [0; sqrt(3)/2; 0]; %10_10
    V(:,5) = [Xoa; Yoa; Zoa]; %10_11
    V(:,6) = [-Xoa; Yoa; Zoa]; %10_11
    V(:,7) = [Xoa; -Yoa; Zoa]; %10_11
    V(:,8) = [-Xoa; -Yoa; Zoa]; %10_11
    V(:,9) = [0; ODside; Zoa]; %10_11
    V(:,10) = [0; -ODside; Zoa]; %10_11
    V(:,11) = [1/2 0 0];
    V(:,12) = [1/4 sqrt(3)/4 0];
    V(:,13) = [-1/4 sqrt(3)/4 0]; 
            
    %Rotation matrices and angles
    theta = 0;
    
    Rotz = [cos(gamma*pi/180) sin(gamma*pi/180)    0;
        -sin(gamma*pi/180)  cos(gamma*pi/180)    0;
               0                   0            1];

    Roty = [cos(omega*pi/180)     0     -sin(omega*pi/180);
               0              1                0;
        sin(omega*pi/180)     0     cos(omega*pi/180)];

    Rotx = [    1               0                      0;
            0       cos(theta*pi/180)     sin(theta*pi/180);
            0       -sin(theta*pi/180)    cos(theta*pi/180)];
        
   %Rotate involved vectors
    V = Rotz*V;
    V = Roty*V;
    
    ampmtx = zeros(1,26);
    ampmtx(1,1:2) = a_0001/caxis;
    ampmtx(1,3:8) = a_10_10/dside;
    ampmtx(1,9:20) = a_10_11/hhside;
    ampmtx(1,21:26) = a_11_20/dside2;
        
    %Set facet vectors and corresponding vector length factor
    FacetVec = [V(:,1) -V(:,1) ...
        V(:,2) -V(:,2) V(:,3) -V(:,3) V(:,4) -V(:,4) ...
        V(:,5) -V(:,5) V(:,6) -V(:,6) V(:,7) -V(:,7) V(:,8) -V(:,8) V(:,9) -V(:,9) V(:,10) -V(:,10)...
        V(:,11) -V(:,11) V(:,12) -V(:,12) V(:,13) -V(:,13)];
    
    amptwin = ampmtx;
    
    if a_0001_old ~= 0
        amptwin(1,1:2) = a_0001_old/caxis;
        amptwin(1,3:8) = a_10_10_old/dside;
        amptwin(1,9:20) = a_10_11_old/hhside;
        amptwin(1,21:26) = a_11_20_old/dside2;
    end
    
    
    % Calculations for the twin plane, define colour and points of plot
    if hcp_twin_label == '10_11'
        V1 = V(:,5);
        hhside2 = hhside;
        loopvec = [1 2 5 7 12 13 17 20 21 22 23 24 25 26];
            
        
    elseif hcp_twin_label == '10_12'
        cc = caxis/2;
        hside2 = sqrt(3)*aaxis*cc/sqrt(3*aaxis^2+4*cc^2);
        ODside2 = sqrt(dside^2*(cc^2-hside2^2)/(cc^2+dside^2));
        Zoa2 = sqrt(hside2^2-ODside2^2);
        Xoa2 = ODside2*sqrt(3)/2;
        Yoa2 = ODside2/2;
        hhside2 = sqrt(Zoa2^2+Xoa2^2+Yoa2^2);
        
        V1(:,1) = [Xoa2; Yoa2; Zoa2];
        V1(:,1) = Rotz*squeeze(V1(:,1));
        V1(:,1) = Roty*squeeze(V1(:,1));

        loopvec = [1 2 5 7 12 13 17 20 21 22 23 24 25 26];
            
    elseif hcp_twin_label == '10_13'
        cc = caxis/3;
        hside2 = sqrt(3)*aaxis*cc/sqrt(3*aaxis^2+4*cc^2);
        ODside2 = sqrt(dside^2*(cc^2-hside2^2)/(cc^2+dside^2));
        Zoa2 = sqrt(hside2^2-ODside2^2);
        Xoa2 = ODside2*sqrt(3)/2;
        Yoa2 = ODside2/2;
        hhside2 = sqrt(Zoa2^2+Xoa2^2+Yoa2^2);
        
        V1(:,1) = [Xoa2; Yoa2; Zoa2];
        V1(:,1) = Rotz*squeeze(V1(:,1));
        V1(:,1) = Roty*squeeze(V1(:,1));

        loopvec = [1 2 5 7 12 13 17 20 21 22 23 24 25 26];
        
    elseif hcp_twin_label == '11_21'
        cc = caxis/1;
        hside2 = dside2*cc/sqrt(dside2^2+cc^2);
        ODside2 = sqrt(dside2^2*(cc^2-hside2^2)/(cc^2+dside2^2));
        Zoa2 = sqrt(hside2^2-ODside2^2);
        Xoa2 = ODside2;
        Yoa2 = 0;
        hhside2 = sqrt(Zoa2^2+Xoa2^2+Yoa2^2);
        
        V1(:,1) = [Xoa2; Yoa2; Zoa2];
        V1(:,1) = Rotz*squeeze(V1(:,1));
        V1(:,1) = Roty*squeeze(V1(:,1));
        
        loopvec = [1 2 7 8 17 18 19 20 23 26];
        
    elseif hcp_twin_label == '11_22'
        cc = caxis/2;
        hside2 = dside2*cc/sqrt(dside2^2+cc^2);
        ODside2 = sqrt(dside2^2*(cc^2-hside2^2)/(cc^2+dside2^2));
        Zoa2 = sqrt(hside2^2-ODside2^2);
        Xoa2 = ODside2;
        Yoa2 = 0;
        hhside2 = sqrt(Zoa2^2+Xoa2^2+Yoa2^2);
        
        V1(:,1) = [Xoa2; Yoa2; Zoa2];
        V1(:,1) = Rotz*squeeze(V1(:,1));
        V1(:,1) = Roty*squeeze(V1(:,1));
        
        loopvec = [1 2 7 8 17 18 19 20 23 26];        
        
    elseif hcp_twin_label == '11_23'
        cc = caxis/3;
        hside2 = dside2*cc/sqrt(dside2^2+cc^2);
        ODside2 = sqrt(dside2^2*(cc^2-hside2^2)/(cc^2+dside2^2));
        Zoa2 = sqrt(hside2^2-ODside2^2);
        Xoa2 = ODside2;
        Yoa2 = 0;
        hhside2 = sqrt(Zoa2^2+Xoa2^2+Yoa2^2);
        
        V1(:,1) = [Xoa2; Yoa2; Zoa2];
        V1(:,1) = Rotz*squeeze(V1(:,1));
        V1(:,1) = Roty*squeeze(V1(:,1));
        
        loopvec = [1 2 7 8 17 18 19 20 23 26];        
        
    elseif hcp_twin_label == '11_24'
        cc = caxis/4;
        hside2 = dside2*cc/sqrt(dside2^2+cc^2);
        ODside2 = sqrt(dside2^2*(cc^2-hside2^2)/(cc^2+dside2^2));
        Zoa2 = sqrt(hside2^2-ODside2^2);
        Xoa2 = ODside2;
        Yoa2 = 0;
        hhside2 = sqrt(Zoa2^2+Xoa2^2+Yoa2^2);
        
        V1(:,1) = [Xoa2; Yoa2; Zoa2];
        V1(:,1) = Rotz*squeeze(V1(:,1));
        V1(:,1) = Roty*squeeze(V1(:,1));
        
        loopvec = [1 2 7 8 17 18 19 20 23 26];
        
    end
          
    %Loop over all points within 2*bound x 2*bound x 2*bound cube
    for x = -bound:step:bound
    % Check if cancel button pressed
    if getappdata(progressbar,'canceling')
        iso = [];
        coordmatrix = [];
        break
    end
    i = i+1;
    j = 0;
    for y = -bound:step:bound
        j = j+1;
        m = 0;
        for z = -bound:step:bound
            m = m + 1;

            t = 1-(V1(1,1)/hhside2^2)*x-(V1(2,1)/hhside2^2)*y-(V1(3,1)/hhside2^2)*z;
            a = V1(1,1)*x+V1(2,1)*y+V1(3,1)*z;
            if a > hhside2^2
                xx = x ; yy = y ; zz = z;
            else
                %Mirror about the plane 
                xx = x+2*t*V1(1,1) ; yy = y+2*t*V1(2,1) ; zz = z+2*t*V1(3,1);
            end
            
            Vscalar = 1;
            
            %Loop over all {0001}, {10_11}, and {10_10} facets to get V
            for loop = 1:length(FacetVec)
                face = squeeze(FacetVec(:,loop));
                amp = ampmtx(loop);
                ampt = amptwin(loop);
                
                if Vscalar > 1E-8
                    gg = face(1)*face(1) + face(2)*face(2) + face(3)*face(3);
                    enhance = 1;
                    
                    %enhancement loop
                    if face(1)*V1(1,1) + face(2)*V1(2,1) + face(3)*V1(3,1) < 0 %dot([h;k;l],[Xoa;Yoa;Zoa])<0 i.e. if the face is re-entrant type
                        enhance=1.0+(reentrant+twin)*ampt/amp;
                    elseif V1(1,1)*face(1) + V1(2,1)*face(2) - V1(3,1)*face(3) == hhside2^2 %i.e 10_1_2
                        enhance=1.0;
                    elseif ismember(loop,loopvec) == 1
                        enhance=1.0+ twin*ampt/amp;
                    end
                    
                    %Compare [x,y,z] projection on g with g
                    %For (x,y,z) inside the shape F1 = 1
                    %For (x,y,z) outside the shape F1 deacys exp.
                    dotxyz_g = amp*enhance*(xx*face(1)+yy*face(2)+zz*face(3)); %i.e. dot([x;y;z],g)
                    dotg_g = amp*amp*enhance*enhance*(gg);
                    if dotxyz_g < dotg_g
                        F1 = 1;
                    else
                        F1 = exp(-beta*(dotxyz_g-dotg_g)*(dotxyz_g-dotg_g));
                    end
                    Vscalar = Vscalar*F1;
                end
            end %end of loop over faces
            Vtot(i,j,m) = Vscalar;
            if Vscalar>=isovalue
                ccm=[x y z];
                nnn = nnn + 1;
                coordmatrix(nnn,:)=(ccm);
            end
        end
    end
    waitbar(i / steps)
    end %end of loops in space (x,y,z)
    % Produce plot and output if the cancel button has not been pressed
    if getappdata(progressbar,'canceling')==1 
        delete(progressbar)
        return
    else 
        coordmatrix = coordmatrix(1:nnn,:);
        size(coordmatrix)
        Vtotsm=smooth3(Vtot,'box',box);    
        
        %create shape
        [mX,mY,mZ] = meshgrid(-bound:step:bound,-bound:step:bound,-bound:step:bound);
        iso = isosurface(mX,mY,mZ,Vtotsm,isovalue);

        guidata(hObject, handles)
        delete(progressbar)
    end



