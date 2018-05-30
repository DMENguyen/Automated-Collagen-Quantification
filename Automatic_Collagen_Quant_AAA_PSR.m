function varargout = Automatic_Collagen_Quant_AAA_PSR(varargin)
% AUTOMATIC_COLLAGEN_QUANT_AAA_PSR MATLAB code for Automatic_Collagen_Quant_AAA_PSR.fig
%      AUTOMATIC_COLLAGEN_QUANT_AAA_PSR, by itself, creates a new AUTOMATIC_COLLAGEN_QUANT_AAA_PSR or raises the existing
%      singleton*.
%
%      H = AUTOMATIC_COLLAGEN_QUANT_AAA_PSR returns the handle to a new AUTOMATIC_COLLAGEN_QUANT_AAA_PSR or the handle to
%      the existing singleton*.
%
%      AUTOMATIC_COLLAGEN_QUANT_AAA_PSR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOMATIC_COLLAGEN_QUANT_AAA_PSR.M with the given input arguments.
%
%      AUTOMATIC_COLLAGEN_QUANT_AAA_PSR('Property','Value',...) creates a new AUTOMATIC_COLLAGEN_QUANT_AAA_PSR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Automatic_Collagen_Quant_AAA_PSR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Automatic_Collagen_Quant_AAA_PSR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help Automatic_Collagen_Quant_AAA_PSR
 
% Last Modified by GUIDE v2.5 29-May-2018 23:45:36
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Automatic_Collagen_Quant_AAA_PSR_OpeningFcn, ...
                   'gui_OutputFcn',  @Automatic_Collagen_Quant_AAA_PSR_OutputFcn, ...
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
 
 
% --- Executes just before Automatic_Collagen_Quant_AAA_PSR is made visible.
function Automatic_Collagen_Quant_AAA_PSR_OpeningFcn(hObject, eventdata, handles, varargin)
 
handles.output = hObject;
 
 
guidata(hObject, handles);
 
 
 
 
 
function varargout = Automatic_Collagen_Quant_AAA_PSR_OutputFcn(hObject, eventdata, handles) 
 
varargout{1} = handles.output;
% -------------------------------------------------------------------------
% Loading Bright-field and Polarized Images
% -------------------------------------------------------------------------
 
function load_Callback(hObject, eventdata, handles)
axes(handles.axes1);
 
[bright_field, pathname] = uigetfile(...    
    {'*.jpg; *.JPG; *.jpeg; *.JPEG; *.img; *.IMG; *.tif; *.TIF; *.tiff, *.TIFF','Supported Files (*.jpg,*.img,*.tiff,)'; ...
    '*.jpg','jpg Files (*.jpg)';...
    '*.JPG','JPG Files (*.JPG)';...
    '*.jpeg','jpeg Files (*.jpeg)';...
    '*.JPEG','JPEG Files (*.JPEG)';...
    '*.img','img Files (*.img)';...
    '*.IMG','IMG Files (*.IMG)';...
    '*.tif','tif Files (*.tif)';...
    '*.TIF','TIF Files (*.TIF)';...
    '*.tiff','tiff Files (*.tiff)';...
    '*.TIFF','TIFF Files (*.TIFF)'});
im_bright_field = imread(bright_field);
setappdata(0,'bright_field',bright_field);
im_bright = im_bright_field(:,:,1:3);
setappdata(0,'im_bright',im_bright);
set(handles.bf_filename,'String',bright_field);
imshow(im_bright);
 
 
function load_po_Callback(hObject, eventdata, handles)
axes(handles.axes2);
 
[polarized, pathname] = uigetfile(...    
    {'*.jpg; *.JPG; *.jpeg; *.JPEG; *.img; *.IMG; *.tif; *.TIF; *.tiff, *.TIFF','Supported Files (*.jpg,*.img,*.tiff,)'; ...
    '*.jpg','jpg Files (*.jpg)';...
    '*.JPG','JPG Files (*.JPG)';...
    '*.jpeg','jpeg Files (*.jpeg)';...
    '*.JPEG','JPEG Files (*.JPEG)';...
    '*.img','img Files (*.img)';...
    '*.IMG','IMG Files (*.IMG)';...
    '*.tif','tif Files (*.tif)';...
    '*.TIF','TIF Files (*.TIF)';...
    '*.tiff','tiff Files (*.tiff)';...
    '*.TIFF','TIFF Files (*.TIFF)'});
im_polarized = imread(polarized);
im_polar = im_polarized(:,:,1:3);
setappdata(0,'im_polar',im_polar);
set(handles.po_filename,'String',polarized);
imshow(im_polar);
 
% -------------------------------------------------------------------------
% Checking for Scale Bar
% -------------------------------------------------------------------------
 
function scale_check_Callback(hObject, eventdata, handles)
 
scale_check = get(hObject,'Value');
setappdata(0,'scale_check',scale_check);
 
% Input length of scale bar in pixels
function scale_bar_pixel_Callback(hObject, eventdata, handles)
 
scale_pixel = str2double(get(handles.scale_bar_pixel,'String'));
setappdata(0,'scale_pixel',scale_pixel);
 
function scale_bar_pixel_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
% Input representative length of scale bar in microns
function scale_bar_um_Callback(hObject, eventdata, handles)
 
scale_bar = str2double(get(handles.scale_bar_um,'String'));
setappdata(0,'scale_bar_um',scale_bar);
 
function scale_bar_um_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% -------------------------------------------------------------------------
% Offset Checking
% -------------------------------------------------------------------------
function offset_check_Callback(hObject, eventdata, handles)
 
