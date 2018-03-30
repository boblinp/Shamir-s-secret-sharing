function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 06-Feb-2018 14:52:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

global R
global B
global G
R = []; G = []; B = [];
global imageSize
imageSize = [0,0];
global p
p = 251;
global k
global n
k = 0; n = 0;
global shadowsR
shadowsR = [];
global shadowsG
shadowsG = [];
global shadowsB
shadowsB = [];
global shadowsModR
shadowsModR = [];
global shadowsModG
shadowsModG = [];
global shadowsModB
shadowsModB = [];
global photoName
photoName = '';
global photoPath
photoPath = '';

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%preuzmi fajl
[File_Name, Path_Name] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'});
if File_Name == 0
    return;
end

%prazni sve
global R, global B, global G, global imageSize
global k, global n
k = 0; n = 0;
global shadowsR
shadowsR = [];
global shadowsG
shadowsG = [];
global shadowsB
shadowsB = [];
global shadowsModR
shadowsModR = [];
global shadowsModG
shadowsModG = [];
global shadowsModB
shadowsModB = [];
global photoName, global photoPath;


%cisti sve ostalo
 set(handles.edit13,'String','');
 set(handles.text13,'String','Izabrana slika.');
 set(handles.edit3,'String','');
 set(handles.edit4,'String','');
 set(handles.edit8,'String','');
 axes(handles.axes7);
 cla;
 axes(handles.axes3);
 cla;
 axes(handles.axes6);
 cla;
 
axes(handles.axes2);
imshow([Path_Name,File_Name]);
photoPath = Path_Name; 
[~, name, ~] = fileparts(File_Name);
photoName = name;

global p
[ R, G, B ] = readImage( strcat(Path_Name,File_Name) );
%slika se sprema za dalju obradu
 R = prepare( R, p );
 G = prepare( G, p );
 B = prepare( B, p );
 imageSize = size(R);
 
 set(handles.edit10,'String',int2str(imageSize(1)));
 set(handles.edit12,'String',int2str(imageSize(2)));

 

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
global imageSize
pom = get( handles.edit3, 'String');
flag = sum( isstrprop(pom, 'digit') == 0 );

if flag ~= 0
   set(handles.edit3,'String','');
   warndlg('Morate uneti broj!');
else 
   if imageSize(1) == 0
        set(handles.edit3,'String','');
        warndlg('Izaberite sliku prvo!');
   else
        k = str2double(pom);
        if mod( imageSize(1)*imageSize(2), k ) ~= 0
            k = 0;
            set(handles.edit3,'String','');
            warndlg('k koje ste izabrali ne može se primeniti zbog velicine slike!');
        end
   end
end



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global n
global k
pom = get( handles.edit4, 'String');
flag = sum( isstrprop(pom, 'digit') == 0 );

if flag ~= 0
   set(handles.edit4,'String','');
   warndlg('Morate uneti broj!');
else  
   n = str2double(pom);  
   if n < k      
       set(handles.edit4,'String','');
       warndlg('n more biti vece ili jednako k!');
       n = k;
   end
end


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global k
global n
global R
global B
global G
global imageSize
global shadowsR
global shadowsB
global shadowsG

if imageSize(1) == 0
    warndlg('Izaberite sliku!');
    return;
end

if k == 0
    warndlg('Izaberite k!');
    return;
end

if n == 0
    warndlg('Izaberite n!');
    return;
end
set(handles.axes3,'visible','on');

tic
shadowsR = encrypt( R, k, n, p );
shadowsG = encrypt( G, k, n, p );
shadowsB = encrypt( B, k, n, p );
kraj = toc;

shadowSize = size(shadowsR);

%razmaci
blankSpace = ones( shadowSize(1), 30, 3 ) * 240;

% Stitch together
outputImage = [];
global photoName, global photoPath
for i = 1:n
    RGB = cat(3, uint8(shadowsR(:,:,i)), uint8(shadowsG(:,:,i)), uint8(shadowsB(:,:,i))); 
    %senke se ispisu 
    fileName = strcat(photoPath, photoName, 'senka',int2str(i),'.png');
    imwrite(RGB, fileName, 'png');
    outputImage = [outputImage, RGB, blankSpace];
end

axes(handles.axes3);
imshow(outputImage);
set(handles.text13,'String',strcat('Izvršeno generisanje senki metodom 1. Proteklo vreme:',int2str(kraj)));


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global p
global k
global n
global R
global B
global G
global imageSize
global shadowsModR
global shadowsModB
global shadowsModG

if imageSize(1) == 0
    warndlg('Izaberite sliku!');
    return;
end

if k == 0
    warndlg('Izaberite k!');
    return;
end

if n == 0
    warndlg('Izaberite n!');
    return;
end

