function [Ang, Ab] = Analyze_mat(fileloc,BW)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    %do this next for only FFT
    
    
    filename=get(fileloc,'string');
    
    load(filename);
     if size(BW)==size('new')
        BW=ones(size(FinalI));
     end
    Ang=angle(FinalI).*BW;
    Ab=FinalIAbmeansub.*BW;
%     
%     
%     h_im = imshow(Ab,range,'Colormap',gray,'initialmagnification',200); axis image; title('Choose region to get average intensity');
%     colormap(flipud(gray));
%     
%     h=imrect(h_im,[100 100 4 4]);
%     position = wait(h);
%     
%     
%     %Catches when I close the window without selecting anything to stop an
%     %error in the main screen
%     if isempty(position)
%         return
%     end
%     e = impoly(gca,position);
%     
%     BW = createMask(e,h_im);
%     selection=FinalIAbmeansub.*BW;
%     meanAb=mean(selection(selection>0));
%     

  %This code worked on the old analysis techniques  
        
%     filename=get(fileloc,'string');
%     load(filename);
% 
%     clear AA;
%     
%     if size(BW)==size('new')
%        BW=ones(size(c0f0));
%     end
%     
%     sizeBW=size(BW);
%     multiple=zeros(sizeBW(1),sizeBW(2),8);
%     for i=1:12
%         multiple(:,:,i)=BW;        
%     end
%       
%     AA(:,:,1)=c0f0+c0f12;
%     AA(:,:,2)=c0f1+c0f13;
%     AA(:,:,3)=c0f2+c0f14;
%     AA(:,:,4)=c0f3+c0f15;
%     AA(:,:,5)=c0f4+c0f16;
%     AA(:,:,6)=c0f5+c0f17;
%     AA(:,:,7)=c0f6+c0f18;
%     AA(:,:,8)=c0f7+c0f19;
%     AA(:,:,9)=c0f8+c0f20;
%     AA(:,:,10)=c0f9+c0f21;
%     AA(:,:,11)=c0f10+c0f22;
%     AA(:,:,12)=c0f11+c0f23;
%     
%     %debug
%     size(AA)
%     filename
%   
%  
% %     for w=1:12
% %      AA(:,:,w)=AA(:,:,w)-mean(mean(AA(:,:,w),2),1);
% %     end
% %     AA(:,:,12)=c0f0+c0f12;
% %     AA(:,:,11)=c0f1+c0f13;
% %     AA(:,:,10)=c0f2+c0f14;
% %     AA(:,:,9)=c0f3+c0f15;
% %     AA(:,:,8)=c0f4+c0f16;
% %     AA(:,:,7)=c0f5+c0f17;
% %     AA(:,:,6)=c0f6+c0f18;
% %     AA(:,:,5)=c0f7+c0f19;
% %     AA(:,:,4)=c0f8+c0f20;
% %     AA(:,:,3)=c0f9+c0f21;
% %     AA(:,:,2)=c0f10+c0f22;
% %     AA(:,:,1)=c0f11+c0f23;
%     
%     AA=AA.*multiple;
%     
%     Z=fft(AA,[],3);
%     Ang= angle(Z(:,:,2));
%     Ab = abs(Z(:,:,2));
%     

end