offset_check = get(hObject,'Value');
setappdata(0,'offset_check',offset_check);

% Defining horizontal offset
function x_offset_Callback(hObject, eventdata, handles)
 
x_offset = str2double(get(handles.x_offset,'String'));
setappdata(0,'x_offset',x_offset);

function x_offset_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
% Defining vertical offset 
function y_offset_Callback(hObject, eventdata, handles)
 
y_offset = str2double(get(handles.y_offset,'String'));
setappdata(0,'y_offset',y_offset);
 
function y_offset_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% -------------------------------------------------------------------------
% Outputs
% -------------------------------------------------------------------------

% Bright-field file name
function bf_filename_Callback(hObject, eventdata, handles)
 
function bf_filename_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Polarized file name
function po_filename_Callback(hObject, eventdata, handles)
 
function po_filename_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
% Media collagen quantity 
function Media_Pixel_Output_Callback(hObject, eventdata, handles)

function Media_Pixel_Output_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Adventitia collagen quantity
function Adventitia_Pixel_Output_Callback(hObject, eventdata, handles)

function Adventitia_Pixel_Output_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Media collagen percentage
function Media_Percent_Output_Callback(hObject, eventdata, handles)
 
function Media_Percent_Output_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Adventitia collagen percentage
function Adventitia_Percent_Output_Callback(hObject, eventdata, handles)
 
function Adventitia_Percent_Output_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Media collagen surface area (requires scale bar)
function media_SA_Callback(hObject, eventdata, handles)
 
function media_SA_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Adventitia collagen surface area (requires scale bar)
function adventitia_SA_Callback(hObject, eventdata, handles)
 
function adventitia_SA_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 

% -------------------------------------------------------------------------
% Image Processing and Quantification
% -------------------------------------------------------------------------
 
function process_Callback(hObject, eventdata, handles)
 
axes(handles.axes3);
 
im_bright = getappdata(0,'im_bright');
im_polar = getappdata(0,'im_polar');
% Converting to grayscale and equilization
grey_polar1 = rgb2gray(im_polar);
grey_polar = adapthisteq(grey_polar1);
 
% Using the green layer of bright field for threshold
green_bf = im_bright(:,:,2);
 
% Thresholding
binary_bf = imcomplement(imbinarize(green_bf,'adaptive','ForegroundPolarity','dark','Sensitivity',.3));
% Defining structural elements
SE1 = strel('disk',8);
SE2 = strel('disk',4);
 
% Erosion/Dilation/Erosion to to eliminate the pixels associated with the
% media (non-red)
erode = imerode(binary_bf,SE2);
dilate = imdilate(erode,SE1);
erode2 = imerode(dilate,SE2);
 
% Removal of islands smaller than 600 px
BW = bwareaopen(erode2,600);
 
% Conversion to uint8
BWunit = im2uint8(BW);
 
% Finding the center of the image
[m,n] = size(BW);
seedrow = m/2;
seedcol = n/2;
 
% Defining region of interest that contains media
grey2 = grayconnected(BWunit,seedrow,seedcol,1);
grey_uint = im2uint8(grey2);
 
% Adjusting the images for alignment with Polarized
offset_check = getappdata(0,'offset_check');
if offset_check == 1
    x_offset = getappdata(0,'x_offset');
    y_offset = getappdata(0,'y_offset');
else
    x_offset = 0;
    y_offset = 0;
end

med = imtranslate(grey_uint,[x_offset,y_offset]);
med_comp = imcomplement(med);
 
% Creating a smaller mask to remove islands within the region of interest
med_comp_res = imresize(med_comp,.8);
[m2,n2] = size(med_comp_res);
shiftx = (n - n2)/2;
shifty = (m - m2)/2;
mask = ones(m2+shifty*2,n2+shiftx*2);
mask = mask.*255;
mask(shifty+1:end-shifty,shiftx+1:end-shiftx) = med_comp_res;
 
% Polarized image with adventitia removed
media = im_polar - med_comp;
 
% Thresholding Polarized
polarized_th = im2uint8(imbinarize(grey_polar)) - imcomplement(im2uint8(mask));
 
% Defining Media
media = polarized_th - med_comp;
imshowpair(polarized_th,media);
 
% Count
overall_count = sum(polarized_th(:) == 255);
media_count = sum(media(:) == 255);
adventitia_count = overall_count - media_count;
percent_in_media = media_count/overall_count*100;
percent_in_adventitia = 100 - percent_in_media;
 
med_per = strcat(num2str(percent_in_media),'%');
adv_per = strcat(num2str(percent_in_adventitia),'%');
 
% Scale bar calculations
scale_bar = getappdata(0,'scale_bar_um');
scale_pixels = getappdata(0,'scale_pixel');
scale_check = getappdata(0,'scale_check');
if scale_check == 1
    pixel_scale = scale_bar/scale_pixels;
    surface_area_media = pixel_scale * media_count;
    surface_area_adv = pixel_scale * adventitia_count;
else
    surface_area_media = 'n/a';
    surface_area_adv = 'n/a';
end
 
set(handles.Media_Pixel_Output,'String',media_count);
set(handles.Adventitia_Pixel_Output,'String',adventitia_count);
set(handles.Media_Percent_Output,'String',med_per);
set(handles.Adventitia_Percent_Output,'String',adv_per);
set(handles.adventitia_SA,'String',surface_area_adv);
set(handles.media_SA,'String',surface_area_media);