set(handles.axes6,'visible','on')
x = 1:n;
tic;
shadowsModR = encryptMod( R, k, n, p, x );
shadowsModG = encryptMod( G, k, n, p, x );
shadowsModB = encryptMod( B, k, n, p, x );
kraj = toc;

shadowSize = size(shadowsModR);

%razmaci
blankSpace = ones( shadowSize(1), 30, 3 ) * 240;

% Stitch together
outputImageMod = [];
global photoName, global photoPath
for i = 1:n    
    RGBMod = cat(3, uint8(shadowsModR(:,:,i)), uint8(shadowsModG(:,:,i)), uint8(shadowsModB(:,:,i)));  
    %senke se ispisu 
    fileName = strcat(photoPath, photoName, 'senkaMod',int2str(i),'.png');
    imwrite(RGBMod, fileName, 'png');
    outputImageMod = [outputImageMod, RGBMod, blankSpace];
end

axes(handles.axes6);
imshow(outputImageMod);

set(handles.text13,'String',strcat('Izvršeno generisanje senki metodom 2. Proteklo vreme:',int2str(kraj)));


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n

pom = get( handles.edit8, 'String');

for i = 1:length(pom)
    if isstrprop(pom(i), 'digit') == 1
        indeks = str2double(pom(i));
        if indeks > n
            set(handles.edit8,'String',pom(1:i-1));
            warndlg('Indeks van granica!');
            return;
        end
    else
        if pom(i) ~= ' '
             set(handles.edit8,'String',pom(1:i-1));
             warndlg('Neispravan znak!');
             return;
        end
    end
end



% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global shadowsR
global shadowsB
global shadowsG
global imageSize
global p

imageSize(1) = str2double(get( handles.edit10, 'String'));
imageSize(2) = str2double(get( handles.edit12, 'String'));

if isnan(imageSize(1))
     warndlg('Unesite velicinu slike!');
     return;
end

%preuzmi indekse senki koje se koriste
indeksi = [];
pom = get( handles.edit8, 'String');

for i = 1:length(pom)         
        if pom(i) ~= ' '
            indeksi = [indeksi str2double(pom(i))];
        end
end

%preuzmi x vrednosti senki koje se koriste
x = [];
pom = get( handles.edit13, 'String');

for i = 1:length(pom)         
        if pom(i) ~= ' '
           x = [x str2double(pom(i))];
        end
end


tic;
[ originalR ] = decrypt( shadowsR(:,:,indeksi), x, p, imageSize );
[ originalG ] = decrypt( shadowsG(:,:,indeksi), x, p, imageSize );
[ originalB ] = decrypt( shadowsB(:,:,indeksi), x, p, imageSize );
kraj = toc;

axes(handles.axes7);
RGB = cat(3, uint8(originalR), uint8(originalG), uint8(originalB)); 
imshow(RGB) 
set(handles.text13,'String',strcat('Izvršeno rekonstrukcija metodom 1. Proteklo vreme:', int2str(kraj)));
global photoPath, global photoName
fileName = strcat(photoPath, photoName, 'Rekonstrukcija','.png');
imwrite(RGB, fileName, 'png');

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global shadowsModR
global shadowsModB
global shadowsModG
global imageSize
global p

imageSize(1) = str2double(get( handles.edit10, 'String'));
imageSize(2) = str2double(get( handles.edit12, 'String'));

if isnan(imageSize(1))
     warndlg('Unesite velicinu slike!');
     return;
end


%preuzmi indekse senki koje se koriste
indeksi = [];
pom = get( handles.edit8, 'String');

for i = 1:length(pom)         
        if pom(i) ~= ' '
            indeksi = [indeksi str2double(pom(i))];
        end
end

%preuzmi x vrednosti
x = [];
pom = get( handles.edit13, 'String');

for i = 1:length(pom)         
        if pom(i) ~= ' '
           x = [x str2double(pom(i))];
        end
end

tic
[ originalR ] = decryptMod( shadowsModR(:,:,indeksi), x, p, imageSize );
[ originalG ] = decryptMod( shadowsModG(:,:,indeksi), x, p, imageSize );
[ originalB ] = decryptMod( shadowsModB(:,:,indeksi), x, p, imageSize );
kraj = toc;

axes(handles.axes7);
RGB = cat(3, uint8(originalR), uint8(originalG), uint8(originalB)); 
imshow(RGB) 

set(handles.text13,'String',strcat('Izvršeno rekonstrukcija metodom 2. Proteklo vreme:', int2str(kraj)));

global photoPath, global photoName
fileName = strcat(photoPath, photoName, 'RekonstrukcijaMod','.png');
imwrite(RGB, fileName, 'png');



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pom = get( handles.edit8, 'String');

