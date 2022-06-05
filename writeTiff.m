function [ success ] = writeTiff(filesave,imgdata,bitsize,kind)
%This function is going to make my life easier by encapsulating all the
%steps needed to use the LIBTIF library through the TIFF class object to
%make Tiffs in Matlab. I will expand the functionality of this function as
%I need it 

%The first version here will write single images to the name specififed as
%long as the user wants an 8 16 or 32 bit image. 
if ~ismember(bitsize,[8,16,32])
    success=0;
    return;
end

%kind can be RGB, or White for miniswhite or Black for minisblack

if kind=='RGB'
   photomet=2;
elseif kind=='White' | kind=='white'
   photomet=0;
elseif kind=='Black' | kind=='black'
   photomet=1;
else
   success=0
   return
end


t = Tiff(filesave,'w');

tagstruct.ImageLength = size(imgdata,1)
tagstruct.ImageWidth = size(imgdata,2)
tagstruct.Photometric = photomet
tagstruct.BitsPerSample = bitsize
tagstruct.SamplesPerPixel = 1
tagstruct.RowsPerStrip = 16
tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky
tagstruct.Software = 'MATLAB'
t.setTag(tagstruct)
t.write(imgdata);
t.close();

end

