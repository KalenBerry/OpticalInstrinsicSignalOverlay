function DrawFullWindow(hObject, handles)
% hObject    handle to DrawFullWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename=get(handles.fullwindow_text,'String');
fullwindow=imread(filename);
fullwindow=fullwindow(:,:,1);
load('savedthresholds.mat');
binboundryline=imresize(binboundryline,[size(fullwindow,1),size(fullwindow,2)]);
monboundryline=imresize(monboundryline,[size(fullwindow,1),size(fullwindow,2)]);

binfullwind=fullwindow;
binfullwind(binboundryline==1)=255;

monfullwind=fullwindow;
monfullwind(monboundryline==1)=255;

rgbfullwindow=cat(3,binfullwind, monfullwind, fullwindow);

figure;imshow(rgbfullwindow);

max(fullwindow(:))
end