for i = 1:length(pom)
    if isstrprop(pom(i), 'digit') == 1
        return
    else
        if pom(i) ~= ' '
             set(handles.edit8,'String',pom(1:i-1));
             warndlg('Neispravan znak!');
             return;
        end
    end
end


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,PathName] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'MultiSelect','on');
numfiles = size(FileName,2);

if FileName(1) == 0
    return;
end

%cisti sve ostalo
 set(handles.text13,'String','Dodane senke.');
 set(handles.edit3,'String','');
 set(handles.edit4,'String','');
 set(handles.edit8,'String','');
 set(handles.edit10,'String','');
 set(handles.edit12,'String','');
 set(handles.edit13,'String','');
 axes(handles.axes7);
 cla;
 axes(handles.axes3);
 cla;
 axes(handles.axes6);
 cla;
 axes(handles.axes2);
 cla;

global R, global B, global G, global imageSize
global k, global n
imageSize = [0 0];
k = 0; n = 0;
global shadowsR
shadowsR = [];
global shadowsG
shadowsG = [];
global shadowsB
shadowsB = [];
global shadowsModR
shadowsModR = [];
global shadowsModG
shadowsModG = [];
global shadowsModB
shadowsModB = [];
global photoName, global photoPath;
photoName = 'oldSharesReconstruction';

%ucitaj prvu senku
[ R, G, B ] = readImage( strcat(PathName,FileName{1}) );
shadowSize = size(R);
shadowsR = ones(shadowSize(1),shadowSize(2),numfiles) * 113;
shadowsG = ones(shadowSize(1),shadowSize(2),numfiles) * 213;
shadowsB = ones(shadowSize(1),shadowSize(2),numfiles) * 113;
shadowsR(:,:,1) = R;
shadowsG(:,:,1) = G;
shadowsB(:,:,1) = B;
for ii = 2:numfiles  
    [ R, G, B ] = readImage( strcat(PathName,FileName{ii}) );
    shadowsR(:,:,ii) = R;
    shadowsG(:,:,ii) = G;
    shadowsB(:,:,ii) = B;
end  
R = []; G = []; B = [];
%razmaci
blankSpace = ones( shadowSize(1), 30, 3 ) * 240;

% Stitch together
n = numfiles;
outputImage = [];
for i = 1:n
    RGB = cat(3, uint8(shadowsR(:,:,i)), uint8(shadowsG(:,:,i)), uint8(shadowsB(:,:,i)));    
    outputImage = [outputImage, RGB, blankSpace];
end

axes(handles.axes3);
imshow(outputImage);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%cisti sve ostalo

[FileName,PathName] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'MultiSelect','on');

numfiles = size(FileName,2);

if numfiles == 0
    return;
end

 set(handles.text13,'String','Dodane senke.');
 set(handles.edit3,'String','');
 set(handles.edit4,'String','');
 set(handles.edit8,'String','');
 set(handles.edit10,'String','');
 set(handles.edit12,'String','');
 set(handles.edit13,'String','');
 axes(handles.axes7);
 cla;
 axes(handles.axes3);
 cla;
 axes(handles.axes6);
 cla;
 axes(handles.axes2);
 cla;

global R, global B, global G, global imageSize
global k, global n
imageSize = [0 0];
k = 0; n = 0;
global shadowsR
shadowsR = [];
global shadowsG
shadowsG = [];
global shadowsB
shadowsB = [];
global shadowsModR
global shadowsModG
global shadowsModB
global photoName, global photoPath;
photoName = 'oldSharesReconstruction';
photoPath = PathName;
%ucitaj prvu senku
[ R, G, B ] = readImage( strcat(PathName,FileName{1}) );
shadowSize = size(R);
shadowsModR = ones(shadowSize(1),shadowSize(2),numfiles) * 113;
shadowsModG = ones(shadowSize(1),shadowSize(2),numfiles) * 213;
shadowsModB = ones(shadowSize(1),shadowSize(2),numfiles) * 113;
shadowsModR(:,:,1) = R;
shadowsModG(:,:,1) = G;
shadowsModB(:,:,1) = B;
for ii = 2:numfiles  
    [ R, G, B ] = readImage( strcat(PathName,FileName{ii}) );
    shadowsModR(:,:,ii) = R;
    shadowsModG(:,:,ii) = G;
    shadowsModB(:,:,ii) = B;
end  

%razmaci
blankSpace = ones( shadowSize(1), 30, 3 ) * 240;

% Stitch together
n = numfiles;
outputImage = [];
for i = 1:n
    RGB = cat(3, uint8(shadowsModR(:,:,i)), uint8(shadowsModG(:,:,i)), uint8(shadowsModB(:,:,i)));    
    outputImage = [outputImage, RGB, blankSpace];
end
R = []; G = []; B = [];
axes(handles.axes6);
imshow(outputImage);
