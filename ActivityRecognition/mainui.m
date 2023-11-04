function varargout = mainui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename('hello world'), ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainui_OpeningFcn, ...
                   'gui_OutputFcn',  @mainui_OutputFcn, ...
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




function mainui_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);





function varargout = mainui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function es_Callback(hObject, eventdata, handles)
core = 'training/cache';
[status,cmdout]=system('NuGET.exe 117G');

selFile = ''
hSign = ''
[file,path] = uigetfile('*.*');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
   selFile = fullfile(path,file);
   cmdd = ['cred.exe -n -otemp.txt ',selFile];   
   disp(cmdd)
   [status,cmdout]=system(cmdd);
   fid = fopen('temp.txt');
   tline = fgetl(fid);
   while ischar(tline)    
    hSign = tline;
    tline = fgetl(fid);
   end
   fclose(fid);
end

im = imread(selFile);
detector = vision.PeopleDetector('ClassificationModel', 'UprightPeople_96x48', 'ClassificationThreshold', 2.5);
bbox = step(detector, im);
im2 = insertObjectAnnotation(im, 'rectangle', bbox, 'person');
figure
imshow(im2);

I = imread(selFile);
figure

imshow(I)

fid = fopen(core);
tline = fgetl(fid);

while ischar(tline)    
    pp = strsplit(tline,',');    
    if strcmp(pp(8),'e') & strcmp(pp(1),hSign)
        if strcmp(pp(2),'NA')
            disp('.')
        else
            position = [str2double(pp(3)),str2double(pp(4)),str2double(pp(5)),str2double(pp(6))];        
            rectangle('Position', position,'EdgeColor','r', 'LineWidth', 3)
            text('Position',[str2double(pp(3)) str2double(pp(4))],'string',pp(2),'Color','yellow','FontSize',12)        
        end
    end     
    tline = fgetl(fid);
end
fclose(fid);

title('Detected Activities using CERN');

cmdd = ['NuGET.exe 117O e ',selFile];
[status,cmdout]=system(cmdd);

if exist(core, 'file')==2
  delete(core);
end


function ps_Callback(hObject, eventdata, handles)
core = 'training/cache';
[status,cmdout]=system('NuGET.exe 117G');

selFile = ''
hSign = ''
[file,path] = uigetfile('*.*');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
   selFile = fullfile(path,file);
   cmdd = ['cred.exe -n -otemp.txt ',selFile];   
   disp(cmdd)
   [status,cmdout]=system(cmdd);
   fid = fopen('temp.txt');
   tline = fgetl(fid);
   while ischar(tline)    
    hSign = tline;
    tline = fgetl(fid);
   end
   fclose(fid);
end

I = imread(selFile);
figure

imshow(I)

fid = fopen(core);
tline = fgetl(fid);

while ischar(tline)    
    pp = strsplit(tline,',');    
    if strcmp(pp(8),'p') & strcmp(pp(1),hSign)
        if strcmp(pp(2),'NA')
            disp('.')
        else
            position = [str2double(pp(3)),str2double(pp(4)),str2double(pp(5)),str2double(pp(6))];        
            rectangle('Position', position,'EdgeColor','r', 'LineWidth', 3)
            text('Position',[str2double(pp(3)) str2double(pp(4))],'string',pp(2),'Color','yellow','FontSize',12)        
        end
    end     
    tline = fgetl(fid);
end
fclose(fid);

title('Detected Activities using CAR');
cmdd = ['NuGET.exe 117O p ',selFile];
[status,cmdout]=system(cmdd);
if exist(core, 'file')==2
  delete(core);
end


function enh_Callback(hObject, eventdata, handles)
core = 'training/cache';
[status,cmdout]=system('NuGET.exe 117G');

selFile = ''
hSign = ''
[file,path] = uigetfile('*.*');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
   selFile = fullfile(path,file);
   cmdd = ['cred.exe -n -otemp.txt ',selFile];   
   disp(cmdd)
   [status,cmdout]=system(cmdd);
   fid = fopen('temp.txt');
   tline = fgetl(fid);
   while ischar(tline)    
    hSign = tline;
    tline = fgetl(fid);
   end
   fclose(fid);
end

I = imread(selFile);
figure

imshow(I)

fid = fopen(core);
tline = fgetl(fid);

while ischar(tline)    
    pp = strsplit(tline,',');    
    if strcmp(pp(8),'x') & strcmp(pp(1),hSign)
        if strcmp(pp(2),'NA')
            disp('.')
        else
            position = [str2double(pp(3)),str2double(pp(4)),str2double(pp(5)),str2double(pp(6))];        
            rectangle('Position', position,'EdgeColor','r', 'LineWidth', 3)
            text('Position',[str2double(pp(3)) str2double(pp(4))],'string',pp(2),'Color','yellow','FontSize',12)        
        end
    end     
    tline = fgetl(fid);
end
fclose(fid);

title('Detected Activities using GAN');
cmdd = ['NuGET.exe 117O x ',selFile];
[status,cmdout]=system(cmdd);
if exist(core, 'file')==2
  delete(core);
end

a = 0.0;
b = 0.0;
c = 0.0;

fid = fopen('functions/estats.txt');
tline = fgetl(fid);
while ischar(tline)    
    pp = strsplit(tline,':');    
    if strcmp(pp(1),'Accuracy')
        a = str2double(pp(2));
    end     
    tline = fgetl(fid);
end
fclose(fid);

fid = fopen('functions/pstats.txt');
tline = fgetl(fid);
while ischar(tline)    
    pp = strsplit(tline,':');    
    if strcmp(pp(1),'Accuracy')
        b = str2double(pp(2));
    end     
    tline = fgetl(fid);
end
fclose(fid);

fid = fopen('functions/xstats.txt');
tline = fgetl(fid);
while ischar(tline)    
    pp = strsplit(tline,':');       
    if strcmp(pp(1),'Accuracy')
        c = str2double(pp(2));
    end     
    tline = fgetl(fid);
end
fclose(fid);

figure
name = {'CERN','CAR','GAN'};
val = {sprintf('%.6f',a),sprintf('%.6f',b),sprintf('%.6f',c)};
x = [1:3]; y = [a,b,c]; 
bar(x,y)
set(gca,'xticklabel',name)

ygap = 0.1;  % Specify vertical gap between the bar and label
for i = 1:length(x) % Loop over each bar 
            xpos = x(i);        % Set x position for the text label
            ypos = y(i) + ygap; % Set y position, including gap
            htext = text(xpos,ypos,val(i));          % Add text label
            set(htext,'VerticalAlignment','bottom',...  % Adjust properties
                      'HorizontalAlignment','center')
end
