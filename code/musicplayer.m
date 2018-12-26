function varargout = musicplayer(varargin)
% MUSICPLAYER MATLAB code for musicplayer.fig
%      MUSICPLAYER, by itself, creates a new MUSICPLAYER or raises the existing
%      singleton*.
%
%      H = MUSICPLAYER returns the handle to a new MUSICPLAYER or the handle to
%      the existing singleton*.
%
%      MUSICPLAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUSICPLAYER.M with the given input arguments.
%      MUSICPLAYER('Property','Value',...) creates a new MUSICPLAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before musicplayer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to musicplayer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help musicplayer

% Last Modified by GUIDE v2.5 16-Apr-2018 18:20:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @musicplayer_OpeningFcn, ...
                   'gui_OutputFcn',  @musicplayer_OutputFcn, ...
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


% --- Executes just before musicplayer is made visible.
function musicplayer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to musicplayer (see VARARGIN)

% Choose default command line output for musicplayer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes musicplayer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = musicplayer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function yxbh_Callback(hObject, eventdata, handles)
% hObject    handle to yxbh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function bfsz_Callback(hObject, eventdata, handles)
% hObject    handle to bfsz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function jq_Callback(hObject, eventdata, handles)   %%渐强
% hObject    handle to jq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global FS;
global nowplayer;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
 index=0;
jianqiang=strength(origin,0);
nowdata=jianqiang;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(jianqiang,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,jianqiang);
% --------------------------------------------------------------------
function jr_Callback(hObject, eventdata, handles)  %%减弱
% hObject    handle to jr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
global origin;
global FS;
global nowplayer;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
index=0;
jianruo=weaken(origin,0);
nowdata=jianruo;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(jianruo,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,jianruo);

% --------------------------------------------------------------------
function df_Callback(hObject, eventdata, handles)   %%倒放
% hObject    handle to df (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global FS;
global nowplayer;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
index=0;
daofang=reverseplay(origin);
nowdata=daofang;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(daofang,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,daofang);
% --------------------------------------------------------------------
function kf_Callback(hObject, eventdata, handles)   %%快放
% hObject    handle to kf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nowplayer;
global origin;
global FS;
global plotmark;
global index;
global kuaifang;
kuaifang=1;
plotmark=0;
index=0;
if isplaying(nowplayer)
    pause(nowplayer);
end
nowplayer=audioplayer(origin,FS*1.5);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,origin,FS*0.1*1.5);
%plot(handles.axes1,origin);
% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)  %%回音
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global nowplayer;
global FS;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
index=0;
huiyin=wav_echo(origin,40000);
nowdata=huiyin;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(huiyin,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,huiyin);

% --------------------------------------------------------------------
function hy_Callback(hObject, eventdata, handles)  %%混音
% hObject    handle to hy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global FS;
global nowplayer;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
index=0;
[filename,pathname] = uigetfile({'*.wav;*.mp3'},'选择音频','off')      %是否能够多选,'off'不支持多选， 'on'支持多选  
if filename~=0
[second, FSs]= audioread(filename);   %FSs音频采样率
hunyin=wav_merge(origin,second);
nowdata=hunyin;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(hunyin,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,hunyin);
end 
% --------------------------------------------------------------------
function lb_Callback(hObject, eventdata, handles)  %%滤波
% hObject    handle to lb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global FS;
global nowplayer;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
index=0;
lubo=wav_filter(origin);
nowdata=lubo;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(origin,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,lubo);

% --------------------------------------------------------------------
function bhsd_Callback(hObject, eventdata, handles)  %%变换声道
% hObject    handle to bhsd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global FS;
global nowplayer;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
plotmark=0;
index=0;
bhsd=wav_exchange(origin);
nowdata=bhsd;
if isplaying(nowplayer)
pause(nowplayer);
end
nowplayer=audioplayer(bhsd,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
myplot(handles.axes1,nowdata,FS*0.1);
%plot(handles.axes1,bhsd);

% --------------------------------------------------------------------
function lzyp_Callback(hObject, eventdata, handles)
% hObject    handle to lzyp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)  %打开文件
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function gjgn_Callback(hObject, eventdata, handles)
% hObject    handle to gjgn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cxb_Callback(hObject, eventdata, handles)
% hObject    handle to cxb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;  %%读入的原文件
sex=identify_sex(origin);  %0:男性  1：女性
if sex==1
    msgbox('我猜是女性!','确定');
end
if sex==0
    msgbox('我猜是男性!','确定');
end
% --------------------------------------------------------------------
function tqsy_Callback(hObject, eventdata, handles)
% hObject    handle to tqsy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function bd_Callback(hObject, eventdata, handles)
% hObject    handle to bd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ly.
function ly_Callback(hObject, eventdata, handles)   %%录音开始
% hObject    handle to ly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myrecord;
global origin;
global nowplayer;
global FS;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
if get(hObject,'String')=='录音'
set(handles.cxbf,'Visible','off');
set(handles.ztbf,'Visible','off');
set(hObject,'String','结束');
myrecord=audiorecorder(44100,16,2);
record(myrecord);
return;
end
if get(hObject,'String')=='结束'
   set(hObject,'String','录音');
   stop(myrecord);
   origin=getaudiodata(myrecord);
   nowplayer=audioplayer(origin,44100);
   set(handles.cxbf,'Visible','on');
   set(handles.ztbf,'String','暂停播放');
   set(handles.ztbf,'Visible','on');
   %plot(handles.axes1,origin);
   nowdata=origin;
   play(nowplayer);
   FS=44100;
   plotmark=0;
   index=0;
   myplot(handles.axes1,nowdata,FS*0.1);
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes1
cla(hObject);

