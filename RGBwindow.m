
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)/5 scrsz(4)/5 scrsz(3)*(7/9) scrsz(4)*(5/10)],'Units', 'pixels');
ha = tight_subplot(1,3,.01,[.001 .001],[.001 .001]); 
axes(ha(1)); 

RGBab=real2rgb(BothThreshAb,colormap(flipud(gray)),[0 4e-4]);
subimage(RGBab);
RGBab=real2rgb(BothThreshAb,gray,[0 4e-4]);

title('Both Mag boundary');
axis off;

axes(ha(2)); 
RGBang=real2rgb(BothThreshAng,hsv,[-pi pi]);
subimage(RGBang);
title('Both Ang boundary');
axis off;

RGBcombo=RGBang.*RGBab;
RGBcombo=RGBcombo./max(max(RGBcombo(:)));

axes(ha(3)); 
subimage(RGBcombo);
title('Both phase map');
axis off;
save([get(handles.textSave,'String'),'Ipsi_boundry_variables.mat'],'monboundryline','-append');
