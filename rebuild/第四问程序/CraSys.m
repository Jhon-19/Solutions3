function varargout = CraSys(varargin)
% CRASYS MATLAB code for CraSys.fig
%      CRASYS, by itself, creates a new CRASYS or raises the existing
%      singleton*.
%
%      H = CRASYS returns the handle to a new CRASYS or the handle to
%      the existing singleton*.
%
%      CRASYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CRASYS.M with the given input arguments.
%
%      CRASYS('Property','Value',...) creates a new CRASYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CraSys_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CraSys_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CraSys

% Last Modified by GUIDE v2.5 15-Aug-2020 09:42:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CraSys_OpeningFcn, ...
                   'gui_OutputFcn',  @CraSys_OutputFcn, ...
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


% --- Executes just before CraSys is made visible.
function CraSys_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CraSys (see VARARGIN)

% Choose default command line output for CraSys
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
%  ii=imread('BackImg.jpg');
%设置程序的背景图为beijing1.jpg
%  image(ii);
%  colormap gray
set(ha,'handlevisibility','off','visible','off');

% UIWAIT makes CraSys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CraSys_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%axes(handles.axes1);
D1 = 60;  %货运船到码头的距离为60m
D2 = 15;  %整个码头的宽度为15m
l = 15;   %缆绳长度为15m
m = 6000; %货物质量为6000kg
T_limit = 120; %整个吊运时间不超过120s
g = 9.81; %初始化重力加速度
time_exa = 0.01;

t1 = str2double(get(handles.edit1, 'String'));
t3 = str2double(get(handles.edit2, 'String'));
a0 = str2double(get(handles.edit3, 'String'));
% 
% t1 = 8.98;
% t3 = 7.23;
% a0 = 0.5; %初始加速度大小为0.5m/s^2

v1 = a0 * t1;
v2 = v1 - a0 * t3;
S1 = t1 * v1 / 2;
S3 = (v1 + v2) *t3 / 2;
S2 = D1 - S1 - S3;
t2 = S2 / v1;
t4 = D2 / v2;
t_tol = t1 + t2 + t3 + t4;

[theta1_rec_sec, theta1_rec, theta1] = GetTheta_T1(t1, a0, time_exa);
[V_T1] = GetV_T1(t1, a0, theta1_rec, theta1, time_exa);
[m_1] = GetT(theta1_rec_sec, theta1, a0);
[theta2_rec_sec, theta2_rec, theta2] = GetTheta_T2(t1, t2, a0, time_exa);
[V_T2] = GetV_T2(t1, t2, a0, theta2_rec, theta2, time_exa);
[m_2] = GetT(theta2_rec_sec, theta2, 0);
[theta3_rec_sec, theta3_rec, theta3] = GetTheta_T3(t1, t2, t3, a0, -a0, time_exa);
[V_T3] = GetV_T3(t1, t3, a0, -a0, theta3_rec, theta3, time_exa);
[m_3] = GetT(theta3_rec_sec, theta3, -a0);
[theta4_rec_sec, theta4_rec, theta4] = GetTheta_T4(t4, theta3, theta3_rec, time_exa);
[V_T4] = GetV_T4(t1, t3, t4, a0, -a0, theta4_rec, theta4, time_exa);
[m_4] = GetT(theta4_rec_sec, theta4, 0);
v = [V_T1 V_T2 V_T3 V_T4];
m = [m_1 m_2 m_3 m_4];

theta = [theta1 theta2(2:end) theta3(2:end) theta4(2:end)];
x1 = ((0:time_exa:t1) .^2) * a0 / 2;
x2 = (time_exa:time_exa:t2) * (a0 * t1(end)) + x1(end);
if ~isempty(x2)
    x3 = (- a0 * (time_exa:time_exa:t3).^2 / 2) + (a0 * t1 * (time_exa:time_exa:t3)) + x2(end);
else
    x3 = (- a0 * (time_exa:time_exa:t3).^2 / 2) + (a0 * t1 * (time_exa:time_exa:t3)) + x1(end);
end
if ~isempty(x3)
    x4 = (time_exa:time_exa:t4) * (a0 * t1 - a0 * t3) + x3(end);
else
    x4 = (time_exa:time_exa:t4) * (a0 * t1 - a0 * t3) + x2(end);
end
x = [x1 x2 x3 x4];
y = ones(1, length(x)) * 7.5;

xm = x - l * sin(theta);
ym = y - l * cos(theta);

set(handles.text34,'string',num2str(t2));
set(handles.text35,'string',num2str(t4));

Inter = 20;

%Inter = 20; %帧数间隔
fmat=moviein(length(x));%开辟一个动画区间
for i = 1:Inter:length(x)
    hold off  
  
plot1 = plot(x(i),y(i),'LineStyle','none','Color',[0 0 1]);
set(plot1,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerSize',20,...
    'Marker','s');
    hold on 
plot2 = plot(xm(i),ym(i),'LineStyle','none','Color',[0 0 1]);
set(plot2,...
    'MarkerFaceColor',[0 0 0],...
    'MarkerEdgeColor',[0, 0, 0],...
    'MarkerSize',60,...
    'Marker','square',...
    'LineWidth',2);
    plot([x(i),xm(i)],[y(i),ym(i)], [-5,80],[7.5,7.5], 'LineWidth',2,...
    'Color',[0, 0, 1]);
   hold on
   plot([x(i),xm(i)],[y(i),ym(i)], 'LineWidth',2, 'color', 'b');
   plot([x(i),x(i)],[y(i),y(i) - 10], 'LineWidth',0.5, 'LineStyle', '- -', 'Color', 'k');
    axis([-5, 85, -20, 10]); 
