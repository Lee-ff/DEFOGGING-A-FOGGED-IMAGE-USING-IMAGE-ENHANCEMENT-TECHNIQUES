function [out,tt] = main_mmbebhe(I,infile)

%checking if image is color or grayscale
s = size(I);
sz = size(s);
if sz(2)==2
    [out,tt] = code_mmbebhe(I);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_mmbebhe(I(:,:,1));
   [im(:,:,2),tt(:,2)] = code_mmbebhe(I(:,:,2));
   [im(:,:,3),tt(:,3)] = code_mmbebhe(I(:,:,3));
   out = uint8(im -1);
end

%writing output to Output Images folder
[~,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_mmbebhe');
p = strcat('\Output Images\',strcat(p2,ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist');
outhist = strcat('\Output Images\',strcat(p2,'.jpg'));
outhist = strcat(pwd,outhist);
subplot(1,1,1),imhist(out),saveas(gcf,outhist);

end

function val = cal_mean(pI)

num = 0;
sz = size(pI);
bin = abs(sz(1)-sz(2))+1;
for i=1:bin
    num = num + i*pI(i);
end

val = num/sum(pI);

end

function val = cal_mmbe(X,Y)

mbe = abs(mean(X)-mean(Y));
val = min(mbe);

end

function [BBHE,tI] = code_bbhe(I)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF 
pI = H/sum(H);

%MEAN VALUE
meanval = round(cal_mean(pI));

%IMAGE DECOMPOSITION
im_l = H(1:meanval);
im_u = H(meanval+1:bin);

%PDF OF SUBIMAGES
p_l = im_l/sum(im_l);
p_u = im_u/sum(im_u);

%CDF OF SUBIMAGES
c_l = cumsum(p_l);
c_u = cumsum(p_u);

%Transformation Function
tI(1:meanval) = (1) + round((meanval-1)*c_l);
tI(meanval+1:bin) = (meanval+1) + round((bin-meanval+1)*c_u);
tI = tI.';

%Output Image
BBHE = tI(I+1);
BBHE = uint8(BBHE);

end

function [MMBEBHE,tI] = code_mmbebhe(I)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF 
pI = H/sum(H);

%Calling BBHE for mmbeval
BBHE = code_bbhe(I);

%MINIMUM MBE VALUE
mmbeval = round(cal_mmbe(pI,BBHE));

%IMAGE DECOMPOSITION
im_l = H(1:mmbeval);
im_u = H(mmbeval+1:bin);

%PDF OF SUBIMAGES
p_l = im_l/sum(im_l);
p_u = im_u/sum(im_u);

%CDF OF SUBIMAGES
c_l = cumsum(p_l);
c_u = cumsum(p_u);

%Transformation Function
tI(1:mmbeval) = (1) + round((mmbeval-1)*c_l);
tI(mmbeval+1:bin) = (mmbeval+1) + round((bin-mmbeval+1)*c_u);
tI = tI.';

%Output Image
MMBEBHE = tI(I+1);
MMBEBHE = uint8(MMBEBHE);

end