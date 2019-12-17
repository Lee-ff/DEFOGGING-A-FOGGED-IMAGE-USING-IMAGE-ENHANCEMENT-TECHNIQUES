%MMBEBHE FUNCTION
%call main_mmbebhe
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