function figure1_CreateFcn(hObject, eventdata, handles)
% --------------------------------------------------------------------
function openfile_ClickedCallback(hObject, eventdata, handles) %打开文件工具栏
% hObject    handle to openfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;  %%读入的原文件
global originplayer;
global nowplayer;
global FS;
global nowdata;
global index;
global plotmark;
global kuaifang;
kuaifang=0;
[filename,pathname]=uigetfile({'*.wav;*.mp3'},'选择音频','off')      %是否能够多选,'off'不支持多选， 'on'支持多选  
if filename~=0
 [origin, FS]= audioread(filename);   %FS 音频采样率
 nowdata=origin;
 %plot(handles.axes1,origin);
 nowplayer=audioplayer(origin,FS);
 play(nowplayer);
 set(handles.cxbf,'Visible','on');
 set(handles.ztbf,'String','暂停播放');
 set(handles.ztbf,'Visible','on');
 plotmark=0;
 index=0;
 myplot(handles.axes1,origin,FS*0.1);
end

% --- Executes on button press in cxbf.
function cxbf_Callback(hObject, eventdata, handles)  %%重新播放
% hObject    handle to cxbf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nowplayer;
global plotmark;
global index;
global nowdata;
global FS;
global kuaifang;
plotmark=0;
index=0;
if isplaying(nowplayer)
    pause(nowplayer);
end
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
if kuaifang==1
    myplot(handles.axes1,nowdata,FS*0.1*1.5);
else
    myplot(handles.axes1,nowdata,FS*0.1);
end
% --- Executes on button press in ztbf.
function ztbf_Callback(hObject, eventdata, handles)  %%暂停播放
% hObject    handle to ztbf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nowplayer;
global plotmark;
global nowdata;
global FS;
global kuaifang;
if get(hObject,'String')=='暂停播放'  %%暂停播放
 plotmark=1;
 set(hObject,'String','继续播放');
 pause(nowplayer);
 return;
else   %%继续播放
 plotmark=0;
 set(hObject,'String','暂停播放');
 resume(nowplayer);
if kuaifang==1
    myplot(handles.axes1,nowdata,FS*0.1*1.5);
else
    myplot(handles.axes1,nowdata,FS*0.1);
end
end

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
delete(hObject);
global nowplayer;
global plotmark;
plotmark=1;
if size(nowplayer)>0
 if isplaying(nowplayer)
    pause(nowplayer);
 end
end

% --------------------------------------------------------------------
function yuanyin_Callback(hObject, eventdata, handles)
% hObject    handle to yuanyin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;
global FS;
global nowplayer;
global kuaifang;
kuaifang=0;
if isplaying(nowplayer)
    pause(nowplayer);
end
nowplayer=audioplayer(origin,FS);
play(nowplayer);
set(handles.ztbf,'String','暂停播放');
set(handles.ztbf,'Visible','on');
plot(handles.axes1,origin);

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function xjyp_Callback(hObject, eventdata, handles)   %%新建音频
% hObject    handle to xjyp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ly,'Visible','on');
set(handles.axes1,'Visible','off');
set(handles.cxbf,'Visible','off');
set(handles.ztbf,'Visible','off');
cla(handles.axes1);
% --------------------------------------------------------------------
function dkyp_Callback(hObject, eventdata, handles)   %%打开音频
% hObject    handle to dkyp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global origin;  %%读入的原文件
global originplayer;
global nowplayer;
global FS;
global nowdata;
global plotmark;
global index;
global kuaifang;
kuaifang=0;
set(handles.axes1,'Visible','on');
[filename,pathname] = uigetfile({'*.wav;*.mp3'},'选择音频','off')      %是否能够多选,'off'不支持多选， 'on'支持多选  
if filename~=0
 [origin, FS]= audioread(filename);   %FS 音频采样率
 nowdata=origin;
 %plot(handles.axes1,origin);
 originplayer=audioplayer(origin,FS);
 nowplayer=originplayer;
 set(handles.cxbf,'Visible','on');
 set(handles.ztbf,'String','暂停播放');
 set(handles.ztbf,'Visible','on');
 set(handles.ly,'Visible','off');
 play(nowplayer);
 plotmark=0;
 index=0;
 myplot(handles.axes1,origin,FS*0.1);
end

% --------------------------------------------------------------------
function savefile_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to savefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nowdata;
global FS;
[filename, pathname] = uiputfile({'*.wav'},'Save as')
if filename~=0
    file=[pathname,filename]
    audiowrite(file,nowdata,FS);
    msgbox('保存成功！','确定');
end

function myplot(axes,wav,step)
global plotmark;
global index;
while plotmark==0  %%播放
    start=index*step+1;
    tail=(index+1)*step;
    if tail>length(wav)
        tail=length(wav);
    end
    x=wav(start:tail,:);
    plot(axes,x);
    drawnow
    pause(0.1);
    index=index+1;
    if(tail==length(wav))
        break;
    end
end