set(gca,'xtick',[],'xticklabel',[]);
set(gca,'ytick',[],'yticklabel',[]);
    
vnow = [num2str(v(i)), 'm/s'];
thetanow = [num2str(theta(i)*180/pi), '°'];
if i == 1
    Tsta = 'T1';
elseif abs(i - round(t1 / time_exa)) <= Inter
    Tsta = 'T2';
elseif abs(i - round((t1 + t2) / time_exa)) <= Inter
    Tsta = 'T3';
elseif abs(i - round((t1 + t2 + t3) / time_exa)) <= Inter
    Tsta = 'T4';
end  

set(handles.text10,'string',vnow);
set(handles.text12,'string',thetanow);
set(handles.text14,'string',Tsta);

fmat(:, i) = getframe;
end

movie(fmat, 10);

thetamax = strcat(num2str(max(abs(theta*180/pi))), '°');
vc = strcat(num2str(v(end)), 'm/s');
ttol = strcat(num2str(t_tol), 's');
mmin = strcat(num2str(min(m)), 'kg');
Rate = strcat(num2str(min(m) / t_tol), 'kg/s');

set(handles.text16,'string',thetamax);
set(handles.text18,'string',vc);
set(handles.text20,'string',ttol);
set(handles.text22,'string',mmin);
set(handles.text24,'string',Rate);

function [m] = GetT(theta_rec_sec, theta, a)
%本函数用于求解最大拉力下的最大质量
l = 15;%绳长15m
g = 9.81;%重力加速度
T = 20000 * g;
m  = T ./ ((a + l * theta_rec_sec .* (sin(theta) + cos(theta)) - g) ./ (sin(theta) - cos(theta)));

function [theta1_rec_sec, theta1_rec, theta1] = GetTheta_T1(t1, a, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t1;

theta1 = a / g .* (1 - cos((g / l)^0.5 * t));
theta1_rec = a / ((g * l)^0.5) * sin((g / l)^0.5 * t);
theta1_rec_sec = a / l * cos((g / l)^0.5 * t);

function [theta2_rec_sec, theta2_rec, theta2] = GetTheta_T2(t1, t2, a, time_exa)
%该程序用于求解t1时间段，吊车开始加速时的摆角
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t2;

theta2 = 2 * a / g * sin((g / l)^0.5 * t1 / 2) * sin((g / l)^0.5 * (t + t1 / 2));
theta2_rec = 2 * a / ((g * l)^0.5) * sin((g / l)^0.5 * t1 / 2) * cos((g / l)^0.5 * (t + t1 / 2));
theta2_rec_sec = - 2 * a / l * sin((g / l)^0.5 * t1 / 2) * sin((g / l)^0.5 * (t + t1 / 2));

function [theta3_rec_sec, theta3_rec, theta3] = GetTheta_T3(t1, t2, t3, a_up, a_down, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t3;

theta3_0 = 2 * a_up / g * sin((g / l)^0.5 * t1 / 2) * sin((g / l)^0.5 * (t2 + t1 / 2));
theta3_0rec = 2 * a_up / ((g * l)^0.5) * sin((g / l)^0.5 * t1 / 2) * cos((g / l)^0.5 * (t2 + t1 / 2));
theta3 = a_down / g * (1 - cos((g / l)^0.5 * t)) + theta3_0 * cos((g / l)^0.5 * t) + theta3_0rec * (g / l)^0.5 * sin((g / l)^0.5 * t);
theta3_rec = a_down / g * (g / l)^0.5 * sin((g / l)^0.5 * t) - theta3_0 * (g / l)^0.5 * sin((g / l)^0.5 * t) + theta3_0rec * g / l * cos((g / l)^0.5 * t);
theta3_rec_sec = a_down / l * cos((g / l)^0.5 * t) - theta3_0 * g / l * cos((g / l)^0.5 * t) - theta3_0rec * ((g / l)^1.5) * sin((g / l)^0.5 * t);

function [theta4_rec_sec, theta4_rec, theta4] = GetTheta_T4(t4, theta3, theta3_rec, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t4;

theta4 = theta3(end) * cos((g / l)^0.5 * t) + theta3_rec(end) / ((g / l)^0.5) * sin((g / l)^0.5 * t);
theta4_rec = -(g / l)^0.5 * theta3(end) * sin((g / l)^0.5 * t) + theta3_rec(end) * cos((g / l)^0.5 * t);
theta4_rec_sec = - theta3(end) * g / l * cos((g / l)^0.5 * t) - theta3_rec(end) * ((g / l)^0.5) * sin((g / l)^0.5 * t);

function [v] = GetV_T1(t1, a0, theta1_rec, theta1, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t1;

vs = t * a0;
vf  = theta1_rec * l;
v = vs - vf .* cos(theta1);

function [v] = GetV_T2(t1, t2, a0, theta2_rec, theta2, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t2;

vs = t1 * a0;
vf  = theta2_rec * l;
v = vs - vf .* cos(theta2);

function [v] = GetV_T3(t1, t3, a_up, a_down, theta3_rec, theta3, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t3;

vs = a_down * t + t1 * a_up;
vf  = theta3_rec * l;
v = vs - vf .* cos(theta3);

function [v] = GetV_T4(t1, t3, t4, a_up, a_down, theta4_rec, theta4, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t4;

vs = a_down * t3 + t1 * a_up;
vf  = theta4_rec * l;
v = vs - vf .* cos(theta4);
