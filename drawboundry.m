function [ output_args ] = drawboundry(filename,type,handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
BW='new';
[Ang,Ab]=Analyze_mat(filename,BW);

if get(handles.phaseROI,'Value')==1
   X=Ang;
   cmap=hsv;
   range=[-pi pi];
else
   X=Ab;
   cmap=gray;
   range=[-1e-4 4e-4];
end

im0=X;

figure(1);
h_im = imshow(X,range,'Colormap',cmap,'initialmagnification',200); axis image; title('Choose ROI from the figure');
if cmap==gray
	colormap(flipud(gray));
end

h = imfreehand;
position = wait(h);

%Catches when I close the window without selecting anything to stop an
%error in the main screen
if isempty(position)
    return
end

e = impoly(gca,position);

BW = createMask(e,h_im);
close figure 1;

[Ang,Ab]=Analyze_mat(filename,BW);



if type=='mon'
    monboundryline=edge(BW);
    if exist(['savedthresholds.mat'],'file')
        save(['savedthresholds.mat'],'monboundryline','-append');
    else
        save(['savedthresholds.mat'],'monboundryline');
    end
elseif type=='bin'
    
    binboundryline=edge(BW);
    if exist(['savedthresholds.mat'],'file')
        save(['savedthresholds.mat'],'binboundryline','-append');
    else
        save(['savedthresholds.mat'],'binboundryline');
    end
    
end
end

